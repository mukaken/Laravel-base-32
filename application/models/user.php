<?php

// usersテーブルに対するEloquent ORM モデルを拡張
class User extends Eloquent
{
// Eloquent ORMはテーブルの定義などは無用
// テーブル名がモデルの複数形の場合、テーブル名の指定も不必要

	// パスワードを保存するときは
	// 自動的にハッシュして保存
	public function set_password($password)
	{
		$this->set_attribute('password', Hash::make($password));
	}

}