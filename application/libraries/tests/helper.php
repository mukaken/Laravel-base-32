<?php

namespace Tests;

/*
  The test helper
 */

class Helper
{

	/**
	 * テスト環境でマイグレーションを実行
	 */
	public static function migrate()
	{

		// 事前にテストデーターをマイグレーション済みの場合
		// このグローバル変数を作成しておく
		if ( !isset($GLOBALS['migrated_test_database']) ) {
			// マイグレーションの実行
			require path('sys').'cli/dependencies'.EXT;
			\Laravel\CLI\Command::run(array( 'migrate:install' ));
			\Laravel\CLI\Command::run(array( 'migrate' ));

			// マイグレーションが行われたことを宣言
			$GLOBALS['migrated_test_database'] = true;
		}
	}

	/*
	 * 認証のため、セッションを有効にする
	 */

	public static function use_sessions()
	{
		\Session::started() or \Session::load();
	}

	/*
	 * 
	  Simulates a request to the router re-setting
	  the Method
	 */

	public static function http_request($method, $route)
	{
		$request = \Router::route($method, 'users/signup');
		\Request::setMethod($method);

		return $request->call();
	}

}