<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Laravel:Web職人のためのフレームワーク</title>
        <meta name="viewport" content="width=device-width">

        {{ HTML::style('bundles/docs/css/style.css') }}
        {{-- HTML::style('laravel/js/modernizr-2.5.3.min.js') --}}
        <link rel="shortcut icon" href="{{asset('img/favicon.ico')}}">
        @if (URL::base() === "http://laravel.kore1server.com")
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-10410114-3']);
            _gaq.push(['_setDomainName', 'kore1server.com']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>
        @endif
    </head>
    <body onload="prettyPrint()">
        <div class="wrapper">
            <div class="header">
                <h1>Laravel&nbsp;&nbsp;<span style="font-size:12px;">{{ $version }}</span></h1>
                <h2>Web職人のためのフレームワーク</h2>

                <p class="intro-text">
                </p>
            </div>
            <div role="main" class="main">
                <div class="sidebar">
                    <div id ="menu-list" style="margin: 0; padding: 0;">
                        {{ $sidebar }}
                    </div>
                </div>
                <div class="content">
                    @yield('content')
                    <hr>
                    <p style="font-size:10px;">
                        <a href="http://kore1server.com/laravel-tutorial/299-laravel-japanese-document.html">翻訳、ドネーションで、日本語ドキュメントサイト維持にご協力ください。</a>&nbsp;<a href="http://kore1server.com/laravel-tutorial/323-published-laravel-docs-in-japanese.html">電子書籍版</a>もあります。
                    </p>
                    <p style="font-size:10px;">
                        {{ HTML::link('http://laravel.kore1server.com', '日本語ドキュメントオリジナルサイト：http://laravel.kore1server.com') }}
                    </p>
                    <p style="font-size:10px;">
                        {{ HTML::link('http://kore1server.com/laravel-tutorial.html', '日本語チュートリアル：http://kore1server.com/laravel-tutorial.html') }}
                    </p>
                    <p style="font-size:10px;">
                        以下はドキュメントのバックアップサイトです。PHP上でLaravelが動作したPaaSを利用しています。
                    </p>
                    <p style="font-size:10px;">
                        {{ HTML::link('http://laravel.phper.jp/docs', 'phper.jp : http://laravel.phper.jp/docs') }}<br>
                        {{ HTML::link('http://laravel-ja.phpfogapp.com', 'PHP fog : http://laravel-ja.phpfogapp.com') }}<br>
                        {{ HTML::link('http://laravel-ja.pagodabox.com', 'Pagoda Box : http://laravel-ja.pagodabox.com') }}
                    </p>
                    <hr>
                    <p style="font-size:10px;">
                        {{ HTML::link($ja_link, '日本語') }} /
                        {{ HTML::link($en_link, 'English') }}
						&nbsp;&nbsp;
						{{ HTML::link('/docs/home/0', '最新バージョン(3.2.7)トップ') }} /
						{{ HTML::link('/docs/home/325', '3.2.5トップ') }} /
						{{ HTML::link('/docs/home/324', '3.2.4トップ') }} /
						{{ HTML::link('/docs/home/323', '3.2.3トップ') }}
                    </p>
                </div>
            </div>
        </div>
        {{ HTML::script('http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js') }}
        {{ HTML::script('laravel/js/prettify.js') }}
        {{ HTML::script('laravel/js/scroll.js') }}
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
