<!DOCTYPE html>

<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
	<head>
		<meta charset="utf-8" />

		<!-- Set the viewport width to device width for mobile -->
		<meta name="viewport" content="width=device-width" />

		<title>
			@yield('title')
		</title>

		<!-- Included CSS Files (Compressed) -->
		{{ HTML::style('foundation/stylesheets/foundation.css') }}
		{{ HTML::style('foundation/stylesheets/offcanvas.css') }}
		{{ HTML::style('foundation/stylesheets/app.css') }}

		{{ HTML::script('foundation/javascripts/modernizr.foundation.js') }}

		<!-- IE Fix for HTML5 Tags -->
		<!--[if lt IE 9]>
		  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

	</head>

	<body id="page" class="off-canvas slide-nav">

		<div class="container">

			<!-- モバイル用メニュー -->
			<nav id="topMenu" role="navigation">
				<ul id="nav" class="nav-bar">
					<li>{{ HTML::link('/', 'ホーム') }}</li>
					<li>{{ HTML::link('login','ログイン') }}</li>
					<li>{{ HTML::link('logout', 'ログアウト') }}</li>
					<li>{{ HTML::link('signup', 'ユーザー登録') }}</li>
					<li>{{ HTML::link('admin/home', '管理者トップページ') }}</li>
				</ul>
			</nav>


			<header id="header" class="row">
				<div class="four columns phone-two">
					<h1 id="site-title">{{ HTML::link( URL::current(), 'Demo') }}</h1>
				</div>
				<!-- フルブラウザトップメニュー -->
				<div class="eight columns phone-two">
					<nav id="menu" role="navigation" class="hide-for-small">
						<ul id="mainNav" class="nav-bar">
							<li>{{ HTML::link('/', 'ホーム') }}</li>
							<li>{{ HTML::link('login','ログイン') }}</li>
							<li>{{ HTML::link('logout', 'ログアウト') }}</li>
							<li>{{ HTML::link('signup', '登録') }}</li>
							<li>{{ HTML::link('admin/home', '管理者エリア') }}</li>
						</ul>
					</nav>

					<!-- モバイル表示メニュー -->
					<p class="show-for-small">
						<a class='menu-button button' id="menuButton" href="#menu">メニュー</a>
						<a class='sidebar-button button' id="sidebarButton" href="#sidebar">ナビ</a>
					</p>
				</div>
			</header>

			<div class="row">
				<section role="main">
					<div class="row">
						<h2>Laravel</h2>
						<h3>Web職人のためのフレームワーク</h3>
						<hr />
					</div>

					{{-- エラー出力 --}}
                    @if ( $warning )
                    <div class="alert-box alert">
                        {{ $warning }}
						<a href="" class="close">&times;</a>
                    </div>
                    @endif
                    @if ( $notice )
                    <div class="alert-box">
						{{ $notice }}
						<a href="" class="close">&times;</a>
                    </div>
                    @endif
                    @if ( $message )
                    <div class="alert-box success">
						{{ $message }}
						<a href="" class="close">&times;</a>
                   </div>
                    @endif

					<div class="row">
						<div class="twelve columns">
							@yield('content')
						</div>
					</div>
				</section>

				<section id="sidebar" role="complementary">
					@section('sidenave')
					<li>{{ HTML::link('/', 'ホーム') }}</li>
					<li>{{ HTML::link('login','ログイン') }}</li>
					<li>{{ HTML::link('logout', 'ログアウト') }}</li>
					<li>{{ HTML::link('signup', 'ユーザー登録') }}</li>
					<li>{{ HTML::link('admin/home', '管理者ページトップ') }}</li>
					@yield_section
				</section>
			</div>

			<footer class="site-footer row" role="contentinfo">
				<div class="twelve columns">
					Copyright by Hirohisa Kawase... でも、本当はMITライセンスでOK
				</div>
			</footer>

		</div>

		<!-- Included JS Files (Compressed) -->
		{{ HTML::script('foundation/javascripts/jquery.js') }}
		{{ HTML::script('foundation/javascripts/foundation.min.js') }}

		<!-- Combine and Compress These JS Files -->
		{{ HTML::script('foundation/javascripts/jquery.reveal.js') }}
		{{ HTML::script('foundation/javascripts/jquery.orbit-1.4.0.js') }}
		{{ HTML::script('foundation/javascripts/jquery.customforms.js') }}
		{{ HTML::script('foundation/javascripts/jquery.placeholder.min.js') }}
		{{ HTML::script('foundation/javascripts/jquery.tooltips.js') }}
		<!-- End Combine and Compress These JS Files -->

		<!-- Initialize JS Plugins -->
		{{ HTML::script('foundation/javascripts/app.js') }}

		{{ HTML::script('foundation/javascripts/jquery.offcanvas.js') }}

		{{ HTML::script('laravel/js/prettify.js') }}
		{{ HTML::script('laravel/js/scroll.js') }}

	</body>
</html>
