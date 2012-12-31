<?php

/**
 * バンドルのサンプル
 * ルートの定義
 */
// sample-bundleへのルート登録
Route::get('sample-bundle',
	function() {
		$content = Config::get('sample::melon');
		// バンドルに含まれるビューを使用する場合、
		// ビュー名の最初はバンドル名
		return view('sample::index')
				->with('content', $content);
	});

// sample/topへのルート定義
// バンドル名を先頭にする時の定義例
// ポイント：application/routes.phpでは
// (:bundle)プレースホルダーが使用できるが、
// バンドルの中からは使用できない
Route::get('sample/top',
	function() {
		$content = Config::get('sample::melon');

		return view('sample::index')
				->with('content', $content);
	});