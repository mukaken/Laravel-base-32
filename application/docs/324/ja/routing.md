# ルーティング

## 内容

- [基本](#the-basics)
- [ワイルドカード](#wildcards)
- [404イベント](#the-404-event)
- [フィルター](#filters)
- [パターンフィルター](#pattern-filters)
- [グローバルフィルター](#global-filters)
- [ルートグループ](#route-groups)
- [名前付きルート](#named-routes)
- [HTTPSルート](#https-routes)
- [バンドルルート](#bundle-routes)
- [コントローラールーティング](#controller-routing)
- [CLIルートテスト](#cli-route-testing)

<a name="the-basics"></a>
## 基本

LaravelはPHP 5.3の最新機能をルーティングをシンプルで記述的にするために使用しています。これはAPIから複雑なWebアプリケーションまで、全てをできる限り簡単に作成するために、重要なことです。通常ルートは**application/routes.php**で定義されます。

多くの他のフレームワークと異なり、Laravelは２つの方法でアプリケーションロジックを埋め込むことができます。とても一般的な方法ですがアプリケーションロジックをコントローラーに埋め込む事も、またroutes.phpに直接記述することもできます。これは**特に**数ページの小さなサイトにぴったりで、半ダースのメソッドを小さないくつかのコントローラに書いたり、関連性の薄いメソッドをいくつかのコントローラーに詰め込んだりした後で、更にこうしたコントローラーへルートを設定する必要はありません。

以降の例では、最初の引数は「登録する」ルートです。２つ目の引数はそのルートで行うロジックを含む関数です。ルートには基本的に先頭の/は付けません。唯一の例外は、デフォルトルートの場合で、/**のみ**を指定します。

> **注意：** ルートは登録された順番に評価されます。ですから、「全てに当てはまる」ルートは**routes.php**の最後に追加しましょう。

#### "GET /"に対応するルートを登録する

	Route::get('/', function()
	{
		return "Hello World!";
	});

#### 全てのHTTP変数(GET、POST、PUT、DELETE)に対するルートを登録する

	Route::any('/', function()
	{
		return "Hello World!";
	});

#### 他のリクエストメソッドに対するルートを登録する

	Route::post('user', function()
	{
		//
	});

	Route::put('user/(:num)', function($id)
	{
		//
	});

	Route::delete('user/(:num)', function($id)
	{
		//
	});

一つのURIに複数のHTTP変数を登録する

	Router::register(array('GET', 'POST'), $uri, $callback);

<a name="wildcards"></a>
## ワイルドカード

#### 数字と一致するURIセグメント

	Route::get('user/(:num)', function($id)
	{
		//
	});

#### 英数字と一致するURIセグメント

	Route::get('post/(:any)', function($title)
	{
		//
	});

#### オプションのURIセグメント

	Route::get('page/(:any?)', function($page = 'index')
	{
		//
	});

<a name="the-404-event"></a>
## 404イベント

アプリケーションにリクエストがあっても、どのルートにも一致しない場合は、404イベントが発生します。デフォルトのイベントハンドラーは**application/routes.php**の中にあります。

#### デフォルト404イベントハンドラー

	Event::listen('404', function()
	{
		return Response::error('404');
	});

あなたのアプリケーションにぴったりになるよう、自由に変更して下さい！

*参照：*

- *[イベント](/docs/events)*

<a name="filters"></a>
## フィルター

ルートフィルターは、あるルートが実行される前と後に実行されるものです。もし、"before"フィルターが値を返したら、その値はリクエストに対するレスポンスだと考え、そのルートは実行されません。これは認証フィルターなどを組み込み時に便利です。フィルターは基本的に**application/routes.php**で定義されます。

#### フィルターを登録する

	Route::filter('filter', function()
	{
		return Redirect::to('home');
	});

#### ルートにフィルターを付ける

	Route::get('blocked', array('before' => 'filter', function()
	{
		return View::make('blocked');
	}));

#### ルートに"after"フィルターを付ける

	Route::get('download', array('after' => 'log', function()
	{
		//
	}));

#### ルートに複数のフィルターを付ける

	Route::get('create', array('before' => 'auth|csrf', function()
	{
		//
	}));

#### フィルターに引数を渡す

	Route::get('panel', array('before' => 'role:admin', function()
	{
		//
	}));

<a name="pattern-filters"></a>
## パターンフィルター

時々、特定のURIで始まるルート全部にフィルターを付けたいことがあるでしょう。例えば、"auth"フィルターを"admin"で始まるURIに対する全てのリクエストに適用したい場合です。どうやるのか、御覧ください。

#### フィルターを基にし、URIパターンを定義する

	Route::filter('pattern: admin/*', 'auth');

配列を使用し、フィルター名とコールバックをURIと共に指定することで、直接フィルターを登録することも可能です。

#### フィルターとURIパターンを同時に定義する

    Route::filter('pattern: admin/*', array('name' => 'auth', function()
    {
        // 
    }));

<a name="global-filters"></a>
## グローバルフィルター

Laravelには２つの「グローバル」フィルターが用意されており、**before**と**after**はアプリケーションに対する全てのリクエストで実行されます。両方共に**application/routes.php**の中で定義されています。これらのフィルターは共通のバンドルを開始したり、グローバルなアセットを追加するのに良い場所です。

> **注目：** **after**フィルターは、現在のリクエストに対する**Response**オブジェクトを受け取ります。

<a name="route-groups"></a>
## ルートグループ

ルートグループは、コードをきれいにこざっぱりと保ったまま、ルートのグループに対し、一連の属性を付け加えるために利用できます。

	Route::group(array('before' => 'auth'), function()
	{
		Route::get('panel', function()
		{
			//
		});

		Route::get('dashboard', function()
		{
			//
		});
	});

<a name="named-routes"></a>
## 名前付きルート

いつもURLの生成やリダイレクトにルートのURIを使っていると、ルートを後で変更するときにトラブルが起き得ます。アプリケーション全体を通じて、ルートに付けた名前で参照するのは、便利な方法です。ルートの変更が発生しても、リンクは新しいルートを示しますので、それ以上の変更は必要ありません。

#### 名前付きルートを登録する

	Route::get('/', array('as' => 'home', function()
	{
		return "Hello World";
	}));

#### 名前付きルートに対するURLを生成する

	$url = URL::to_route('home');

#### 名前付きルートへリダイレクトする

	return Redirect::to_route('home');

一度ルートに名前をつければ、現在のリクエストを処理しているルートが、名前を与えられたルートかどうか、簡単にチェックできます。

#### リクエストを処理しているルートが、名前を与えられたものか判断する

	if (Request::route()->is('home'))
	{
		//  "home"ルートは、リクエストを処理しています!
	}

<a name="https-routes"></a>
## HTTPSルート

ルートを定義するときに、"https"アトリビュートを指定することで、そのルートに対するURLを生成したり、リダイレクトする時にHTTPSプロトコルを使用することができます。

#### HTTPSルートを定義する

	Route::get('login', array('https' => true, function()
	{
		return View::make('login');
	}));

#### "secure"ショートカットメソッドを使用する

	Route::secure('GET', 'login', function()
	{
		return View::make('login');
	});

<a name="bundle-routes"></a>
## バンドルルート

バンドルはLaravelのモジュールパッケージシステムです。アプリケーションに対するリクエストを簡単にバンドルに処理させるように設定することができます。[バンドルの詳細](/docs/bundles)については別のドキュメントを御覧ください。今のところは、このセクションを読み通して、バンドルの中で処理するようにルートを使えるだけでなく、バンドルの中でも登録できるという認識を持っていただければ結構です。

**application/bundles.php**ファイルを開き、なにか追加しましょう。

#### ルートを扱うバンドルを登録する

	return array(

		'admin' => array('handles' => 'admin'),

	);

新しい**handles**オプションがバンドル設定配列にあるのに気づきましたか？これでLaravelに"admin"で始まるURIのりクエストは全て、Adminバンドルに行くように伝えています。

これで、バンドルにいくつかルートを登録する準備ができました。今度は、**routes.php**ファイルをあなたのバンドルのルートディレクトリーに作成し、以下のコードを付け加えてください。

#### バンドルのルート(root)ルートを登録する

	Route::get('(:bundle)', function()
	{
		return 'Welcome to the Admin bundle!';
	});

この例を解説しましょう。**(:bundle)**プレースホルダーに気が付きましたか？これはバンドルを登録するときに使用した、**handles**節の値に置き換わります。これはコードを[D.R.Y.](http://en.wikipedia.org/wiki/Don't_repeat_yourself)に保ち、あなたのバンドルを使用する人が、あなたの定義したルートを壊さずに、バンドルへのルートURIを変更できるようにしてくれます。ナイスでしょ？

もちろん、**(:bundle)**プレースホルダーは、ルートルートだけでなく、ルート全てに使用できます。

#### バンドルのルートを登録する

	Route::get('(:bundle)/panel', function()
	{
		return "I handle requests to admin/panel!";
	});

<a name="controller-routing"></a>
## コントローラールーティング

コントローラーはアプリケーションロジックを管理する別の方法です。もしコントローラーに不慣れでしたら、先に[コントローラーについて](/docs/controllers)読み、このセクションに戻ってきてください。

Laravelの全てのルートについて認識しておくべき重要なことは、コントローラーへのルートも含め、明確に定義されている必要があることです。これが意味するのは、ルート登録がされていないコントローラーメソッドに対してはアクセス**できない**ということです。コントローラーの中のメソッドは、コントローラールート登録を使用すれば、自動的に全て定義することができます。コントローラールートの登録は基本的に**application/routes.php**の中で定義します。

大抵の場合、アプリケーション中の"controllers"ディレクトリーに存在する、全てのコントローラーを一度に登録したいことでしょう。たった一文で出来ますよ。御覧ください。

#### アプリケーションの全てのコントローラーを登録する

	Route::controller(Controller::detect());

**Controller::detect**メソッドは、シンプルにアプリケーションで定義されているコントローラーを全て配列で返します。

もし、バンドルに含まれるコントローラーを自動的に突き止めたい時は、バンドル名をメソッドに渡すだけです。バンドル名が指定されない時は、applicationフォルダーのcontrollersディレクトリーが検索されます。

#### "admin"バンドルのコントローラーを全て登録する

	Route::controller(Controller::detect('admin'));

#### ルーターに"home"コントローラーを登録する

	Route::controller('home');

#### ルーターに複数のコントローラーを登録する

	Route::controller(array('dashboard.panel', 'admin'));

一度コントローラーを登録すれば、メソッドにはシンプルなURI規約でアクセスできます。

	http://localhost/コントローラー/メソッド/引数

この規約はCodeigniterや他の人気のあるフレームワークで採用されているものと似ており、最初の引数がコントローラー、２番目がメソッド、残りのセグメントはメソッドの引数として渡されます。もしメソッドセグメントがなければ、"index"メソッドがつかわれます。

このルーティング規約はすべての状況で好ましくは無いでしょう。そこでシンプルで直感的なシンタックスを使い、URIをコントローラーアクションに明確にルートすることもできます。

#### コントローラーアクションを指定してルートを登録する

	Route::get('welcome', 'home@index');

#### コントローラーアクションを指定し、フィルターも使ったルートを登録する

	Route::get('welcome', array('after' => 'log', 'uses' => 'home@index'));

#### コントローラーアクションを示す名前付きルートを登録

	Route::get('welcome', array('as' => 'home.welcome', 'uses' => 'home@index'));

<a name="cli-route-testing"></a>
## CLIルートテスト

Laravelの"Artisan"CLIを使い、ルートをテストすることができます。シンプルにリクエストするメソッドと、URIを指定してください。ルートのレスポンスがCLIでvar_dumpされます。

#### Artisan CLIを通して、ルートを呼び出す

	php artisan route:call get api/user/1