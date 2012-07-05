<?php

/**
 * Load the Markdown library.
 */
require_once __DIR__.'/libraries/markdown.php';
/**
 * Get the root path for the documentation Markdown.
 *
 * @return string
 */
function doc_root() {
    return path('app').'docs/';
}

/**
 * Get the parsed Markdown contents of a given page.
 *
 * @param  string  $page Page
 * @return string
 */
function document($page) {
    return Markdown(file_get_contents(doc_root().$page.'.md'));
}

/**
 * Determine if a documentation page exists.
 *
 * @param  string  $page Page
 * @return bool
 */
function document_exists($page) {
    return file_exists(doc_root().$page.'.md');
}

/**
 * Route definitions
 */
Route::get('(:bundle)/(:any)/(:num?)', function($section, $ver = 0)
    {
        return generate_page($section, null, null, $ver);
    });
Route::get('(:bundle)/(ja|en)/(:any)/(:num?)', function($lang, $section, $ver = 0)
    {
        return generate_page($section, null, $lang, $ver);
    });
Route::get('(:bundle)/(:any)/(:any)/(:num?)', function($section, $page, $ver = 0)
    {
        return generate_page($section, $page, null, $ver);
    });
Route::get('(:bundle)/(ja|en)/(:any)/(:any)/(:num?)', function($lang, $section, $page, $ver = 0)
    {
        return generate_page($section, $page, $lang, $ver);
    });
/**
 * Generate page from md file
 * @param type $section
 * @param type $page
 * @param type $lang
 * @param type $ver
 * @return type
 */
function generate_page($section, $page = null, $arg_lang = '', $ver = 0) {

    if (PCache::has())
    {
        return PCache::get();
    }

    $lang = $arg_lang == '' ? 'ja' : $arg_lang;

    if ($page)
    {
        $file = $ver.'/'.$lang.'/'.$section.'/'.$page;
    }
    elseif (document_exists($ver.'/'.$lang.'/'.$section.'/home'))
    {
        $file = $ver.'/'.$lang.'/'.$section.'/home';
    }
    else
    {
        $file = $ver.'/'.$lang.'/'.$section;
    }

    if (document_exists($file))
    {
        $base = URL::base().'/'.URI::segment(1).'/';

        if ($arg_lang == 'ja')
        {
            $ja_link = URL::current();
            $en_link = str_replace('/ja/', '/en/', URL::current());
        }
        elseif ($arg_lang == 'en')
        {
            $ja_link = str_replace('/en/', '/ja/', URL::current());
            $en_link = URL::current();
        }
        else
        {
            $ja_link = str_replace('/'.URI::segment(1).'', '/'.URI::segment(1).'/ja', URL::current());
            $en_link = str_replace('/'.URI::segment(1).'', '/'.URI::segment(1).'/en', URL::current());
        }

        $view = View::make('docs::page')
            ->with('content', document($file))
            ->with('sidebar', document($ver.'/'.$lang.'/'.'contents'))
            ->with('version', file_get_contents(doc_root().$ver.'/version.txt'))
            ->with('ja_link', $ja_link)
            ->with('en_link', $en_link);

        // If specified language, then replace link address
        if ($arg_lang != '')
        {
            $view->sidebar = str_replace($base, $base.$arg_lang.'/', $view->sidebar);
            $view->content = str_replace($base, $base.$arg_lang.'/', $view->content);
        }

        // If a version specified, then replace link address
        if ($ver != 0)
        {
            $seed = '/'.preg_quote(URL::base().'/', '/').'[a-zA-Z0-9\.\-_%\/]+/';
            $replace = '$0/'.$ver;
            $view->sidebar = preg_replace($seed, $replace, $view->sidebar);
            $view->content = preg_replace($seed, $replace, $view->content);
        }

        return $view;
    }
    else
    {
        return Response::error('404');
    }
}

/**
 * レスポンス送信前のイベントをキャッチするリスナーを登録
 *
 * 現状、レンダーされるビューは先に送信（表示）されてしまう。
 * そのため、内容をこのリスナー内で書き換えても無駄になる。
 */
Event::listen('laravel.done', function($response)
    {
        $code = $response->foundation->getStatusCode();
        if (in_array($code, array(200)) and starts_with(URI::current(), 'docs'))
        {
            if (!PCache::has())
            {
                PCache::put($response);
            }
        }
    });