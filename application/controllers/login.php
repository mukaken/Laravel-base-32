<?php

/**
 * ログインコントローラー
 *
 * ログインとログアウトの処理
 *
 * Laravelの可読性の高さを味わっていただくため、
 * コメントは最低限にしております。
 */
class Login_Controller extends Base_Controller
{
	public $restful = true;

	public function __construct()
	{
		parent::__construct();

		// 全POSTメソッドに対してCSRFトークンのチェック
		$this->filter('before', 'csrf')->on('post');
	}

	public function get_login()
	{
		return View::make('login');
	}

	public function post_login()
	{
		$rules = array(
			'username' => 'required|alpha_dash',
			'password' => 'required',
		);

		$inputs = Input::only(array('username', 'password'));
		$val = Validator::make($inputs, $rules);

		if ( $val->passes() ) {
			// バリデーション通過
			if ( Auth::attempt($inputs) ) {
				// ログイン成功
				return Redirect::home()->with('message', 'ログインしました。');
			}
			else {
				// ログイン失敗
				return Redirect::to_route('login')->with_input()
						->with('notice', 'ユーザー名とパスワードを正しく指定してください。');
			}
		}
		else {
			// バリデーション失敗
			return Redirect::to_route('login')->with_input()->with_errors($val->errors)
					->with('notice', '項目を修正してください。');
		}
	}

	public function get_logout()
	{
		Auth::logout();

		return Redirect::home()->with('message', 'ログアウトしました。');
	}

}