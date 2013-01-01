<!DOCTYPE HTML>
<html lang="en-GB">
    <head>
        <meta charset="UTF-8">
        <title>@yield('title')</title>
        {{ HTML::style('css/bootstrap.css') }}
        {{ HTML::style('css/bootstrap-responsive.css') }}
        {{ HTML::style('css/docs.css') }}
        {{ HTML::style('css/prittify.css') }}

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
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
                            <li>{{ HTML::link('admin/home', 'Admin Area') }}</li>
                            <li class="divider"></li>
                            <li>{{ HTML::link('logout', 'Log Out') }}</li>
                            @else
							<li>{{ HTML::link('login', 'Log In') }}</li>
                            @endif
                        </ul>
                    </div>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li class="active"><a href="{{ URL::base() }}">Home</a></li>
							<li>{{ HTML::link('docs/home', 'Documents') }}</li>
                            <li>{{ HTML::link('login', 'Login') }}</li>
                            <li>{{ HTML::link('signup', 'Sing Up') }}</li>
                            <li>{{ HTML::link_to_route('set-japanese', '日本語') }}</li>
							<li>{{ HTML::link_to_route('set-english', 'English') }}</li>
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

</body>
</html>