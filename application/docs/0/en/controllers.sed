s+Controllers are classes that are responsible for accepting user input and managing interactions between models, libraries, and views. +コントローラーはユーザーの入力を受け取り、モデル、ライブラリー、ビュー間の相互関係を管理する責任を受け持つクラスのことです。+

s+Typically, they will ask a model for data, and then return a view that presents that data to the user.+典型的な動作は、モデルからデーターを受け取り、それからユーザーに対しデーターを表示するためにビューに返します。+

s+The usage of controllers is the most common method of implementing application logic in modern web-development. +現代的なWeb開発において、コントローラーはアプリケーションロジックを実現する最も一般的な方法として使用されています。+

s+However, Laravel also empowers developers to implement their application logic within routing declarations. +しかしながら、Laravelは開発者にアプリケーションロジックをルーティングに含めて実装することも許しています。+

s+This is explored in detail in the \[routing document\](\/docs\/routing)\. +この詳細は[ルーティングのドキュメント](/docs/routing)を御覧ください。+

s+New users are encourage to start with controllers\. +新しいユーザーはコントローラーから始められるほうが良いでしょう。+

s+New users are encouraged to start with controllers\.+新しいユーザーはコントローラーから始められるほうが良いでしょう。+

s+There is nothing that route-based application logic can do that controllers can't\.+コントローラーでできないことは、ルートベースのアプリケーションロジックでもできません。+

s+Controller classes should be stored in \*\*application\/controllers\*\* and should extend the Base\\_Controller class\. +コントローラークラスは**application/controllers**に置かれ、Base\_Controllerクラスを拡張しなくてはなりません。+

s+Creating a simple controller:+シンプルなコントローラーを作成する+


s+A Home\\_Controller class is included with Laravel\.+コントローラークラスはLaravelにより、インクルードされます。+


s+\*\*Actions\*\* are the name of controller methods that are intended to be web-accessible\.  +**アクションは**Webからアクセスできるコントローラーメソッドの名前です。+

s+Actions should be prefixed with "action\\_"\. +アクションは"action\\_"で始まる名前を付けなくてはなりません。+

s+All other methods, regardless of scope, will not be web-accessible\.+他のメソッドは、スコープにかかわらず、Webからアクセス出来ません。+

s+\*\*Note:\*\* The Base\\_Controller class extends the main Laravel Controller class, and gives you a convenient place to put methods that are common to many controllers\.+**Base\\_ControllerクラスはLaravelのメインControllerクラスを拡張しており、多くのコントローラーに共通のメソッドを使いやすいように用意されています。**+


s+It is important to be aware that all routes in Laravel must be explicitly defined, including routes to controllers\.+コントローラーへのルートも含めて、Laravelの全てのルートは、明確に定義される必要があると認識するのは重要です。+

s+This means that controller methods that have not been exposed through route registration \*\*cannot\*\* be accessed\. +これが意味するのは、ルート登録がされていないコントローラーメソッドに対してはアクセス**できない**ということです。+

s+It's possible to automatically expose all methods within a controller using controller route registration\. +コントローラーの中のメソッドは、コントローラールート登録を使用すれば、自動的に全て定義することができます。+

s+Controller route registrations are typically defined in \*\*application\/routes\.php\*\*\.+コントローラールートの登録は基本的に**application/routes.php**の中で定義します。+

s+Check \[the routing page\](\/docs\/routing#controller-routing) for more information on routing to controllers\.+コントローラーのルーティングについての詳細は[ルーティングページ](/docs/routing#controller-routing)を参照してください。+


s+Bundles are Laravel's modular package system\. +バンドルはLaravelのモジュールパッケージシステムです。+

s+Bundles can easily configured to handle requests to your application\. +アプリケーションに対するリクエストを簡単にバンドルに処理させるように設定することができます。+

s+We'll be going over \[bundles in more detail\](\/docs\/bundles) in another document\.+[バンドルの詳細](/docs/bundles)については別のドキュメントを御覧ください。+

s+Creating controllers that belong to bundles is almost identical to creating your application controllers\. +バンドルに属するコントローラーを作成するのは、アプリケーションのコントローラーを作成するのとほとんど同じです。+

s+Just prefix the controller class name with the name of the bundle, so if your bundle is named "admin", your controller classes would look like this:+コントローラーのクラス名の前にバンドル名をつけるだけです。もしバンドル名が"admin"であれば、コントローラーのクラスはこのようになります：+

s+Creating a bundle controller class:+バンドルコントローラークラスの作成+

s+But, how do you register a bundle controller with the router? +けど、ルーターにどうやってバンドルコントローラーを登録するのでしょうか？+

s+It's simple\. +とても簡単です。+

s+Here's what it looks like:+ご覧のとおりです：+


s+Registering a bundle's controller with the router:+ルーターにバンドルのコントローラーを登録する+

s+Great! Now we can access our "admin" bundle's home controller from the web!+素晴らしい！これでWebから"admin"バンドルのhomeコントローラーへアクセスできます！+

s+\*\*Note:\*\* Throughout Laravel the double-colon syntax is used to denote bundles\.  +**注目：**Laravel全体を通して、連続するコロン(::)はバンドルを意味します。+

s+More information on bundles can be found in the \[bundle documentation\](\/docs\/bundles)\.+バンドルに関するより多くの情報は[バンドルドキュメント](/docs/bundles)を御覧ください。+


s+Action filters are methods that can be run before or after a controller action\.  +アクションフィルターはコントローラーアクションの前と後に実行できるメソッドです。+

s+With Laravel you don't only have control over which filters are assigned to which actions\.  +Laravelでは、フィルターをアクションに結び付けられるだけではありません。+

s+But, you can also choose which http verbs (post, get, put, and delete) will activate a filter\.+HTTP変数(post, get, put, delete)を選択して、フィルターを有効にさえできます。+

s+You can assign "before" and "after" filters to controller actions within the controller's constructor\.+"before"と"after"フィルターをコントローラーのコンストラクターの中で、コントローラーアクションと結びつけることも可能です。+

s+Attaching a filter to all actions:+フィルターをすべてのアクションに結びつける+


s+In this example the 'auth' filter will be run before every action within this controller\.  +この例では、"auth"フィルターはこのコントローラーの中のすべてのアクションが行われる前に、実行されます。+

s+The auth action comes out-of-the-box with Laravel and can be found in \*\*application\/routes\.php\*\*\.  +authアクションはLaravelに備わっており、**application/routes.php**の中で見つけられます。+

s+The auth filter verifies that a user is logged in and redirects them to 'login' if they are not\.+authフィルターはそのユーザーがログインしていることを確認し、していない場合は"login"へリダイレクトします。+

s+Attaching a filter to only some actions:+いくつかのアクションにだけフィルターを結びつける+


s+In this example the auth filter will be run before the action_index() or action_list() methods are run\.  +この例では、authフィルターはaction_index()とaction_list()メソッドが実行される前に行われます。+

s+Users must be logged in before having access to these pages\.  +これらのページにアクセスする前に、ユーザーはログインしてなくてはなりません。+

s+However, no other actions within this controller require an authenticated session\.+しかしながら、このコントローラー中の他のアクションでは、認証されたセッションは要求されません。+

s+Attaching a filter to all except a few actions:+いくつかのアクションを除いた全てに、フィルターを結びつける+


s+Much like the previous example, this declaration ensures that the auth filter is run on only some of this controller's actions\.  +以前の例と同様、この宣言により、このコントローラーのアクションが実行される前に、フィルターが確実に実行されます。+

s+Instead of declaring to which actions the filter applies we are instead declaring the actions that will not require authenticated sessions\.  +フィルターを適用するアクションを宣言する代わりに、認証セッションを要求しないアクションを宣言しています。+

s+It can sometimes be safer to use the 'except' method as it's possible to add new actions to this controller and to forget to add them to only()\.  +場合によって"except"メソッドを使用したほうが安全なこともあります。新しいアクションをこのコントローラーに追加した時に、only()に指定し忘れる可能性があるからです。+

s+This could potentially lead your controller's action being unintentionally accessible by users who haven't been authenticated\.+そうなると意図せず、認証されていないユーザーにより、コントローラーアクションが実行されてしまう可能性が起きます。+

s+Attaching a filter to run on POST:+POSTに対してフィルターを結びつける+


s+This example shows how a filter can be run only on a specific http verb\.  +この例は、どうやって特定のHTTP変数にだけフィルターを実行するかを示しています。+

s+In this case we're running the csrf filter only when a form post is made\.  +この場合、CSRFフィルターをフォームがポストされた場合にのみ実行します。+

s+The csrf filter is designed to prevent form posts from other systems (spam bots for example) and comes by default with Laravel\.  +CSRFフィルターは他のシステムからのポスト（例えばボットなど）を防ぐように設計されており、Laravelにはデフォルトで用意されています。+

s+You can find the csrf filter in \*\*application\/routes\.php\*\*\.+CSRFフィルターは**application/routes.php**の中で見つかります。+

s+Route Filters+ルートフィルター+


s+Controllers may be located within any number of sub-directories within the main \*\*application\/controllers\*\* folder\.+コントローラーはメインの**application/controllers**フォルダーの下に、好きなだけのサブフォルダーを作成し、その中に置くこともできます。+

s+Define the controller class and store it in \*\*controllers\/admin\/panel\.php\*\*\.+コントローラークラスを作成し、**controllers/admin/panel.php**として設置します。+


s+Register the nested controller with the router using "dot" syntax:+ネストしたコントローラーは「ピリオド」を使いルートを登録します。+


s+\*\*Note:\*\* When using nested controllers, always register your controllers from most nested to least nested in order to avoid shadowing controller routes\.+ネストしたコントローラーを使う場合、優先順位を考慮し、いつもネストが深いものから浅いもの順に登録してください。+

s+Access the "index" action of the controller:+コントローラーの"index"アクションにアクセスする+

s+Full documentation on using layouts with Controllers \[can be found on the Templating page\](http://laravel.com/docs/views/templating)\.+コントローラーを使用するレイアウトについては、完全なドキュメントが、[テンプレートのページで見つけられます](/docs/views/templating)。+

s+Instead of prefixing controller actions with "action_", you may prefix them with the HTTP verb they should respond to\.+コントローラーのアクションを"action_"で始める代わりに、対応させたいHTTP変数名を付けることもできます。+

s+Adding the RESTful property to the controller:+RESTフルプロパティをコントローラーに付け加える+

s+Building RESTful controller actions:+RESTフルコントローラーアクションを作成する+


s+This is particularly useful when building CRUD methods as you can separate the logic which populates and renders a form from the logic that validates and stores the results\.+これは特にCRUDメソッドをフォームの生成と表示、バリデーションと結果の保存のロジックに分けて作成する場合に便利です。+



s+If you are focusing on writing testable code, you will probably want to inject dependencies into the constructor of your controller\. +もしあなたがテストしやすいコードを書くことに焦点を当てているのでしたら、多分コントローラーのコンストラクターに依存性を注入したいことでしょう。+

s+No problem\. Just register your controller in the \[IoC container\](\/docs\/ioc)\. +**問題ありません**。コントローラーを[IoCコンテナ](/docs/ioc)に登録してください。+

s+When registering the controller with the container, prefix the key with \*\*controller\*\*\. +コンテナにコントローラーを登録するときには、キーのプレフィックスに**controller**を付けてください。+

s+So, in our \*\*application\/start\.php\*\* file, we could register our user controller like so:+では、**application/start.php**ファイルの中で、コントローラーを登録してみましょう。こうなります：+


s+When a request to a controller enters your application, Laravel will automatically determine if the controller is registered in the container, and if it is, will use the container to resolve an instance of the controller\.+アプリケーションでコントローラーに対するリクエストがあると、Laravelは自動的にそのコントローラーがコンテナに登録されているか調べ、登録されているならば、コントローラーのインスタンスを解決するためにコンテナを利用します。+

s+\*\*Note:\*\* Before diving into controller dependency injection, you may wish to read the documentation on Laravel's beautiful \[IoC container\](\/docs\/ioc)\.+コントローラーの依存性の注入に飛び込む前に、Laravelの美しい[IoCコンテナ](/docs/ioc)ドキュメントをお読みになりたいでしょう。+


s+If you want even more control over the instantiation of your controllers, such as using a third-party IoC container, you'll need to use the Laravel controller factory\.+例えばサードパーティのIoCコンテナなどを利用し、もっと自分でコントローラーのインスタンス化をコントロールしたければ、Laravelのコントローラーファクトリーを使う必要があります。+

s+\*\*Register an event to handle controller instantiation:\*\*+**コントローラーのインスタンス化を処理するためにイベントを登録する**+


s+The event will receive the class name of the controller that needs to be resolved\. +イベントは解決するべきコントローラのクラス名を受け取ります。+

s+All you need to do is return an instance of the controller\.+必要なことはそのコントローラーのインスタンスを返してあげることが全てです。+
