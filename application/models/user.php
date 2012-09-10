<?php

// Eloquent ORMを使用

class User extends Eloquent {

	// パスワードを保存するときは
	// 自動的にハッシュして保存
	
    public function set_password($password) {
        $this->set_attribute('password', Hash::make($password));
    }

}