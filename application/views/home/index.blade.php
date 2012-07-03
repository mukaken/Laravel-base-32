<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Laravel:Web職人のためのフレームワーク</title>
	<meta name="viewport" content="width=device-width">
	{{ HTML::style('laravel/css/style.css') }}
</head>
<body>
	<div class="wrapper">
        <div style="color:red;">
            @if (Session::has('warning'))
                <p>{{ Session::get('warning') }}</p>
            @endif
        </div>
        <div style="color:orangered;">
            @if (Session::has('notice'))
                <p>{{ Session::get('notice') }}</p>
            @endif
        </div>
        <div style="color:blue;">
            @if (Session::has('message'))
                <p>{{ Session::get('message') }}</p>
            @endif
        </div>
		<header>
			<h1>Laravel</h1>
			<h2>Web職人のためのフレームワーク</h2>

			<p class="intro-text" style="margin-top: 45px;">
			</p>
		</header>
		<div role="main" class="main">                          
			<div class="home">
				<h2>学習領域</h2>

				<p>
                    今、あなたはデフォルトのホームページを見ています。
                    このページを生成してのは次のコードです。
				</p>

				<pre>{{ path('app') }}routes.php</pre>

				<p>ビューはこちらで見つけることができます：</p>

				<pre>{{ path('app') }}views/home/index.php</pre>

				<h2>知識で輝く</h2>

				<p>
                    感謝したくなるほどに驚異的にシンプルな{{ HTML::link('docs', '素晴らしいドキュメント') }}
					を使用し、学習できます。
				</p>

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
	</div>
</body>
</html>
