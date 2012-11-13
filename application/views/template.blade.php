<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>
			@section('title')
				User CRUD チュートリアル
			@yield_section
		</title>
    </head>
    <body>
		{{-- ナビゲーション --}}
		@section('navi')
			{{-- リンク先を名前付きルートで指定 --}}
			{{ HTML::link_to_route('home', 'ホーム') }}
			{{ HTML::link_to_route('login', 'ログイン') }}
			{{ HTML::link_to_route('logout', 'ログアウト') }}
			{{ HTML::link_to_route('listUsers', 'ユーザー一覧') }}
			{{ HTML::link_to_route('addUser', 'ユーザー作成') }}
		@yield_section
		{{-- エラーメッセージ --}}
		@if ( $warning )
		<p style="color:red;">
			{{ $warning }}
		</p>
		@endif
		@if ( $notice )
		<p style="color:brown;">
			{{ $notice }}
		</p>
		@endif
		@if ( $message )
		<p style="color:blue;">
			{{ $message }}
		</p>
		@endif
		{{-- コンテンツ --}}
		@section('content')
			コンテンツ本体
		@yield_section
	</bode>
</html>