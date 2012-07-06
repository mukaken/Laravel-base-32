<!DOCTYPE HTML>
<html lang="en-GB">
    <head>
        <meta charset="UTF-8">
        <title>@yield('title')</title>
        {{ HTML::style('css/bootstrap.css') }}
        {{ HTML::style('css/bootstrap-responsive.css') }}
        {{ HTML::style('css/docs.css') }}

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
                    @if (Session::has('warning'))
                    <div class="row-fluid">
                        <div class="alert alert-error">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            {{ Session::get('warning') }}
                        </div>
                    </div>
                    @endif
                    @if (Session::has('notice'))
                    <div class="row-fluid">
                        <div class="alert">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            {{ Session::get('notice') }}
                        </div>
                    </div>
                    @endif
                    @if (Session::has('message'))
                    <div class="row-fluid">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            {{ Session::get('message') }}
                        </div>
                    </div>
                    @endif
                    {{-- コンテンツ --}}
                    <div class="row-fluid">
                        <div class="span9">
                            @yield('content')
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{-- Javascript --}}
        {{ HTML::script('http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js') }}
        {{ HTML::script('js/bootstrap.min.js') }}
        {{ HTML::script('laravel/js/prettify.js') }}
</body>
</html>