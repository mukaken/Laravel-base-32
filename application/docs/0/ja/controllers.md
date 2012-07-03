# コントローラー

## 内容

- [基本](#the-basics)
- [コントローラールーティング](#controller-routing)
- [バンドルコントローラー](#bundle-controllers)
- [アクションフィルター](#action-filters)
- [コントローラーのネスト](#nested-controllers)
- [コントローラーレイアウト](#controller-layouts)
- [RESTコントローラー](#restful-controllers)
- [依存の注入](#dependency-injection)
- [コントローラーファクトリー](#controller-factory)

<a name="the-basics"></a>
## 基本

コントローラーはユーザーの入力を受け取り、モデル、ライブラリー、ビュー間の相互関係を管理する責任を受け持つクラスのことです。典型的な動作は、モデルからデーターを受け取り、それからユーザーに対しデーターを表示するためにビューに返します。

現代的なWeb開発において、コントローラーはアプリケーションロジックを実現する最も一般的な方法として使用されています。しかしながら、Laravelは開発者にアプリケーションロジックをルーティングに含めて実装することも許しています。この詳細は[ルーティングのドキュメント](/docs/routing)を御覧ください。新しいユーザーはコントローラーから始められるほうが良いでしょう。コントローラーでできないことは、ルートベースのアプリケーションロジックでもできません。

コントローラークラスは**application/controllers**に置かれ、Base_Controllerクラスを拡張しなくてはなりません。コントローラークラスはLaravelにより、インクルードされます。

#### シンプルなコントローラーを作成する

	class Admin_Controller extends Base_Controller
	{

		public function action_index()
		{
			//
		}

	}

**アクションは**Webからアクセスできるコントローラーメソッドの名前です。アクションは"action\_"で始まる名前を付けなくてはなりません。他のメソッドは、スコープにかかわらず、Webからアクセス出来ません。

> **Base\_ControllerクラスはLaravelのメインControllerクラスを拡張しており、多くのコントローラーに共通のメソッドを使いやすいように用意されています。**

<a name="controller-routing"></a>
## コントローラールーティング

コントローラーへのルートも含めて、Laravelの全てのルートは、明確に定義される必要があると認識するのは重要です。

これが意味するのは、ルート登録がされていないコントローラーメソッドに対してはアクセス**できない**ということです。コントローラーの中のメソッドは、コントローラールート登録を使用すれば、自動的に全て定義することができます。コントローラールートの登録は基本的に**application/routes.php**の中で定義します。

コントローラーのルーティングについての詳細は[ルーティングページ](/docs/routing#controller-routing)を参照してください。

<a name="bundle-controllers"></a>
## バンドルコントローラー

バンドルはLaravelのモジュールパッケージシステムです。アプリケーションに対するリクエストを簡単にバンドルに処理させるように設定することができます。[バンドルの詳細](/docs/bundles)については別のドキュメントを御覧ください。

バンドルに属するコントローラーを作成するのは、アプリケーションのコントローラーを作成するのとほとんど同じです。コントローラーのクラス名の前にバンドル名をつけるだけです。もしバンドル名が"admin"であれば、コントローラーのクラスはこのようになります：

#### バンドルコントローラークラスの作成

	class Admin_Home_Controller extends Base_Controller
	{

		public function action_index()
		{
			return "Hello Admin!";
		}

	}

けど、ルーターにどうやってバンドルコントローラーを登録するのでしょうか？とても簡単です。ご覧のとおりです：

#### ルーターにバンドルのコントローラーを登録する

	Route::controller('admin::home');

素晴らしい！これでWebから"admin"バンドルのhomeコントローラーへアクセスできます！

> **注目：**Laravel全体を通して、連続するコロン(::)はバンドルを意味します。バンドルに関するより多くの情報は[バンドルドキュメント](/docs/bundles)を御覧ください。

<a name="action-filters"></a>
## アクションフィルター

アクションフィルターはコントローラーアクションの前と後に実行できるメソッドです。Laravelでは、フィルターをアクションに結び付けられるだけではありません。HTTP変数(post, get, put, delete)を選択して、フィルターを有効にさえできます。

"before"と"after"フィルターをコントローラーのコンストラクターの中で、コントローラーアクションと結びつけることも可能です。

#### フィルターをすべてのアクションに結びつける

	$this->filter('before', 'auth');

この例では、"auth"フィルターはこのコントローラーの中のすべてのアクションが行われる前に、実行されます。authアクションはLaravelに備わっており、**application/routes.php**の中で見つけられます。authフィルターはそのユーザーがログインしていることを確認し、していない場合は"login"へリダイレクトします。

#### いくつかのアクションにだけフィルターを結びつける

	$this->filter('before', 'auth')->only(array('index', 'list'));

この例では、authフィルターはaction_index()とaction_list()メソッドが実行される前に行われます。これらのページにアクセスする前に、ユーザーはログインしてなくてはなりません。しかしながら、このコントローラー中の他のアクションでは、認証されたセッションは要求されません。

#### いくつかのアクションを除いた全てに、フィルターを結びつける

	$this->filter('before', 'auth')->except(array('add', 'posts'));

以前の例と同様、この宣言により、このコントローラーのアクションが実行される前に、フィルターが確実に実行されます。フィルターを適用するアクションを宣言する代わりに、認証セッションを要求しないアクションを宣言しています。場合によって"except"メソッドを使用したほうが安全なこともあります。新しいアクションをこのコントローラーに追加した時に、only()に指定し忘れる可能性があるからです。そうなると意図せず、認証されていないユーザーにより、コントローラーアクションが実行されてしまう可能性が起きます。

#### POSTに対してフィルターを結びつける

	$this->filter('before', 'csrf')->on('post');

この例は、どうやって特定のHTTP変数にだけフィルターを実行するかを示しています。この場合、CSRFフィルターをフォームがポストされた場合にのみ実行します。CSRFフィルターは他のシステムからのポスト（例えばボットなど）を防ぐように設計されており、Laravelにはデフォルトで用意されています。CSRFフィルターは**application/routes.php**の中で見つかります。

*参照：*

- *[ルートフィルター](/docs/routing#filters)*

<a name="nested-controllers"></a>
## コントローラーのネスト

コントローラーはメインの**application/controllers**フォルダーの下に、好きなだけのサブフォルダーを作成し、その中に置くこともできます。

コントローラークラスを作成し、**controllers/admin/panel.php**として設置します。

	class Admin_Panel_Controller extends Base_Controller
	{

		public function action_index()
		{
			//
		}

	}

#### ネストしたコントローラーは「ピリオド」を使いルートを登録します。

	Route::controller('admin.panel');

> ネストしたコントローラーを使う場合、優先順位を考慮し、いつもネストが深いものから浅いもの順に登録してください。

#### コントローラーの"index"アクションにアクセスする

	http://localhost/admin/panel

<a name="controller-layouts"></a>
## コントローラーレイアウト

コントローラーを使用するレイアウトについては、完全なドキュメントが、[テンプレートのページで見つけられます](http://laravel.com/docs/views/templating)。

<a name="restful-controllers"></a>
## RESTコントローラー

コントローラーのアクションを"action_"で始める代わりに、対応させたいHTTP変数名を付けることもできます。

#### RESTフルプロパティをコントローラーに付け加える

	class Home_Controller extends Base_Controller
	{

		public $restful = true;

	}

#### RESTフルコントローラーアクションを作成する

	class Home_Controller extends Base_Controller
	{

		public $restful = true;

		public function get_index()
		{
			//
		}

		public function post_index()
		{
			//
		}

	}

これは特にCRUDメソッドをフォームの生成と表示、バリデーションと結果の保存のロジックに分けて作成する場合に便利です。

<a name="dependency-injection"></a>
## 依存の注入

もしあなたがテストしやすいコードを書くことに焦点を当てているのでしたら、多分コントローラーのコンストラクターに依存性を注入したいことでしょう。**問題ありません**。コントローラーを[IoCコンテナ](/docs/ioc)に登録してください。コンテナにコントローラーを登録するときには、キーのプレフィックスに**controller**を付けてください。では、**application/start.php**ファイルの中で、コントローラーを登録してみましょう。こうなります：

	IoC::register('controller: user', function()
	{
		return new User_Controller;
	});

アプリケーションでコントローラーに対するリクエストがあると、Laravelは自動的にそのコントローラーがコンテナに登録されているか調べ、登録されているならば、コントローラーのインスタンスを解決するためにコンテナを利用します。

> コントローラーの依存性の注入に飛び込む前に、Laravelの美しい[IoCコンテナ](/docs/ioc)ドキュメントをお読みになりたいでしょう。

<a name="controller-factory"></a>
## コントローラーファクトリー

例えばサードパーティのIoCコンテナなどを利用し、もっと自分でコントローラーのインスタンス化をコントロールしたければ、Laravelのコントローラーファクトリーを使う必要があります。

**コントローラーのインスタンス化を処理するためにイベントを登録する**

	Event::listen(Controller::factory, function($controller)
	{
		return new $controller;
	});

イベントは解決するべきコントローラのクラス名を受け取ります。必要なことはそのコントローラーのインスタンスを返してあげることが全てです。
