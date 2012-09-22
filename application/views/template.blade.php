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
        {{-- トップナビ --}}
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Laravel</a>
                    <div class="btn-group pull-right">
                        <a class="btn btn-danger dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="icon-user"></i>
                            {{ Auth::check() ? Auth::user()->username : 'Guest' }}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            @if (Auth::check())
                            <li><a href="{{ URL::to('admin/home') }}">Admin Area</a></li>
                            <li class="divider"></li>
                            <li><a href="{{ URL::to('logout') }}">Log Out</a></li>
                            @else
                            <li><a href="{{ URL::to('login') }}">Log In</a></li>
                            @endif
                        </ul>
                    </div>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li class="active"><a href="{{ URL::base() }}">Home</a></li>
                            <li><a href="{{ URL::to('docs/home') }}">Documents</a></li>
                            <li><a href="{{ URL::to('login') }}">Login</a></li>
                            <li><a href="{{ URL::to('signup') }}">Sing Up</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    {{-- 左サイドナビ --}}
                    @yield('sidenave')
                </div>
                <div class="span9">
                    {{-- エラー出力 --}}
                    @if ( $warning )
                    <div class="row-fluid">
                        <div class="alert alert-error">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            {{ $warning }}
                        </div>
                    </div>
                    @endif
                    @if ( $notice )
                    <div class="row-fluid">
                        <div class="alert">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            {{ $notice }}
                        </div>
                    </div>
                    @endif
                    @if ( $message )
                    <div class="row-fluid">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            {{ $message }}
                        </div>
                    </div>
                    @endif
                    {{-- コンテンツ --}}
                    <div class="row-fluid">
                        <div class="span9">
                            @yield('content')
                        </div>
                    </div>
                    {{-- フッター --}}
                    <div class="row-fluid">
                        <div class="span9">
                            @yield('footer')
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{-- Javascript --}}
        {{ HTML::script('http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js') }}
        {{ HTML::script('js/bootstrap.min.js') }}
        {{ HTML::script('laravel/js/prettify.js') }}
		{{-- サイドメニューのリストをスライドさせる --}}
        <script type="text/javascript">
            $(function(){
                $('#menu-list li>ul').hide().parent().children('a').append('<span style="color:#03a;"> v</span>');
                $('#menu-list li:has(ul)').hover(
                function(){
                    if($('>ul', this).css('display')=='none') {
                        $('#menu-list li>ul').slideUp('slow');
                        $('>ul',this).slideDown('slow');
                    }
                },
                function(){}
            );
            });
        </script>

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
