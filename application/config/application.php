<?php

/*
 * ブラウザの言語設定から、言語を読み込むために追加
 *
 * 一度、変数に受け取るのは、クロージャーとして直接コードしてしまうと、
 * デフォルト言語設定がコアの内部で参照されるごとに、そのクロージャーが
 * 実行されてしまうため。デフォルト言語の参照は、多国語化を行う
 * 場合、数多く実行される可能性がある。
 */
$language_from_browser_setting = value(function() {
		// IEの場合、言語設定を行わないこともできる。
		if ( !isset($_SERVER['HTTP_ACCEPT_LANGUAGE']) ) {
			return Laravel\Config::get('language.fallback');
		}
		else {
			// ブラウザの言語設定を読み込む
			$lang = explode(',', $_SERVER['HTTP_ACCEPT_LANGUAGE']);

			// $langs[言語コード] = プライオリティの形式に変換
			$langs = array( );
			foreach ( $lang as $key => $code_priority ) {
				if ( preg_match('/(.+);q=([0-9\.]+)/', $code_priority, $matched) === 1 ) {
					$langs[$matched[1]] = $matched[2];
				}
				else {
					$langs[$code_priority] = '1'; // default value
				}
			}
			// プライオリティ（配列の値）でソート
			arsort($langs);

			foreach ( $langs as $code => $priority ) {
				// サポート言語として存在するかチェック
				if ( in_array($code, Laravel\Config::get('language.support')) ) {
					return $code;
				}
			}
			// 存在しない場合フォールバック言語を使用する
			return Laravel\Config::get('language.fallback');
		};
	});

return array(
	/*
	  |--------------------------------------------------------------------------
	  | Application URL
	  |--------------------------------------------------------------------------
	  |
	  | The URL used to access your application without a trailing slash. The URL
	  | does not have to be set. If it isn't we'll try our best to guess the URL
	  | of your application.
	  |
	 */

	// URLは自動的に求められるが、サーバーの設定ミスがあるとトラブルが起きることもある。
	// そのため、本番環境では、生成されるURLのベースを指定したほうが、より安全

	'url' => '',
	/*
	  |--------------------------------------------------------------------------
	  | Asset URL
	  |--------------------------------------------------------------------------
	  |
	  | The base URL used for your application's asset files. This is useful if
	  | you are serving your assets through a different server or a CDN. If it
	  | is not set, we'll default to the application URL above.
	  |
	 */

	// CDNを用い、画像などのアセットを他のサーバーから読み込むときに設定する。

	'asset_url' => '',
	/*
	  |--------------------------------------------------------------------------
	  | Application Index
	  |--------------------------------------------------------------------------
	  |
	  | If you are including the "index.php" in your URLs, you can ignore this.
	  | However, if you are using mod_rewrite to get cleaner URLs, just set
	  | this option to an empty string and we'll take care of the rest.
	  |
	 */

	// ApacheのModRewriteが動作する場合、index.phpをURLから省ける
	// その場合は、indexを空文字列にする。
	// ModRewirteが動作しない場合は、'index.php'を指定する。

	'index' => '',
	/*
	  |--------------------------------------------------------------------------
	  | Application Key
	  |--------------------------------------------------------------------------
	  |
	  | This key is used by the encryption and cookie classes to generate secure
	  | encrypted strings and hashes. It is extremely important that this key
	  | remain secret and should not be shared with anyone. Make it about 32
	  | characters of random gibberish.
	  |
	 */

	// 32文字のでたらめな文字列。数字と英字で構成すること。

	'key' => 'FIypdZZHKecRoQIWOhFoI4X245ZURFfn',
	/*
	  |--------------------------------------------------------------------------
	  | Profiler Toolbar
	  |--------------------------------------------------------------------------
	  |
	  | Laravel includes a beautiful profiler toolbar that gives you a heads
	  | up display of the queries and logs performed by your application.
	  | This is wonderful for development, but, of course, you should
	  | disable the toolbar for production applications..
	  |
	 */

	// プロファイラーの表示、実働環境なので当然表示しない。

	'profiler' => false,
	/*
	  |--------------------------------------------------------------------------
	  | Application Character Encoding
	  |--------------------------------------------------------------------------
	  |
	  | The default character encoding used by your application. This encoding
	  | will be used by the Str, Text, Form, and any other classes that need
	  | to know what type of encoding to use for your awesome application.
	  |
	 */

	'encoding' => 'UTF-8',
	/*
	  |--------------------------------------------------------------------------
	  | Application Language
	  |--------------------------------------------------------------------------
	  |
	  | The default language of your application. This language will be used by
	  | Lang library as the default language when doing string localization.
	  |
	 */

	// 使用言語を固定する場合、直接言語コードを指定してください。
	// 英語なら、'en',日本語なら'ja'です。

	'language' => $language_from_browser_setting,
	/*
	  |--------------------------------------------------------------------------
	  | Supported Languages
	  |--------------------------------------------------------------------------
	  |
	  | These languages may also be supported by your application. If a request
	  | enters your application with a URI beginning with one of these values
	  | the default language will automatically be set to that language.
	  |
	 */

	'languages' => array( ),
	/*
	  |--------------------------------------------------------------------------
	  | SSL Link Generation
	  |--------------------------------------------------------------------------
	  |
	  | Many sites use SSL to protect their users data. However, you may not be
	  | able to use SSL on your development machine, meaning all HTTPS will be
	  | broken during development.
	  |
	  | For this reason, you may wish to disable the generation of HTTPS links
	  | throughout your application. This option does just that. All attempts
	  | to generate HTTPS links will generate regular HTTP links instead.
	  |
	 */

	'ssl' => true,
	/*
	  |--------------------------------------------------------------------------
	  | Application Timezone
	  |--------------------------------------------------------------------------
	  |
	  | The default timezone of your application. The timezone will be used when
	  | Laravel needs a date, such as when writing to a log file or travelling
	  | to a distant star at warp speed.
	  |
	 */

	'timezone' => 'Asia/Tokyo',
	/*
	  |--------------------------------------------------------------------------
	  | Class Aliases
	  |--------------------------------------------------------------------------
	  |
	  | Here, you can specify any class aliases that you would like registered
	  | when Laravel loads. Aliases are lazy-loaded, so feel free to add!
	  |
	  | Aliases make it more convenient to use namespaced classes. Instead of
	  | referring to the class using its full namespace, you may simply use
	  | the alias defined here.
	  |
	 */

	// クラスのエイリアス
	// Laravelではクラスのエイリアスはユーザーが自由に定義できる

	'aliases' => array(
		'Auth' => 'Laravel\\Auth',
		'Authenticator' => 'Laravel\\Auth\\Drivers\\Driver',
		'Asset' => 'Laravel\\Asset',
		'Autoloader' => 'Laravel\\Autoloader',
		'Blade' => 'Laravel\\Blade',
		'Bundle' => 'Laravel\\Bundle',
		'Cache' => 'Laravel\\Cache',
		'Config' => 'Laravel\\Config',
		'Controller' => 'Laravel\\Routing\\Controller',
		'Cookie' => 'Laravel\\Cookie',
		'Crypter' => 'Laravel\\Crypter',
		'DB' => 'Laravel\\Database',
		'Eloquent' => 'Laravel\\Database\\Eloquent\\Model',
		'Event' => 'Laravel\\Event',
		'File' => 'Laravel\\File',
		'Filter' => 'Laravel\\Routing\\Filter',
		'Form' => 'Laravel\\Form',
		'Hash' => 'Laravel\\Hash',
		'HTML' => 'Laravel\\HTML',
		'Input' => 'Laravel\\Input',
		'IoC' => 'Laravel\\IoC',
		'Lang' => 'Laravel\\Lang',
		'Log' => 'Laravel\\Log',
		'Memcached' => 'Laravel\\Memcached',
		'Paginator' => 'Laravel\\Paginator',
		'Profiler' => 'Laravel\\Profiling\\Profiler',
		'URL' => 'Laravel\\URL',
		'Redirect' => 'Laravel\\Redirect',
		'Redis' => 'Laravel\\Redis',
		'Request' => 'Laravel\\Request',
		'Response' => 'Laravel\\Response',
		'Route' => 'Laravel\\Routing\\Route',
		'Router' => 'Laravel\\Routing\\Router',
		'Schema' => 'Laravel\\Database\\Schema',
		'Section' => 'Laravel\\Section',
		'Session' => 'Laravel\\Session',
		'Str' => 'Laravel\\Str',
		'Task' => 'Laravel\\CLI\\Tasks\\Task',
		'URI' => 'Laravel\\URI',
		'Validator' => 'Laravel\\Validator',
		'View' => 'Laravel\\View',
	),
);
