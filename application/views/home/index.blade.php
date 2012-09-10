@layout('template')

@section('title')
Laravel:トップページ
@endsection

@section('content')
<div class="row-fluid">
    <div class="span9">
        <h2>学習領域</h2>
        <p>
            今、あなたはデフォルトのホームページを見ています。
            このページを生成しているのは次のコードです。
        </p>

        <pre>{{ path('app') }}routes.php</pre>

        <p>ビューはこちらで見つけることができます：</p>

        <pre>{{ path('app') }}views/home/index.php</pre>
    </div>
</div>
<div class="row-fluid">
    <div class="span9">
        <h2>知識で輝く</h2>
        <p>
            感謝したくなるほどに驚異的にシンプルな{{ HTML::link('docs', '素晴らしいドキュメント') }}
            を使用し、学習できます。
        </p>
    </div>
</div>
<div class="row-fluid">
    <div class="span9">
        <h2>美しく創造する</h2>

        <p>
            さあ、これで準備は整いました。創造の時間がやって来ました！
            始めるのにお役に立つリンクを紹介しましょう：
        </p>
        <ul class="out-links">
            <li><a href="http://laravel.com">公式Webサイト</a></li>
            <li><a href="http://forums.laravel.com">Laravelフォーラム</a></li>
            <li><a href="http://github.com/laravel/laravel">GitHubリポジトリー</a></li>
        </ul>
    </div>
</div>
@endsection