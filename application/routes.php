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
 * ルート(root)（トップ）
 */
Route::get('/', function() {
		return View::make('home.index');
	});

/*
 * 管理者エリアのトップページ（ダミー）
 */

Route::get('admin/home', function() {
		return view('admin.admin-home');
	});

/**
 * ドキュメント、日本語用に変更
 */
Route::get('docs', function() {
		return Redirect::to('docs/home');
	});

/*
 * ログインフォーム
 */
Route::get('login', function() {
		return view('form.login');
	});

Route::post('login',
	array(
	'before' => 'csrf',
	function() {
		if ( Form_Login::is_valid() )
		{ // 認証前のバリデーションは多分抜いても大丈夫
			if ( Auth::attempt(Input::only(array(
						'username',
						'password' ))) )
			{
				return Redirect::home()
						->with('message', __('auth.success')); // ルートへ
			}
			else
			{
				return Redirect::back()
						->with_input()
						->with('warning', __('auth.failed'));
			}
		}
		else
		{
			return Redirect::back()
					->with_input()
					->with_errors(Form_Login::$validation);
		}
	} ));

/*
 * ログオフルート
 */
Route::get('logout',
	function() {
		Auth::logout();

		return Redirect::home()
				->with('message', __('auth.logoff'));
	});

/*
 * サインアップフォーム
 */
Route::get('signup', function() {
		return view('form.signup');
	});

Route::post('signup',
	array(
	'before' => 'csrf',
	function() {
		if ( Form_Signup::is_valid() )
		{
			$user = User::create(Input::only(array(
						'username',
						'password',
						'email'
						)
					)
			); // ユーザー作成

			Auth::login($user->id); // ログインさせる

			return Redirect::home()->with('message', __('auth.created')); // ルートへ
		}
		else
		{
			return Redirect::back()->with_input()->with_errors(Form_Signup::$validation);
		}
	} ));

/*
 * 英語表示切替
 */
Route::get('set/english',
	array(
	'as' => 'set-english',
	function() {
		Cookie::forever('language', 'en');
		return Redirect::home();
	}
));

/*
 * 日本語表示切替
 */
Route::get('set/japanese',
	array(
	'as' => 'set-japanese',
	function() {
		Cookie::forever('language', 'ja');
		return Redirect::home();
	}
));

/**
 * テンプレートコンポーサー
 *
 * テンプレートが生成される場合に呼び出される
 * セッションにメッセージが存在する場合、
 * ビューに変数として渡す。
 *
 * これにより、ビューとリダイレクト両方で
 * ->with('message', 'メッセージ内容')の形で
 * メッセージを指定できる
 *
 */
View::composer('template',
	function($view) { {
			if ( !isset($view->warning) )
			{
				$view->warning = Session::get('warning', false);
			}
			if ( !isset($view->notice) )
			{
				$view->notice = Session::get('notice', false);
			}
			if ( !isset($view->message) )
			{
				$view->message = Session::get('message', false);
			}
		}
	});

/*
 * Artisanコマンドをフォームから実行
 *
 * 当然、実働環境ではコメントにするか、削除すること
 *
 */
Route::get('command',
	function() {
		$commands = Command::get();
		return view('command.artisan')->with('commands', $commands);
	});

Route::post('command',
	function() {
		// バリディーション項目を設定していないため、
		// 常にtrueになるが、将来追加した時のため、
		// コードを入れておく
		if ( Form_Command::is_valid() )
		{
			if ( Input::has('command') )
			{
				// 入力を空白で区切って配列にする
				$command = explode(' ', Input::get('command', ''));
			}
			else
			{
				// 何も指定されない場合は、ヘルプを出力
				$command = array(
					'help:commands' );
			}

			// 出力のバッファリング開始
			ob_start();

			try {
				// コマンド実行
				require path('sys').'cli/dependencies'.EXT;
				Laravel\CLI\Command::run($command);
			}
			catch ( Exception $ex ) {
				// $buff、$ex、どちらのエラーが良いか判断つかず、ペンディング
				$buff = str_replace(PHP_EOL, '<br />', ob_get_contents());
				return Redirect::back()->with_input()->with('warning', $ex->getMessage());
			}

			$buff = str_replace(PHP_EOL, '<br />', ob_get_contents());

			// 内容を出力せず、バッファリング終了
			ob_end_clean();

			return Redirect::back()->with_input()->with('message', $buff);
		}
		else
		{
			return Redirect::back()
					->with_input()
					->with_errors(Form_Command::$validation);
		}
	});

Route::post('command-selected',
	function() {
		// バリディーション項目を設定していないため、
		// 常にtrueになるが、将来追加した時のため、
		// コードを入れておく
		if ( Form_Command::is_valid() )
		{
			if ( Input::get('commands', '0') != '0' )
			{
				// コマンドを空白で区切って配列にする
				$command = explode(' ', Command::command_string(Input::get('commands', '')));
			}
			else
			{
				return Redirect::back()->with_input()->with('warning', '実行する項目を選んでください');
			}

			// 出力のバッファリング開始
			ob_start();

			try {
				// コマンド実行
				require path('sys').'cli/dependencies'.EXT;
				Laravel\CLI\Command::run($command);
			}
			catch ( Exception $ex ) {
				// $buff、$ex、どちらのエラーが良いか判断つかず、ペンディング
				$buff = str_replace(PHP_EOL, '<br />', ob_get_contents());
				return Redirect::back()->with_input()->with('warning', $ex->getMessage());
			}

			$buff = str_replace(PHP_EOL, '<br />', ob_get_contents());

			// 内容を出力せず、バッファリング終了
			ob_end_clean();

			return Redirect::back()->with_input()->with('message', $buff);
		}
		else
		{
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

Event::listen('404', function() {
		return Response::error('404');
	});

Event::listen('500', function() {
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

Route::filter('before',
	function() {
		// アプリケーションに対する全てのリクエストの前に行うコードをここに記述
		// 全入力のトリム処理
		Input::replace(array_map('trim', Input::all()));

		// クッキー、ブラウザ設定から表示言語を決定する
		// LaravelはURLのドメイン名直後に言語コードを
		// 指定することにより、Langクラスで使用する
		// デフォルト言語を切り替えられる。
		//
		// 例）sample.com/en/top 英語表示へ
		//
		// これは多少ダサいので、以下の動作をさせる
		//  1 ) 明確に指定された場合は、クッキーに保存し
		//      以降はその言語で表示
		//  2 ) 指定されていない場合は、ブラウザの言語設定
		//      から表示言語を決定

		$default = Config::get('language.fallback', 'en');

		if ( Cookie::has('language') )
		{
			Config::set('application.language', Cookie::get('language'));
		}
		elseif ( !isset($_SERVER['HTTP_ACCEPT_LANGUAGE']) ) // IEは未設定を許す
		{
			Config::set('application.language', $default);
		}
		else
		{
			// 最初にデフォルト言語をセットしておく
			Config::set('application.language', $default);

			// ブラウザの言語設定を読み込む
			$lang = explode(',', $_SERVER['HTTP_ACCEPT_LANGUAGE']);

			// $langs[言語コード] = プライオリティの形式に変換
			$langs = array( );
			foreach ( $lang as $key => $code_priority ) {
				if ( preg_match('/(.+);q=([0-9\.]+)/', $code_priority, $matched) === 1 )
				{
					$langs[$matched[1]] = $matched[2];
				}
				else
				{
					$langs[$code_priority] = '1'; // デフォルト値
				}
			}
			// プライオリティ（配列の値）でソート
			arsort($langs);

			// サポート言語として存在するかチェック
			foreach ( $langs as $code => $priority ) {
				if ( in_array($code, Config::get('language.support')) )
				{
					Config::set('application.language', $code);
					break;
				}
			}
		}
	});

Route::filter('after',
	function($response) {
		// アプリケーションに対する全てのリクエストの後に行うコードをここに記述
		// 例えばコンテンツ出力中の'Laravel'を'FuelPHP'に変換したければ
		// if ( in_array($response->status(), array('200'))) {
		// 	$response->content = str_replace('Laravel', 'FuelPHP', $response->content);
		// }
	});

Route::filter('csrf', function() {
		if ( Request::forged() )
			return Response::error('500');
	});

Route::filter('auth',
	function() {
		if ( Auth::guest() )
			return Redirect::to('login')->with('notice', __('auth.require'));
	});

/*
 * adminで始まるURL全部にauthフィルターを適用する
 */
Route::filter('pattern: admin/*', 'auth');

/*
 * バンドルの設定ファイルを変更する
 * 直接変更すると、アップデート時に
 * 上書きされるため、イベントを拾って設定
 */
Event::listen('laravel.started: sample',
	function() {
		// 変更する設定が少ない場合
		Config::set('sample::melon.color', 'red');
		// 変更する設定が多い場合は、
		// 別のファイルに設定し読み込んだほうが便利
		// $config = require_once path('app').'config/melon.php';
		// Config::set('sample::melon', array_merge(Config::get('sample::melon'), $config));
	});

/*
 * 依存性注入
 */

include_once path('app').'dependencies.php';
