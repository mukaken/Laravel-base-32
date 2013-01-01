<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>
			@yield('title')
		</title>
        <meta name="viewport" content="width=device-width">

        {{ HTML::style('bundles/docs/css/style.css') }}
        {{ HTML::style('laravel/js/modernizr-2.5.3.min.js') }}
    </head>
    <body onload="prettyPrint()">
        <div class="wrapper">
            <div class="header">
                <h1>Laravel</h1>
                <h2>Web職人のためのフレームワーク</h2>

                <p class="intro-text">
                </p>
            </div>
            <div class="main">
                <div class="sidebar">
					@section('sidenave')
					<h3>メニュー</h3>
					<ul>
						<li>{{ HTML::link('/', 'ホーム') }}</li>
						<li>{{ HTML::link('login','ログイン') }}</li>
						<li>{{ HTML::link('logout', 'ログアウト') }}</li>
						<li>{{ HTML::link('signup', 'ユーザー登録') }}</li>
						<li>{{ HTML::link('admin/home', '管理者ページトップ') }}</li>
					</ul>
					<h3>言語設定</h3>
					<ul>
						<p>現在の言語設定：{{ Config::get('application.language') }}</p>
						<li>{{ HTML::link_to_route('set-japanese', '日本語') }}</li>
						<li>{{ HTML::link_to_route('set-english', 'English') }}</li>
					</ul>
					@yield_section
                </div>
				<div class="content">
					<div class="errors">
						@if (Session::has('warning'))
						<div style="color:red;">
							<p>{{ Session::get('warning') }}</p>
						</div>
						@endif
						@if (Session::has('notice'))
						<div style="color:orangered;">
							<p>{{ Session::get('notice') }}</p>
						</div>
						@endif
						@if (Session::has('message'))
						<div style="color:blue;">
							<p>{{ Session::get('message') }}</p>
						</div>
						@endif
					</div>
					@yield('content')
				</div>
			</div>
		</div>
		{{ HTML::script('http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js') }}
		{{ HTML::script('laravel/js/prettify.js') }}
		{{ HTML::script('laravel/js/scroll.js') }}
    </body>
</html>
