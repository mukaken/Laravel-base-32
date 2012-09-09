@layout('template')

@section('sidenave')
    {{ $sidebar }}
@endsection

@section('content')
	{{ $content }}
@endsection

@section('footer')
<hr>
<p style="font-size:10px;">粗訳完了。翻訳ブラッシュアップ中です。
    <a href="http://kore1server.com/laravel-tutorial/299-laravel-japanese-document.html">翻訳、ドネーションで、日本語ドキュメントサイト維持にご協力ください。</a>
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
    {{ HTML::link('http://laravel.phper.jp/docs', 'phper.jp : http://laravel.phper.jp/docs') }}
</p>
<p style="font-size:10px;">
    {{ HTML::link('http://laravel-ja.phpfogapp.com', 'PHP fog : http://laravel-ja.phpfogapp.com') }}
</p>
<p style="font-size:10px;">
    {{ HTML::link('http://laravel-ja.pagodabox.com', 'Pagoda Box : http://laravel-ja.pagodabox.com') }}
</p>
<p style="font-size:10px;">
    {{ HTML::link('http://jadoc-hirokws.rhcloud.com', 'OpenShift : http://jadoc-hirokws.rhcloud.com') }}
</p>
<hr>
<p style="font-size:10px;">
    {{ HTML::link($ja_link, '日本語') }} /
    {{ HTML::link($en_link, 'English') }}
</p>
@endsection
