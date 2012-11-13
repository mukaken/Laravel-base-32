<?php

/*
 * 方針:
 *
 * ルートは全部名前付き
 * バンドルを使用しない
 * コントローラーによるルーティングを採用
 * （userのみのためUserモデルに押しこむ）
 */

// 'home'ルートの定義
// 例えばRedirect::home()などでは
// 'home'という名前のルートがあればそのルートへ
// 無ければルートルート(root route)の'/'へ
// リダイレクトされる
Route::get('/', array( 'as' => 'home', function() {
		return View::make('home');
	} ));

// 開発段階ではデフォルトのコントローラールーティングを
// お手軽に使用するのも良い手
// http://ドメイン名/コントローラー/アクション/引数…
// でルーティングされる
// Route::controller(array( 'user', 'login' ));

// 推奨されるのは以下のようにコントローラーアクションにルート名を付け
// アクションを一つ一つ指定する方法
// これにより細かいルーティングの指定が可能
// 適用フィルターはコントローラーのコンストラクタで指定している
// ログイン
Route::any('login', array( 'as' => 'login', 'uses' => 'login@login' ));
// ログアウト
Route::get('logout', array( 'as' => 'logout', 'uses' => 'login@logout' ));

// ユーザー追加
Route::any('adduser', array( 'as' => 'addUser', 'uses' => 'user@create' ));
// ユーザー一覧
Route::get('list', array( 'as' => 'listUsers', 'uses' => 'user@list' ));
// ユーザー表示
Route::get('user/show/(:num)', array( 'as' => 'showUser', 'uses' => 'user@display' ));
// ユーザー更新
Route::any('user/update/(:num)', array( 'as' => 'updateUser', 'uses' => 'user@update' ));
// ユーザー削除
Route::get('user/delete/(:num)', array( 'as' => 'removeUser', 'uses' => 'user@remove' ));


// テンプレートとして指定したtemplate.blade.phpに対して
// ビューコンポーサーを指定する
// ビューコンポーサーはビューのレンダリング直前に呼び出され
// 出力に必要な処理を行う
View::composer('template',
	function($view) { {
			if ( !isset($view->warning) ) {
				$view->warning = Session::get('warning', false);
			}
			if ( !isset($view->notice) ) {
				$view->notice = Session::get('notice', false);
			}
			if ( !isset($view->message) ) {
				$view->message = Session::get('message', false);
			}
		}
	});

Event::listen('404', function() {
		return Response::error('404');
	});

Event::listen('500', function() {
		return Response::error('500');
	});

Route::filter('before', function() {
		// Do stuff before every request to your application...
	});

Route::filter('after', function($response) {
		// Do stuff after every request to your application...
	});

Route::filter('csrf', function() {
		if ( Request::forged() )
			return Response::error('500');
	});

Route::filter('auth',
	function() {
		if ( Auth::guest() )
			return Redirect::to_route('login')->with('message', 'ログインが必要です。');
	});