@layout('template')

@section('sidenave')
{{ $sidebar }}
@endsection

@section('content')
{{ $content }}
@endsection

@section('footer')
<hr>
<p style="font-size:10px;">
	<a href="http://kore1server.com/laravel-tutorial/299-laravel-japanese-document.html">日本語ドキュメントサイト維持にご協力ください。</a>&nbsp;<a href="http://kore1server.com/laravel-tutorial/323-published-laravel-docs-in-japanese.html">電子書籍版</a>もあります。
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
	{{ HTML::link('http://laravel-ja.pagodabox.com', 'Pagoda Box : http://laravel-ja.pagodabox.com') }}
</p>
<hr>
<p style="font-size:10px;">
	{{ HTML::link($ja_link, '日本語') }} /
	{{ HTML::link($en_link, 'English') }}
	&nbsp;&nbsp;
	{{ HTML::link('/docs/home/0', '最新バージョン(3.2.8-10)トップ') }} /
	{{ HTML::link('/docs/home/327', '3.2.7トップ') }} /
	{{ HTML::link('/docs/home/325', '3.2.5トップ') }} /
	{{ HTML::link('/docs/home/324', '3.2.4トップ') }} /
	{{ HTML::link('/docs/home/323', '3.2.3トップ') }}
</p>
@endsection
