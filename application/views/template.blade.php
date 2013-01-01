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

		<!-- Included CSS Files (Uncompressed) -->
		<!--
		<link rel="stylesheet" href="stylesheets/foundation.css">
		-->

		<!-- Included CSS Files (Compressed) -->
		{{ HTML::style('foundation/stylesheets/foundation.min.css') }}
		{{ HTML::style('foundation/stylesheets/app.css') }}

		{{ HTML::script('foundation/javascripts/modernizr.foundation.js') }}

		{{ HTML::style('css/prittify.css') }}

		<!-- IE Fix for HTML5 Tags -->
		<!--[if lt IE 9]>
		  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

	</head>

	<body  onload="prettyPrint()">

		<!-- Header and Nav -->

		<div class="row">
			<div class="three columns">
				<h1><img src="http://dummyimage.com/400x100/1b5eb5/ffffff.png&text=Site+Name" /></h1>
			</div>
			<div class="nine columns">
				<ul class="nav-bar right">
					<li>{{ HTML::link('/', 'ホーム') }}</li>
					<li>{{ HTML::link('login','ログイン') }}</li>
					<li>{{ HTML::link('logout', 'ログアウト') }}</li>
					<li>{{ HTML::link('signup', '登録') }}</li>
					<li>{{ HTML::link('admin/home', '管理者エリア') }}</li>
				</ul>
			</div>
		</div>

		<!-- End Header and Nav -->


		<div class="row">

			<div class="nine columns push-three">

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

				@yield('content')

			</div>

			<div class="three columns pull-nine">

				@section('sidenave')
				<div>
					<h5>ナビゲーション</h5>
					<ul class="side-nav">
						<li>{{ HTML::link('/', 'ホーム') }}</li>
						<li>{{ HTML::link('login','ログイン') }}</li>
						<li>{{ HTML::link('logout', 'ログアウト') }}</li>
						<li>{{ HTML::link('signup', 'ユーザー登録') }}</li>
						<li>{{ HTML::link('admin/home', '管理者ページトップ') }}</li>
						<li class="divider"></li>
						<li>{{ HTML::link_to_route('set-japanese', '日本語') }}</li>
						<li>{{ HTML::link_to_route('set-english', 'English') }}</li>
					</ul>
				</div>
				@yield_section

				<p><img src="http://placekitten.com/g/320/240" alt="Placeholder image from flickholdr.com" /></p>

			</div>

		</div>


		<!-- Footer -->

		<footer class="row">
			<div class="twelve columns">
				<hr />
				<div class="row">
					<div class="six columns">
						<p>Copyright by Hirohisa Kawase... でも、本当はMITライセンスでOK</p>
					</div>
					<div class="six columns">
						<ul class="link-list sub-nav right">
							<li>{{ HTML::link('/', 'ホーム') }}</li>
							<li>{{ HTML::link('login','ログイン') }}</li>
							<li>{{ HTML::link('logout', 'ログアウト') }}</li>
							<li>{{ HTML::link('signup', '登録') }}</li>
							<li>{{ HTML::link('admin/home', '管理者エリア') }}</li>
						</ul>
					</div>
				</div>
			</div>
		</footer>

		<!-- Included JS Files (Compressed) -->
		{{ HTML::script('foundation/javascripts/jquery.js') }}
		{{ HTML::script('foundation/javascripts/foundation.min.js') }}

		<!-- Initialize JS Plugins -->
		{{ HTML::script('foundation/javascripts/app.js') }}

		{{ HTML::script('laravel/js/prettify.js') }}
		{{ HTML::script('laravel/js/scroll.js') }}

	</body>
</html>
