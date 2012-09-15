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
					@yield_section
                </div>
				<div class="content">
					<div class="errors">
						@if ( $warning )
							<div style="color:red;">
								<p>{{ $warning }}</p>
							</div>
						@endif
						@if ( $notice )
							<div style="color:orangered;">
								<p>{{ $notice }}</p>
							</div>
						@endif
						@if ( $message )
							<div style="color:blue;">
								<p>{{ $message }}</p>
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