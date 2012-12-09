<?php

// Eloquent ORMを使用

class User extends Eloquent {

	/**
	 * ユーザーの追加
	 *
	 * @param array $params_array ユーザー情報
	 * @return
	 */
	public static function add( $params_array ) {

		$new_user = new User( $params_array );

		return $new_user->save();
	}

	/**
	 * パスワードリセッター
	 *
	 * @return string 新しいパスワード
	 */
	public function reset_password() {
		$new_password = Str::random(10);
		$this->password = $new_password;
		$this->save();

		return $new_password;
	}

	/**
	 * パスワードセッター
	 * ハッシュ後、保存
	 *
	 * @param string $password パスワード
	 */
    public function set_password($password) {
        $this->set_attribute('password', Hash::make($password));
    }

}