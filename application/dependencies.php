<?php

/*
 * 依存性注入定義
 *
 * このファイルでコンテナ名と生成コードを定義する。
 *
 * コンテナの登録(register()/singlton())は
 * 内部メモリでの処理のためさほどオーバーヘッドがかからない。
 *
 * 生成コードはコンテナ名で呼び出し、実際に生成する場合のみ
 * 実行される。register()で登録すれば、呼び出しごとに
 * コードが呼び出され、別のインスタンスを生成することになる。
 * singleton()で登録すれば、何度呼び出されても、
 * 最初の一回のみ生成コードが呼び出され、二回目以降は
 * 最初に生成したインスタンスが渡される。
 *
 */

/*
 * 例：通常の登録（呼び出しごとにインスタンス生成）
 *
 * if(! IoC::registered('apple'))
 * {
 *     IoC::register('apple', function()
 *     {
 * 	       return new Apple;
 *     });
 * }
 */

/*
 * 例：シングルトンとして登録（同じインスタンスを返す)
 *     コントローラーをIoCへ登録
 *
 * if(! IoC::registered('controller: user'))
 * {
 *     IoC::singleton('controller: user', function()
 *     {
 *         return new UserContoller;
 *     });
 * }
 *
 */

if ( !IoC::registered('apple') )
{
	Ioc::register('apple', function() {
			return new Apple;
		});
}

if ( !IoC::registered('today-fruit') )
{
	Ioc::register('orange', function() {
			return new Orange;
		});
}