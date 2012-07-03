# ビューとレスポンス

## 内容

- [基本](#the-basics)
- [ビューとデーターの結合](#binding-data-to-views)
- [ビューのネスト](#nesting-views)
- [名前付きビュー](#named-views)
- [ビューコンポーサー](#view-composers)
- [リダイレクト](#redirects)
- [フラッシュデーターと共にリダイレクト](#redirecting-with-flash-data)
- [ダウンロード](#downloads)
- [エラー](#errors)

<a name="the-basics"></a>
## 基本

ビューはアプリケーションを使用している人に送られるHTMLで構成されています。アプリケーションのビジネスロジックから、ビューを分けることで、コードは綺麗になり、メンテナンスしやすくなります。

すべてのビューは**application/views**ディレクトリーの中に設置され、PHPファイル拡張子を付けます。**View**クラスはビューを取得するシンプルな方法を提供します。それを使用者にリターンします。例を見てみましょう！

#### ビューを作成する

	<html>
		私はviews/home/index.phpに保存されている！
	</html>

#### ルートからビューを返す

	Route::get('/', function()
	{
		return View::make('home.index');
	});

#### コントローラーからビューを返す

	public function action_index()
	{
		return View::make('home.index');
	});

#### ビューが存在するか確かめる

	$exists = View::exists('home.index');

時々、ブラウザーに送るレスポンスをもうちょっとコントロールする必要があることでしょう。例えば、レスポンスにカスタムヘッダーをセットしたいとか、HTTPステータスコードを変えたいとかです。こうやります：

#### カスタムレスポンスを返す

	Route::get('/', function()
	{
		$headers = array('foo' => 'bar');

		return Response::make('Hello World!', 200, $headers);
	});

#### ビューを含めたカスタムレスポンスを返す

	return Response::view('home', 200, $headers);

#### JSONレスポンスを返す

	return Response::json(array('name' => 'Batman'));

#### EloquentモデルをJSONで返す

	return Response::eloquent(User::find(1));

<a name="binding-data-to-views"></a>
## ビューとデーターの結合

典型的には、ルートかコントローラーは表示するビューのデーターをモデルへリクエストします。ですから、データーをビューに渡す方法が必要になります。やり方は色々とありますので、自分にベストな方法を選んでください！

#### ビューにデーターを結びつける

	Route::get('/', function()
	{
		return View::make('home')->with('name', 'James');
	});

#### 結びつけたデーターをビューの中でアクセスする

	<html>
		Hello, <?php echo $name; ?>.
	</html>

#### ビューにチェーンでデーターを結びつける

	View::make('home')
		->with('name', 'James')
		->with('votes', 25);

#### データーを結びつけるために、配列を渡す

	View::make('home', array('name' => 'James'));

#### データーを結びつけるために、マジックメソッドを使う

	$view->name  = 'James';
	$view->email = 'example@example.com';

#### データーを結びつけるために、配列アクセスインターフェイス方式を使用する。

	$view['name']  = 'James';
	$view['email'] = 'example@example.com';

<a name="nesting-views"></a>
## ビューのネスト

時々、ビューの中からビューをネストしたい場合があるでしょう。ネストされたビューは時々「パーシャル」と呼ばれますが、ビューを小さく、モジュール分割するのに役に立ちます。

#### "nest"メソッドを使い、ネストしたビューを結びつける

	View::make('home')->nest('footer', 'partials.footer');

#### ネストしたビューにデーターを渡す

	$view = View::make('home');

	$view->nest('content', 'orders', array('orders' => $orders));

時々、ビューの中から直接他のビューを取り込みたいことがあるでしょう。**render**ヘルパー機能が使えます。

#### ビューを表示するのに"render"ヘルパーを使用する

	<div class="content">
		<?php echo render('user.profile'); ?>
	</div>

またこれもよくありますが、リスト中のデーターのインスタンスに応じて、パーシャルビューを表示することもあります。例えば、一つの注文に応じた詳細をパーシャルビューで表示する場合です。また別の例としては、注文の配列をループで処理し、それぞれのオーダーをパーシャルビューでレンダリングする場合もあるでしょう。このような場合は、シンプルに**render_each**ヘルパーを使ってください。

#### 配列の中のアイテムをそれぞれパーシャルビューでレンダリングする

	<div class="orders">
		<?php echo render_each('partials.order', $orders, 'order');
	</div>

最初の引数はパーシャルビューの名前で、２つ目はデータの配列です。３つ目は配列のアイテムそれぞれが、パーシャルビューに渡される時に参照される変数の名前です。

<a name="named-views"></a>
## 名前付きビュー

名前付きビューはコードを表現的で組織立てるのに、役立ちます。シンプルに使ってみましょう。

#### 名前付きビューの登録

	View::name('layouts.default', 'layout');

#### 名前付きビューのインスタンスを得る

	return View::of('layout');

#### データーを名前付きビューと結びつける

	return View::of('layout', array('orders' => $orders));

<a name="view-composers"></a>
## ビューコンポーサー

ビューが生成されるたびに"composer"イベントが発生します。このイベントをlestenし、ビューが生成されるたびに資源や共通データーをビューに結びつけることができます。一般的によくつかわれる機能としては、ブログのサイドナビにあるランダムポストのリストがあげられるでしょう。レイアウトビューの中でロードすることで、パーシャルビューをネストすることができます。それから、パーシャルにたいし、コンポーサーを定義します。それから、コンポーサーはポストテーブルをクエリーし、ビューをレンダリングするのに必要なデーターを全て集めます。ランダムロジックをあちこちにばらまかなくて済みます！一般的にコンポーサーは**application/routes.phpの中で定義されます。サンプルをどうぞ：

#### "home"ビューにコンポーサーを登録する

	View::composer('home', function($view)
	{
		$view->nest('footer', 'partials.footer');
	});

これで"home"ビューが生成されるたびに、登録した無名関数にViewのインスタンスが渡され、あなたがやりたいことがなんであれ、ビューに対し準備ができます。

#### コンポーサーを複数のビューに対し登録する

	View::composer(array('home', 'profile'), function($view)
	{
		//
	});

> **注目：**ビューは一つ以上のコンポーサーを持てます。使いまくってください！

<a name="redirects"></a>
## リダイレクト

重要な注意点は、ルートでもコントローラーでも、"return"文でレスポンスを返さなくてはならないことです。ユーザーをお好きな場所へリダイレクトするため、"Redirect::to()"を使う代わりに、"return Redirect::to()"を使ってください。これは他のPHPフレームワークと一番異なっているという点でとても重要です。この実務的な重要点は、思いがけず簡単に見落とされてしまいます。

#### 他のURIへリダイレクトする

	return Redirect::to('user/profile');

#### 特定のステータスでリダイレクトする

	return Redirect::to('user/profile', 301);

#### セキュアなURIへリダイレクトする

	return Redirect::to_secure('user/profile');

#### アプリケーションのルートへリダイレクトする

	return Redirect::home();

#### 以前のアクションへリダイレクトする

	return Redirect::back();

#### 名前付きルートへリダイレクトする

	return Redirect::to_route('profile');

#### コントローラーアクションへリダイレクトする

	return Redirect::to_action('home@index');

時々、名前付きルートへリダイレクトする必要があるが、URIのワイルドカードの代わりに、特定の値を使いたい場合があることでしょう。ワイルドカードを特定の値へ簡単に置き換えられます。

#### ワイルドカード値を指定して、名前付きルートへリダイレクトする

	return Redirect::to_route('profile', array($username));

#### ワイルドカード値を指定して、アクションへリダイレクトする

	return Redirect::to_action('user@profile', array($username));

<a name="redirecting-with-flash-data"></a>
## フラッシュデーターと共にリダイレクト

アプリケーションにユーザー登録した後や、ログイン後に、ウェルカムもしくはステータスメッセージを表示するのは一般的です。しかし、どうやって次のリクエストのステータスメッセージをセットできるのでしょう？リダイレクトのレスポンスにwith()メソッドを使い、データーをフラッシュ保存できます。

	return Redirect::to('profile')->with('status', 'Welcome Back!');

ビューからのメッセージはSessionのgetメソッドでアクセスできます。

	$status = Session::get('status');

*参照：*

- *[セッション](/docs/session/config)*

<a name="downloads"></a>
## ダウンロード

#### ファイルダウンロードのレスポンスを送る

	return Response::download('file/path.jpg');

#### ファイル名を指定し、ダウンロードレスポンスを送る

	return Response::download('file/path.jpg', 'photo.jpg');

<a name="errors"></a>
## エラー

特定のエラーレスポンスを生成するには、シンプルに返したいレスポンスコードを指定してください。**views/error**の中に保存されている、対応したビューが自動的にリターンされます。

#### 404エラーレスポンスを生成する

	return Response::error('404');

#### 500エラーレスポンスを生成する

	return Response::error('500');