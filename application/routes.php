<?php

/*
  |--------------------------------------------------------------------------
  | Application Routes
  |--------------------------------------------------------------------------
  |
  | Simply tell Laravel the HTTP verbs and URIs it should respond to. It is a
  | breeze to setup your application using Laravel's RESTful routing and it
  | is perfectly suited for building large applications and simple APIs.
  |
  | Let's respond to a simple GET request to http://example.com/hello:
  |
  |		Route::get('hello', function()
  |		{
  |			return 'Hello World!';
  |		});
  |
  | You can even respond to more than one URI:
  |
  |		Route::post(array('hello', 'world'), function()
  |		{
  |			return 'Hello World!';
  |		});
  |
  | It's easy to allow URI wildcards using (:num) or (:any):
  |
  |		Route::put('hello/(:any)', function($name)
  |		{
  |			return "Welcome, $name.";
  |		});
  |
 */

/*
 * ルート、オリジナルのまま変更なし
 */
Route::get('/', function()
	{
		return View::make('home.index');
	});

/*
 * 管理者エリアのトップページ（ダミー）
 */

Route::get('admin/home', function()
	{
		return view('admin.admin-home');
	});

/**
 * ドキュメント、日本語用に変更
 */
Route::get('docs', function()
	{
		return Redirect::to('docs/home');
	});

/*
 * ログインフォーム
 */
Route::get('login', function()
	{
		return view('form.login');
	});

Route::post('login',
	array('before' => 'csrf', function()
	{
		if (Form_Login::is_valid()) // 認証前のバリデーションは多分抜いても大丈夫
		{
			if (Auth::attempt(array(
					'username' => Input::get('username'),
					'password' => Input::get('password'))))
			{
				return Redirect::home()->with('message', __('auth.success')); // ルートへ
			}
			else
			{
				return Redirect::back()->with_input()->with('warning', __('auth.failed'));
			}
		}
		else
		{
			return Redirect::back()->with_input()->with_errors(Form_Login::$validation);
		}
	}));

/*
 * ログオフルート
 */
Route::get('logout', function()
	{
		Auth::logout();

		return Redirect::home()->with('message', __('auth.logoff'));
	});

/*
 * サインアップフォーム
 */
Route::get('signup', function()
	{
		return view('form.signup');
	});

Route::post('signup',
	array('before' => 'csrf', function()
	{
		if (Form_Signup::is_valid())
		{
			$user = User::create(Input::only(array('username', 'password', 'email'))); // ユーザー作成

			Auth::login($user->id); // ログインさせる

			return Redirect::home()->with('message', __('auth.created')); // ルートへ
		}
		else
		{
			return Redirect::back()->with_input()->with_errors(Form_Signup::$validation);
		}
	}));

/*
 * Artisanコマンドをフォームから実行
 *
 * 当然、実働環境ではコメントにするか、削除すること
 *
 */
Route::get('command', function()
	{
		return view('command.artisan');
	});

Route::post('command',
	function()
	{
		if (Form_Command::is_valid())
		{
			// 入力を空白で区切って配列にする
				$command = explode(' ',Input::get('command', ''));

			// 出力のバッファリング開始
			ob_start();

			try
			{
				require path('sys').'cli/dependencies'.EXT;
				Laravel\CLI\Command::run($command);
			}
			catch (Exception $ex)
			{
				$buff = str_replace(PHP_EOL, '<br />', ob_get_contents());
				return Redirect::back()->with_input()->with('warning', $ex->getMessage());
			}

			$buff = str_replace(PHP_EOL, '<br />', ob_get_contents());

			// 内容を出力せず、バッファリング終了
			ob_end_clean();

			Redirect::back()->with_input()->with('message', str_replace(PHP_EOL, '<br />', $buff));

		} else {
				return Redirect::back()
					->with_input()
					->with_errors(Form_Command::$validation);
		}
	});

/*
  |--------------------------------------------------------------------------
  | Application 404 & 500 Error Handlers
  |--------------------------------------------------------------------------
  |
  | To centralize and simplify 404 handling, Laravel uses an awesome event
  | system to retrieve the response. Feel free to modify this function to
  | your tastes and the needs of your application.
  |
  | Similarly, we use an event to handle the display of 500 level errors
  | within the application. These errors are fired when there is an
  | uncaught exception thrown in the application.
  |
 */

Event::listen('404', function()
	{
		return Response::error('404');
	});

Event::listen('500', function()
	{
		return Response::error('500');
	});

/*
  |--------------------------------------------------------------------------
  | Route Filters
  |--------------------------------------------------------------------------
  |
  | Filters provide a convenient method for attaching functionality to your
  | routes. The built-in before and after filters are called before and
  | after every request to your application, and you may even create
  | other filters that can be attached to individual routes.
  |
  | Let's walk through an example...
  |
  | First, define a filter:
  |
  |		Route::filter('filter', function()
  |		{
  |			return 'Filtered!';
  |		});
  |
  | Next, attach the filter to a route:
  |
  |		Router::register('GET /', array('before' => 'filter', function()
  |		{
  |			return 'Hello World!';
  |		}));
  |
 */

Route::filter('before', function()
	{
// アプリケーションに対する全てのリクエストの前に行うコードをここに記述
	});

Route::filter('after', function($response)
	{
// アプリケーションに対する全てのリクエストの後に行うコードをここに記述
	});

Route::filter('csrf', function()
	{
		if (Request::forged())
			return Response::error('500');
	});

Route::filter('auth',
	function()
	{
		if (Auth::guest())
			return Redirect::to('login')->with('notice', __('auth.require'));
	});

/*
 * adminで始まるURL全部にauthフィルターを適用する
 */
Route::filter('pattern: admin/*', 'auth');

