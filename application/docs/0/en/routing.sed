s/Laravel uses the latest features of PHP 5.3 to make routing simple and expressive. /LaravelはPHP 5.3の最新機能をルーティングをシンプルで記述的にするために使用しています。/

s/It's important that building everything from APIs to complex web applications is as easy as possible. /これはAPIから複雑なWebアプリケーションまで、全てをできる限り簡単に作成するために、重要なことです。/
s+Routes are typically defined in \*\*application/routes\.php\*\*\.+通常ルートは**application/routes.php**で定義されます。+

s/Unlike many other frameworks with Laravel it's possible to embed application logic in two ways. /多くの他のフレームワークと異なり、Laravelは２つの方法でアプリケーションロジックを埋め込むことができます。/

s/While controllers are the most common way to implement application logic it's also possible to embed your logic directly into routes. /とても一般的な方法ですがアプリケーションロジックをコントローラーに埋め込む事も、またroutes.phpに直接記述することもできます。/

s/This is \*\*especially\*\* nice for small sites that contain only a few pages as you don't have to create a bunch of controllers just to expose half a dozen methods or put a handful of unrelated methods into the same controller and then have to manually designate routes that point to them./これは**特に**数ページの小さなサイトにぴったりで、半ダースのメソッドを小さないくつかのコントローラに書いたり、関連性の薄いメソッドをいくつかのコントローラーに詰め込んだりした後で、更にこうしたコントローラーへルートを設定する必要はありません。/


s/In the following example the first parameter is the route that you're "registering" with the router. /以降の例では、最初の引数は「登録する」ルートです。/

s/The second parameter is the function containing the logic for that route. /２つ目の引数はそのルートで行うロジックを含む関数です。/

s/Routes are defined without a front-slash. /ルートには基本的に先頭の\/は付けません。/

s/The only exception to this is the default route which is represented with \*\*only\*\* a front-slash./唯一の例外は、デフォルトルートの場合で、\/**のみ**を指定します。/


s/\*\*Note:\*\* Routes are evaluated in the order that they are registered, so register any "catch-all" routes at the bottom of your \*\*routes.php\*\* file./**注意：** ルートは登録された順番に評価されます。ですから、「全てに当てはまる」ルートは**routes.php**の最後に追加しましょう。/



s/Registering a route that responds to "GET \/":/"GET \/"に対応するルートを登録する/


s/Registering a route that is valid for any HTTP verb (GET, POST, PUT, and DELETE):/全てのHTTP変数(GET、POST、PUT、DELETE)に対するルートを登録する/


s/Registering routes for other request methods:/他のリクエストメソッドに対するルートを登録する/


s/\*\*Registering a single URI for multiple HTTP verbs:\*\*/一つのURIに複数のHTTP変数を登録する/


s/Forcing a URI segment to be any digit:/数字と一致するURIセグメント/


s/Allowing a URI segment to be any alpha-numeric string:/英数字と一致するURIセグメント/


s/Allowing a URI segment to be optional:/オプションのURIセグメント/


s/If a request enters your application but does not match any existing route, the 404 event will be raised. /アプリケーションにリクエストがあっても、どのルートにも一致しない場合は、404イベントが発生します。/

s+You can find the default event handler in your \*\*application/routes.php\*\* file.+デフォルトのイベントハンドラーは**application/routes.php**の中にあります。+


s/You are free to change this to fit the needs of your application!/あなたのアプリケーションにぴったりになるよう、自由に変更して下さい！/

s/The default 404 event handler:/デフォルト404イベントハンドラー/

s/Futher Reading:/参照：/

s+Route filters may be run before or after a route is executed. +ルートフィルターは、あるルートが実行される前と後に実行されるものです。+

s+If a "before" filter returns a value, that value is considered the response to the request and the route is not executed, which is convenient when implementing authentication filters, etc. +もし、"before"フィルターが値を返したら、その値はリクエストに対するレスポンスだと考え、そのルートは実行されません。これは認証フィルターなどを組み込み時に便利です。+

s+Filters are typically defined in \*\*application/routes.php\*\*.+フィルターは基本的に**application/routes.php**で定義されます。+


s/Registering a filter:/フィルターを登録する/

s/Attaching a filter to a route:/ルートにフィルターを付ける/

s/Attaching an "after" filter to a route:/ルートに"after"フィルターを付ける/

s/Attaching multiple filters to a route:/ルートに複数のフィルターを付ける/

s/Passing parameters to filters:/フィルターに引数を渡す/

s/Sometimes you may want to attach a filter to all requests that begin with a given URI. /時々、特定のURIで始まるルート全部にフィルターを付けたいことがあるでしょう。/

s/For example, you may want to attach the "auth" filter to all requests with URIs that begin with "admin". /例えば、"auth"フィルターを"admin"で始まるURIに対する全てのリクエストに適用したい場合です。/

s/Here's how to do it:/どうやるのか、御覧ください。/



s/Defining a URI pattern based filter:/フィルターを基にし、URIパターンを定義する/


s/Laravel has two "global" filters that run \*\*before\*\* and \*\*after\*\* every request to your application. /Laravelには２つの「グローバル」フィルターが用意されており、**before**と**after**はアプリケーションに対する全てのリクエストで実行されます。/

s+You can find them both in the \*\*application/routes.php\*\* file. +両方共に**application/routes.php**の中で定義されています。+

s/These filters make great places to start common bundles or add global assets./これらのフィルターは共通のバンドルを開始したり、グローバルなアセットを追加するのに良い場所です。/

s/\*\*Note:\*\* The \*\*after\*\* filter receives the \*\*Response\*\* object for the current request./**注目：** **after**フィルターは、現在のリクエストに対する**Response**オブジェクトを受け取ります。/

s/Route groups allow you to attach a set of attributes to a group of routes, allowing you to keep your code neat and tidy./ルートグループは、コードをきれいにこざっぱりと保ったまま、ルートのグループに対し、一連の属性を付け加えるために利用できます。/

s/Constantly generating URLs or redirects using a route's URI can cause problems when routes are later changed. /いつもURLの生成やリダイレクトにルートのURIを使っていると、ルートを後で変更するときにトラブルが起き得ます。/

s/Assigning the route a name gives you a convenient way to refer to the route throughout your application. /アプリケーション全体を通じて、ルートに付けた名前で参照するのは、便利な方法です。/

s/When a route change occurs the generated links will point to the new route with no further configuration needed./ルートの変更が発生しても、リンクは新しいルートを示しますので、それ以上の変更は必要ありません。/



s/Registering a named route:/名前付きルートを登録する/


s/Generating a URL to a named route:/名前付きルートに対するURLを生成する/

s/Redirecting to the named route:/名前付きルートへリダイレクトする/

s/Once you have named a route, you may easily check if the route handling the current request has a given name./一度ルートに名前をつければ、現在のリクエストを処理しているルートが、名前を与えられたルートかどうか、簡単にチェックできます。/

s/Determine if the route handling the request has a given name:/リクエストを処理しているルートが、名前を与えられたものか判断する/


s/When defining routes, you may use the "https" attribute to indicate that the HTTPS protocol should be used when generating a URL or Redirect to that route./ルートを定義するときに、"https"アトリビュートを指定することで、そのルートに対するURLを生成したり、リダイレクトする時にHTTPSプロトコルを使用することができます。/

s/Defining an HTTPS route:/HTTPSルートを定義する/

s/Using the "secure" short-cut method:/"secure"ショートカットメソッドを使用する/



s/Bundles are Laravel's modular package system. /バンドルはLaravelのモジュールパッケージシステムです。/

s/Bundles can easily be configured to handle requests to your application. /アプリケーションに対するリクエストを簡単にバンドルに処理させるように設定することができます。/

s+We'll be going over \[bundles in more detail\](\/docs\/bundles) in another document. +[バンドルの詳細](/docs/bundles)については別のドキュメントを御覧ください。+

s/For now, read through this section and just be aware that not only can routes be used to expose functionality in bundles, but they can also be registered from within bundles./今のところは、このセクションを読み通して、バンドルの中で処理するようにルートを使えるだけでなく、バンドルの中でも登録できるという認識を持っていただければ結構です。/

s+Let's open the \*\*application\/bundles\.php\*\* file and add something:+**application/bundles.php**ファイルを開き、なにか追加しましょう。+


s/Notice the new \*\*handles\*\* option in our bundle configuration array? /新しい**handles**オプションがバンドル設定配列にあるのに気づきましたか？/

s/This tells Laravel to load the Admin bundle on any requests where the URI begins with "admin"./これでLaravelに"admin"で始まるURIのりクエストは全て、Adminバンドルに行くように伝えています。/

s/Now you're ready to register some routes for your bundle, so create a \*\*routes.php\*\* file within the root directory of your bundle and add the following:/これで、バンドルにいくつかルートを登録する準備ができました。今度は、**routes.php**ファイルをあなたのバンドルのルートディレクトリーに作成し、以下のコードを付け加えてください。/

s/Registering a root route for a bundle:/バンドルのルート(root)ルートを登録する/

s/Let's explore this example. /この例を解説しましょう。/

s/Notice the \*\*(:bundle)\*\* place-holder? /**(:bundle)**プレースホルダーに気が付きましたか？/

s/That will be replaced with the value of the \*\*handles\*\* clause that you used to register your bundle. /これはバンドルを登録するときに使用した、**handles**節の値に置き換わります。/

s+This keeps your code \[D.R.Y.\](http:\/\/en.wikipedia.org\/wiki\/Don't_repeat_yourself) and allows those who use your bundle to change it's root URI without breaking your routes! +これはコードを[D.R.Y.](http://en.wikipedia.org/wiki/Don't_repeat_yourself)に保ち、あなたのバンドルを使用する人が、あなたの定義したルートを壊さずに、バンドルへのルートURIを変更できるようにしてくれます。+

s/Nice, right?/ナイスでしょ？/

s/Of course, you can use the \*\*(:bundle)\*\* place-holder for all of your routes, not just your root route./もちろん、**(:bundle)**プレースホルダーは、ルートルートだけでなく、ルート全てに使用できます。/

s/Registering bundle routes:/バンドルのルートを登録する/


s/Controllers provide another way to manage your application logic. /コントローラーはアプリケーションロジックを管理する別の方法です。/

s+If you're unfamiliar with controllers you may want to \[read about controllers\](\/docs\/controllers) and return to this section.+もしコントローラーに不慣れでしたら、先に[コントローラーについて](/docs/controllers)読み、このセクションに戻ってきてください。+

s/It is important to be aware that all routes in Laravel must be explicitly defined, including routes to controllers. /Laravelの全てのルートについて認識しておくべき重要なことは、コントローラーへのルートも含め、明確に定義されている必要があることです。/

s/This means that controller methods that have not been exposed through route registration \*\*cannot\*\* be accessed. /これが意味するのは、ルート登録がされていないコントローラーメソッドに対してはアクセス**できない**ということです。/

s/It's possible to automatically expose all methods within a controller using controller route registration. /コントローラーの中のメソッドは、コントローラールート登録を使用すれば、自動的に全て定義することができます。/

s+Controller route registrations are typically defined in \*\*application\/routes.php\*\*.+コントローラールートの登録は基本的に**application/routes.php**の中で定義します。+

s/Most likely, you just want to register all of the controllers in your application's "controllers" directory. /大抵の場合、アプリケーション中の"controllers"ディレクトリーに存在する、全てのコントローラーを一度に登録したいことでしょう。/

s/You can do it in one simple statement. /たった一文で出来ますよ。/

s/Here's how:/御覧ください。/

s/Register all controllers for the application:/アプリケーションの全てのコントローラーを登録する/


s/The \*\*Controller::detect\*\* method simply returns an array of all of the controllers defined for the application./**Controller::detect**メソッドは、シンプルにアプリケーションで定義されているコントローラーを全て配列で返します。/

s/If you wish to automatically detect the controllers in a bundle, just pass the bundle name to the method. /もし、バンドルに含まれるコントローラーを自動的に突き止めたい時は、バンドル名をメソッドに渡すだけです。/

s/If no bundle is specified, the application folder's controller directory will be searched./バンドル名が指定されない時は、applicationフォルダーのcontrollersディレクトリーが検索されます。/

s/Register all controllers for the "admin" bundle:/"admin"バンドルのコントローラーを全て登録する/

s/Registering the "home" controller with the Router:/ルーターに"home"コントローラーを登録する/

s/Registering several controllers with the router:/ルーターに複数のコントローラーを登録する/

s/Once a controller is registered, you may access its methods using a simple URI convention:/一度コントローラーを登録すれば、メソッドにはシンプルなURI規約でアクセスできます。/

s+http:\/\/localhost\/controller\/method\/arguments+http://localhost/コントローラー/メソッド/引数+

s/This convention is similar to that employed by CodeIgniter and other popular frameworks, where the first segment is the controller name, the second is the method, and the remaining segments are passed to the method as arguments. /この規約はCodeigniterや他の人気のあるフレームワークで採用されているものと似ており、最初の引数がコントローラー、２番目がメソッド、残りのセグメントはメソッドの引数として渡されます。/

s/If no method segment is present, the "index" method will be used./もしメソッドセグメントがなければ、"index"メソッドがつかわれます。/

s/This routing convention may not be desirable for every situation, so you may also explicitly route URIs to controller actions using a simple, intuitive syntax./このルーティング規約はすべての状況で好ましくは無いでしょう。そこでシンプルで直感的なシンタックスを使い、URIをコントローラーアクションに明確にルートすることもできます。/

s/Registering a route that points to a controller action:/コントローラーアクションを指定してルートを登録する/

s/Registering a filtered route that points to a controller action:/コントローラーアクションを指定し、フィルターも使ったルートを登録する/

s/You may test your routes using Laravel's "Artisan" CLI. /Laravelの"Artisan"CLIを使い、ルートをテストすることができます。/

s/Simple specify the request method and URI you want to use. /シンプルにリクエストするメソッドと、URIを指定してください。/

s/The route response will be var_dump'd back to the CLI./ルートのレスポンスがCLIでvar_dumpされます。/

s/Calling a route via the Artisan CLI:/Artisan CLIを通して、ルートを呼び出す/

s/Registering a bundle to handle routes:/ルートを扱うバンドルを登録する/

s+Optionally you can register filters directly when attaching filters to a given URI by supplying an array with the name of the filter and a callback.+配列を使用し、フィルター名とコールバックをURIと共に指定することで、直接フィルターを登録することも可能です。+

s+Defining a filter and URI pattern based filter in one:+フィルターとURIパターンを同時に定義する+

s+Registering a named route that points to a controller action:+コントローラーアクションを示す名前付きルートを登録+

s+The "home" route is handling the request!+ "home"ルートは、リクエストを処理しています!+

s+\*\*Note:\*\* It is important to note that this method gives you no control over the order in which controllers are loaded\. +** 注意：**このメソッドではコントローラーをロードする順番をコントロールできないことに注意してください。+

s+Controller::detect() should only be used to Route controllers in very small sites\. +Controller::detect()はとても小さなサイトに対してのみ使用するべきでしょう。+

s+"Manually" routing controllers gives you much more control, is more self-documenting, and is certainly advised\.+明確にアドバイスするなら、「手動」でコントローラーのルーティングを記述することは、よりルーティングをコントロールし、より読みやすくなるということです。+

s+Catching the remaining URI without limitations:+残りのURIを制限なしに捉える+