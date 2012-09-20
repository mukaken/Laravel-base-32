<?php

class Command
{
	static $commnads = array(
		'0' => array(
			'display'	 => 'コマンドを選択してください',
			'command'	 => '',
		),
		'1'			 => array(
			'display'	 => 'マイグレーション：実行',
			'command'	 => 'migrate'
		),
		'2'			 => array(
			'display'	 => 'マイグレーション：１つロールバック',
			'command'	 => 'migrate:rollback'
		),
		'3'			 => array(
			'display'	 => 'マイグレーション：初期化',
			'command'	 => 'migrate:install'
		),
		'4'			 => array(
			'display'	 => 'マイグレーション：全部ロールバッグ',
			'command'	 => 'migrate:reset'
		),
		'5'			 => array(
			'display'	 => 'セッションテーブル生成',
			'command'	 => 'session:table'
		),
		'6'			 => array(
			'display'	 => 'アプリケーションキー生成',
			'command'	 => 'key:generate'
		),
	);

	public static function get()
	{
		$ret = array( );
		foreach ( self::$commnads as $key => $val )
		{
			$ret[$key] = $val['display'];
		}
		return $ret;
	}

	public static function command_string($key)
	{
		return self::$commnads[$key]['command'];
	}

}