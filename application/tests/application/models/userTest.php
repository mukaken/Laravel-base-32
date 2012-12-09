<?php

class TestUserModel extends PHPUnit_Framework_TestCase
{
	/*
	 * テストクラスのセットアップコード
	 * マイグレーションを行い、セッションの使用を宣言
	 */

	public static function setUpBeforeClass()
	{
		Tests\Helper::migrate();
		Tests\Helper::use_sessions();
	}

	/*
	 * テストごとのセットアップコード
	 * usersテーブルをクリア
	 */

	public function setUp()
	{
		DB::table('users')->delete();
	}

	/*
	 * ユーザーの追加とログインのテスト
	 */

	public function testUserShouldSignupAndLogin()
	{
		// 追加が上手く行われるか
		$params = array(
			'username' => 'example',
			'email' => 'example@gmail.com',
			'password' => 'secret',
		);

		$this->assertTrue(User::add($params));

		// たった今登録したユーザーでログインできるか
		$credentials = array(
			'username' => 'example',
			'password' => 'secret',
		);
		$this->assertTrue(Auth::attempt($credentials));
	}

	/*
	 * パスワードリセットのテスト
	 */
	public function testUserShouldResetPassword()
	{
		$username = 'TestExample';
		$old_password = 'secret';

		$params = array(
			'username' => $username,
			'email' => 'example@gmail.com',
			'password' => $old_password,
		);

		User::add($params);
		$user = User::where('username', '=', $username)->first();
		$new_password = $user->reset_password();

		// 新しいパスワードが古いパスワードと異なっているか
		$this->assertNotEquals($new_password, $old_password,'新旧パスワードの比較');

		// 新しいパスワードでログインできるか
		$credentials = array(
			'username' => $username,
			'password' => $new_password,
		);
		$this->assertTrue(Auth::attempt($credentials),'新しいパスワードでのログイン');
	}

}