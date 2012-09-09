<?php

/**
 * レスポンス送信前のイベントをキャッチするリスナーを登録
 *
 * 現状、実際はレンダーされるビューは先に送信（表示）されてしまう
 * そのため、内容をこのリスナー内で書き換えても無駄になる。
 */
Event::listen('laravel.done',
    function($response)
    {
        $code = $response->foundation->getStatusCode();
        if(in_array($code, array(200))) {
            if ( ! PCache::has()) {
                PCache::put($response);
            }
        }
    });