# テンプレート

## 内容

- [基本](#the-basics)
- [セクション](#sections)
- [Bladeテンプレートエンジン](#blade-template-engine)
- [Bladeレイアウト](#blade-layouts)

<a name="the-basics"></a>
## 基本

多分、あなたのアプリケーションでもほとんどのページに渡って、共通のレイアウトを使用していることでしょう。このレイアウトを手動で、全てのコントローラーアクションに生成するのは、辛いですよね。コントローラーにレイアウトが指定出来れば、開発はもっと楽しくなります。では、これを行なってみましょう。

#### コントローラーに"layout"プロパティを指定する

	class Base_Controller extends Controller {

		public $layout = 'layouts.common';

	}

#### コントローラーのアクションからレイアウトにアクセスする

	public function action_profile()
	{
		$this->layout->nest('content', 'user.profile');
	}

> **注目：**レイアウトを使う場合、アクションは何もリターンしません。

<a name="sections"></a>
## セクション

ビューのセクションはネストしたビューからレイアウトにコンテンツを挿入するシンプルな方法を提供します。例えば、多分あなたはレイアウトのヘッダーの中にネストビューが必要としているJavascriptを挿入したいとします。これを掘り下げてみましょう。

#### ビューの中にセクションを生成する

	<?php Section::start('scripts'); ?>
		<script src="jquery.js"></script>
	<?php Section::stop(); ?>

#### セクションの内容をレンダリングする

	<head>
		<?php echo Section::yield('scripts'); ?>
	</head>

#### Bladeのショートカットを使いセクション操作する

	@section('scripts')
		<script src="jquery.js"></script>
	@endsection

	<head>
		@yield('scripts')
	</head>

<a name="blade-template-engine"></a>
## Bladeテンプレートエンジン

Bladeはビューを書くことを至高の喜びにしてくれます。Bladeビューを作成するには、ファイルの拡張子を".blade.php"にするだけです。Bladeにより、美しく控えめなシンタックスで、PHPコントロール構文やデーターのエコーを書くことができるようになります。例をご覧ください。

#### Bladeを使い、変数をエコーする

	Hello, {{$name}}.

#### Bladeを使い、関数の結果をエコーする

	{{ Asset::styles() }}

#### ビューをレンダーする

**@include**を使用し、他のビューの中にビューをレンダーすることができます。レンダーされるビューは自動的に、現在のビューの全てのデーターを継承します。

	<h1>Profile</hi>
	@include('user.profile')

同様に、**@include**と同じような働きをする**@render**も使用できます。違いはレンダー時に、現在のビューのデーターを継承**しない**ことです。

	@render('admin.list')

#### ブレードでループを作成する

	<h1>Comments</h1>

	@foreach ($comments as $comment)
		コメントの内容は {{$comment->body}}.
	@endforeach

#### 他のBladeコントロール構文

	@if (count($comments) > 0)
		コメントがあります！
	@else
		コメントがありません！
	@endif

	@for ($i =0; $i < count($comments) - 1; $i++)
		コメントの内容は {{$comments[$i]}}
	@endfor

	@while ($something)
		まだループ中です！
	@endwhile

#### "for-else"コントロール構文

	@forelse ($posts as $post)
		{{ $post->body }}
	@empty
		配列中にはポストはありません！
	@endforelse

<a name="blade-unless"></a>
#### "unless"コントロール構文

	@unless(Auth::check())
		{{ HTML::link_to_route('login', 'Login'); }}
	@endunless

	// 同じ内容...

	<?php if ( ! Auth::check()): ?>
		...
	<?php endif; ?>

<a name="blade-comments"></a>
#### Bladeコメント

	@if ($check)
		{{-- これがコメントです --}}
		...
	@endif
	
	{{--
		これは
		複数行に渡る
		コメント例です。
	--}}

> **注目：**Bladeのコメントは、HTMLコメントとは異なり、HTMLソースには出力されません。

<a name="blade-layouts"></a>
## Bladeレイアウト

BladeはきれいでエレガントなシンタックスをPHPの一般的なコントロール構文に提供しているだけでなく、ビューのレイアウトに使用できる、美しい手法も用意しています。例えば、あなたのアプリケーションでは、共通のルック・アンド・フィールを提供するために、「マスター」ビューを使っているでしょう。それは多分、こんな感じだと思います：

	<html>
		<ul class="navigation">
			@section('navigation')
				<li>Nav Item 1</li>
				<li>Nav Item 2</li>
			@yield_section
		</ul>

		<div class="content">
			@yield('content')
		</div>
	</html>

"content"セクションが生成されることに注目してください。このセクションに何かテキストを埋めるなくてはなりません。では、このレイアウトを使用する、別のビューを作成しましょう。

	@layout('master')

	@section('content')
		profileページへようこそ！
	@endsection

素晴らしい！これで、ルートからシンプルに"profile"ビューをリターンできます。

	return View::make('profile');

porfileビューはありがたいことに、**@layout**文により、Laravelは"master"テンプレートを自動的に使用してくれます。

**重要：** **@layout**はファイルの最初の一行で呼び出す必要があり、先頭にホワイトスペースをつけたり、途中で改行してはいけません。

場合により、セクションのレイアウトを置き換えてしまうよりは、追加したいこともあります。例えば、"master"レイアウトのナビゲーションリストを考えてください。ここに、新しいアイテムを追加してみましょう。こんな風になります：

	@layout('master')

	@section('navigation')
		@parent
		<li>Nav Item 3</li>
	@endsection

	@section('content')
		profileページへようこそ！
	@endsection

**@parent**Blade構文に気が付きましたか？これはlayoutのnavigationセクションの内容に置き換わります。これはレイアウトの拡張と継承を実現する美しくてパワフルな手法を提供しています。
