<?php

class User_Controller extends Base_Controller
{
	/**
	 * このコントローラーはRESTフルな動作をさせる
	 * RESTフル(restful)とは、HTTPメソッドにより
	 * プログラムの動作を制御すること。
	 *
	 * この変数をtureにした場合、アクションメソッド名は
	 * 処理するHTTP変数名で始める。falseの場合は、
	 * action_をプリフィックスに使用する。
	 *
	 * Laravelの場合、GETでフォーム表示、POSTでフォームの処理
	 * を分けるスタイルが推奨されている。これにより、
	 * コントローラーのコードがとてもすっきりする。
	 *
	 * @var boolean RESTフルなルーティング処理
	 */
	public $restful = true;

	/**
	 * コンストラクタ
	 *
	 * フィルターの設定
	 */
	public function __construct()
	{
		// 親のコンストラクタの呼び出し
		parent::__construct();

		// POSTに対してはCSRFチェックをかける
		// POSTでフォームの処理を行うため、理にかなっている
		$this->filter('before', 'csrf')->on('post');

		// 認証が必要のないアクションを明示的に指定
		// exceptで指定することで、項目の指定し忘れにより
		// アクセスされてしまうことを防げるため
		// セキュリティー的に有利なコーディング
		//
		// ユーザ自身に登録を行わせる前提のため
		// この場合、create飲みを除外している
		// もし、イントラネットなどで管理者だけに
		// 登録させるのであれば、全アクションに認証フィルターを
		// かけるべき
		$this->filter('before', 'auth')->except(array( 'create' ));
	}

	/**
	 * ユーザー登録フォーム出力
	 *
	 * @return View
	 */
	public function get_create()
	{
		return view('user.create');
	}

	/**
	 * ユーザー登録フォーム処理
	 *
	 * @return Redirect
	 */
	public function post_create()
	{

		/**
		 * バリデーションルール
		 */
		$rules = array(
			'username' => 'required|unique:users',
			'password' => 'required|confirmed',
			'password_confirmation' => 'required|same:password',
			'email' => 'required|email|unique:users',
		);

		// Validatorのインスタンを生成し取得
		// チェックする項目だけを渡す
		// Input::only()を使用すれば、簡単
		$inputs = Input::only(array( 'username', 'password', 'password_confirmation', 'email' ));
		$val = Validator::make($inputs, $rules);

		// バリデーションの実行
		if ( $val->passes() ) {
			// バリデーション通過
			// ユーザの追加処理
			// Eloquentモデルのcreate()はテーブルに新規追加し、
			// そのモデルを返す。追加できなかった場合はfalseを返す。
			$user = User::create(array_only($inputs, array( 'username', 'password', 'email' )));
			if ( $user === false ) {
				return Redirct::to_route('addUser')->with('warning', 'ユーザーの追加に失敗しました。管理者に連絡してください。');
			}
			else {
				// 登録成功。お好きなページヘリダイレクト
				// この場合、続けてユーザ登録することも考え、ユーザ登録ページヘ
				return Redirect::to_route('addUser')->with('message', 'ユーザーを登録しました。');
			}
		}
		else {
			// バリデーション失敗
			//
			// with_errorsに渡すのはバリデーターのエラーメッセージ(Messageクラス)
			// with_input()は引数を指定しなければ、
			// 全入力項目をフラッシュデーターとしてセッションに保存
			// withはキーと値をフラッシュデーターとしてセッションに保存
			return Redirect::to_route('addUser')->with_errors($val->errors)->with_input()
					->with('notice', '以下の項目を修正してください。');
		}
	}

	// これ以降はLaravelの可読性を味わっていただくため、
	// コメントは最小限にします

	public function get_list()
	{

		// ペジネーションの生成
		// ページ管理などはLaravelにお任せ
		$users = User::paginate(10);

		// ビューにデーターをwith()で渡す
		return view('user.list')->with('users', $users);
	}

	public function get_remove($id = null)
	{

		// ルートの設定により、このルートは通らない
		// フェールセーフのため
		if ( $id == null ) {
			return Redirect::home()
					->with('notice', '対象を指定せず、ユーザーを削除しようとしています。');
		}

		$user = User::find($id);

		// find()では存在しないidを指定した場合
		// nullが帰ってくる
		if ( $user == null ) {
			return Redirect::back()
					->with('notice', '存在しないユーザーを削除しようとしています。');
		}

		$user->delete();

		return Redirect::back()->with('message', 'ユーザーを削除しました。');
	}

	public function get_display($id = null)
	{

		// ルートの設定により、このルートは通らない
		// フェールセーフのため
		if ( $id == null ) {
			return Redirect::home()
					->with('notice', '対象を指定せず、ユーザーを表示しようとしています。');
		}

		$user = User::find($id);

		if ( $user == null ) {
			return Redirect::back()
					->with('notice', '存在しないユーザーを表示しようとしています。');
		}

		return view('user.show')->with('user', $user);
	}

	public function get_update($id = null)
	{
		// ルートの設定により、このルートは通らない
		// フェールセーフのため
		if ( $id == null ) {
			return Redirect::home()
					->with('notice', '対象を指定せず、ユーザーを更新しようとしています。');
		}

		if ( Input::had('id') ) {
			// 初回以降
			// 直前の入力データーをッションから取得
			$data = Input::old();
		}
		else {
			// 初回
			// テーブルより表示データー取得
			$user = User::find($id);
			if ( $user == null ) {
				return Redirect::back()
						->with('notice', '存在しないユーザーを更新しようとしています。');
			}
			$data = array(
				'id' => $user->id,
				'username' => $user->username,
				'password' => $user->password,
				'email' => $user->email,
			);
		}
		return view('user.update', array( 'data' => $data ));
	}

	public function post_update($id)
	{
		// ルートの設定により、このルートは通らない
		// フェールセーフのため
		if ( $id == null ) {
			return Redirect::home()
					->with('notice', '対象を指定せず、ユーザーを更新しようとしています。');
		}

		$rules = array(
			'id' => 'required|integer',
			'username' => 'required|unique:users,username,'.$id,
//			'old_password' => '',
			'password' => 'confirmed',
			'password_confirmation' => 'same:password',
			'email' => 'required|email|unique:users,email,'.$id,
		);

		$inputs = Input::only(array( 'id', 'username', 'old_password', 'password',
				'password_confirmation', 'email' ));

		$val = Validator::make($inputs, $rules);

		if ( $val->passes() ) {
			// バリデーション合格

			$user = User::find($inputs['id']);

			// パスワード変更がある場合のみ
			if ( !empty($inputs['old_password']) &&
				// 旧パスワードのチェック
				!Hash::check($inputs['old_password'], $user->password) ) {
				return Redirect::to_route('updateUser', array( $user->id ))
						->with_input()
						->with('notice', '旧パスワードが一致しません');
			}
			$user->username = Input::get('username');
			$user->email = Input::get('email');
			$user->password = empty($inputs['password']) ? $user->password : $inputs['password'];

			$user->save();
			return Redirect::to_route('updateUser', array( $inputs['id'] ))
					->with('message', 'ユーザー情報を更新しました。');
		}
		else {
			// バリデーションエラー
			return Redirect::to_route('updateUser', array( Input::get('id') ))
					->with_errors($val->errors)->with_input()
					->with('notice', '以下の項目を修正してください。');
		}
	}

}