s+Bundles are the heart of the improvements that were made in Laravel 3\.0\. +バンドルはLaravel3.0の改善点の中心になるものです。+

s+They are a simple way to group code into convenient "bundles"\. +シンプルな方法で、コードを便利な「バンドル（束）」にグルーピングできるようになりました。+

s+A bundle can have it's own views, configuration, routes, migrations, tasks, and more\. +バンドルは、それぞれ独自のビュー、設定、ルート、マイグレーション、タスクなどが持てます。+

s+A bundle could be everything from a database ORM to a robust authentication system\. +バンドルでデータベースORMから強固な認証システムまで、何でも開発できます。+

s+Modularity of this scope is an important aspect that has driven virtually all design decisions within Laravel\. +このスコープのモジュール化は重要な一面で、Laravelにおける設計の決定全部を事実上行わせたものです。+

s+In many ways you can actually think of the application folder as the special default bundle with which Laravel is pre-programmed to load and use\.+あなたはapplicationフォルダーを色々な捉え方をしているでしょうが、Laravelに置ける特別なデフォルトバンドルで一番最初にロードされ、使用されるようにプログラムされていると考えることができます。+


s+The first step in creating a bundle is to create a folder for the bundle within your \*\*bundles\*\* directory\. +バンドル作成の最初のステップは、**bundles**ディレクトリーの中にフォルダーを作ることです。+

s+For this example, let's create an "admin" bundle, which could house the administrator back-end to our application\. +例えば、アプリケーションの管理者用バックエンドとして動作する、"admin"バンドルを作成してみましょう。+

s+The \*\*application\/start\.php\*\* file provides some basic configuration that helps to define how our application will run\. +**application/start.php**ファイルはアプリケーションをどのように実行するかを決めるための基本的な設定を提供しています。+

s+Likewise we'll create a \*\*start\.php\*\* file within our new bundle folder for the same purpose\. +同じ目的で、新しいバンドルフォルダーの中に**start.php**ファイルを作成できます。+

s+It is run every time the bundle is loaded\. +これは、バンドルがロードされるといつも実行されます。+
s+Let's create it:+これを作成しましょう。+


s+Creating a bundle start\.php file:+バンドルstart.phpファイルの作成+


s+In this start file we've told the auto-loader that classes that are namespaced to "Admin" should be loaded out of our bundle's models directory\. +このstartファイル中では、オートローダーに対し、名前空間"Admin"のクラスはバンドルのmodelsディレクトリーからロードするように、指示しています。+

s+You can do anything you want in your start file, but typically it is used for registering classes with the auto-loader\. +startファイルの中でなんでも好きな事ができますが、典型的な使用方法はクラスのオートロードを登録することです。+

s+\*\*In fact, you aren't required to create a start file for your bundle\.\*\*+しかし実際のところ、バンドルにstartファイルを作成しなければならない訳ではありません。+

s+Next, we'll look at how to register this bundle with our application!+次に、アプリケーションにこのバンドルをどうやって登録するのかを見てみましょう。+


s+Now that we have our admin bundle, we need to register it with Laravel\. +さあ、adminバンドルは出来ました。Laravleへ登録しなければなりません。+

s+Pull open your \*\*application\/bundles\.php\*\* file\. +**application/bundles.php**を開いてください。+

s+This is where you register all bundles used by your application\. Let's add ours:+このファイルでアプリケーションに必要なバンドルを全て登録します。では、付け加えましょう。+

s+Registering a simple bundle:+シンプルなバンドルを登録する+


s+By convention, Laravel will assume that the Admin bundle is located at the root level of the bundle directory, but we can specify another location if we wish:+利便性のため、Laravelはルートレベルのbundleディレクトリーにあるadminバンドルを読み込もうとしますが、もしご希望なら他の場所を指定することもできます。+

s+Registering a bundle with a custom location:+場所を指定し、バンドルを登録する+


s+Now Laravel will look for our bundle in \*\*bundles\/userscape\/admin\*\*\.+これでLaravelは**bundles/userscape/admin**でバンドルを探します。+



s+Typically, a bundle's \*\*start\.php\*\* file only contains auto-loader registrations\. +通常、バンドルのstart.phpファイルはオートローダーの登録のみ行います。+

s+So, you may want to just skip \*\*start\.php\*\* and declare your bundle's mappings right in its registration array\. +ですから、**start.php**を飛ばして、バンドルのマッピングを登録配列でそのまま宣言できます。+

s+Here's how:+こうなります：+

s+Defining auto-loader mappings in a bundle registration:+バンドル登録で、オートローダーの定義を行う+


s+Notice that each of these options corresponds to a function on the Laravel \[auto-loader\](\/docs\/loading)\. +それぞれのオプションが、Laravelの[オートローダー](/docs/loading)の機能に対応していることに注目してください。+

s+In fact, the value of the option will automatically be passed to the corresponding function on the auto-loader\.+実際、オプションは対応するオートローダーの機能に自動的に渡されています。+

s+You may have also noticed the \*\*(:bundle)\*\* place-holder\. +多分、**(:bundle)**プレースホルダーに気が付かれたことでしょう。+

s+For convenience, this will automatically be replaced with the path to the bundle\. +使いやすいように、これは自動的にバンドルへのパスへ置き換わります。+

s+It's a piece of cake\.+簡単ですね。+



s+So our bundle is created and registered, but we can't use it yet\. +さあ、これでバンドルを作成し、登録も済みました。しかしまだ使えません。+

s+First, we need to start it:+最初にスタートする必要があります。+

s+Starting a bundle:+バンドルを開始する+


s+This tells Laravel to run the \*\*start\.php\*\* file for the bundle, which will register its classes in the auto-loader\. +これでLaravelに、クラスのオートローダーを登録しているだろう、バンドルの**start.php**ファイルを実行するように、指示します。+

s+The start method will also load the \*\*routes\.php\*\* file for the bundle if it is present\.+startメソッドは、**routes.php**がバンドルに存在するならば、それも読みこむように指示します。+

s+\*\*Note:\*\* The bundle will only be started once\. Subsequent calls to the start method will be ignored\.+バンドルは一度だけしか開始できません。続けてstartメソッドを呼び出しても、無視されます。+


s+If you use a bundle throughout your application, you may want it to start on every request\. +もし、アプリケーション全体でバンドルを使用したいのでしたら、リクエストのたびに開始したいでしょう。+

s+If this is the case, you can configure the bundle to auto-start in your \*\*application\/bundles\.php\*\* file:+そんな場合は、**application/bundles.php**ファイルでバンドルを自動スタートするように設定しましょう。+

s+Configuration a bundle to auto-start:+バンドルを自動スタートするように設定する+


s+You do not always need to explicitly start a bundle\. +いつもバンドルを明白に開始する必要はありません。+

s+In fact, you can usually code as if the bundle was auto-started and Laravel will take care of the rest\. +実際、通常はバンドルを自動開始するように設定してしておけば、Laravelは残りを上手く処理します。+

s+For example, if you attempt to use a bundle views, configurations, languages, routes or filters, the bundle will automatically be started!+例えば、バンドルのビュー、設定、言語、ルートやフィルターを使用しようとすると、バンドルは自動的に開始されます。+

s+Each time a bundle is started, it fires an event\. +バンドルが開始されると、毎回イベントが発生します。+

s+You can listen for the starting of bundles like so:+バンドルの開始をこんな風にして、リッスンできます：+

s+Listen for a bundle's start event:+バンドルの開始イベントをリッスンする+


s+It is also possible to "disable" a bundle so that it will never be started\.+更に、バンドルがスタートしないように、「不使用」にすることもできます。+

s+Disabling a bundle so it can't be started:+バンドルを開始しないように、「不使用」にする+



s+Refer to the documentation on \[bundle routing\](\/docs\/routing#bundle-routes) and \[bundle controllers\](\/docs\/controllers#bundle-controllers) for more information on routing and bundles\.+ルーティングとバンドルの情報に関しては、[バンドルルーティング](/docs/routing#bundle-routes)と[バンドルコントローラー](/docs/controllers#bundle-controllers)のドキュメントを参照してください。+


s+As mentioned previously, bundles can have views, configuration, language files and more\. +前に述べた通り、バンドルはビュー、設定、言語ファイルなどを持てます。+

s+Laravel uses a double-colon syntax for loading these items\. +Laravelでは、構文にダブルコロンを使い、それらのアイテムをロードします。+

s+So, let's look at some examples:+いくつか例を見てみましょう。+

s+Loading a bundle view:+バンドルのビューを読み込む+

s+Loading a bundle configuration item:+バンドルの設定アイテムを読み込む+

s+Loading a bundle language line:+バンドルの言語ファイルを読み込む+

s+Sometimes you may need to gather more "meta" information about a bundle, such as whether it exists, its location, or perhaps its entire configuration array\. +時々、存在しているかとか、場所とか、設定配列に含まれているかとか、バンドルの「メタ」情報を集めたい時もあることでしょう。+

s+Here's how:+どうやるのか、見てください：+

s+Determine whether a bundle exists:+バンドルが存在するか調べる+

s+Retrieving the installation location of a bundle:+バンドルがインストールされている場所を取得する+
s+Retrieving the configuration array for a bundle:+バンドルの設定配列を取得する+

s+Retrieving the names of all installed bundles:+インストールされているすべてのバンドル名を取得する+


s+If your bundle contains views, it is likely you have assets such as JavaScript and images that need to be available in the \*\*public\*\* directory of the application\. +もしバンドルにビューが含まれているのでしたら、アプリケーションの**public**ディレクトリーにJavascriptや画像などのアセットを用意する必要があります。+

s+No problem\. +問題ありません+

s+Just create \*\*public\*\* folder within your bundle and place all of your assets in this folder\.+ただ、バンドルの中に**public**フォルダーを作成し、そこに全部のアセットをおいてください。+

s+Great! +素晴らしい！+

s+But, how do they get into the application's \*\*public\*\* folder\. +でも、どうやってアプリケーションの**public**フォルダーへ移せばいいのでしょう。+


s+The Laravel "Artisan" command-line provides a simple command to copy all of your bundle's assets to the public directory\. +Laravelの"artisan"コマンドラインは、全てのバンドルのアセットをpublicディレクトリーへコピーする、シンプルなコマンドを提供しています。+

s+Here it is:+ご覧ください。+

s+Publish bundle assets into the public directory:+publicディレクトリーでバンドルのアセットを公開する+

s+This command will create a folder for the bundle's assets within the application's \*\*public\/bundles\*\* directory\. +このコマンドは、バンドルのアセットのためにapplication下の**public/bundles**ディレクトリーの中にフォルダーを作成します。+

s+For example, if your bundle is named "admin", a \*\*public\/bundles\/admin\*\* folder will be created, which will contain all of the files in your bundle's public folder\.+例えば、あなたのバンドルの名前が"admin"でしたら、**public/bundles/admin**フォルダーが作成され、あなたのバンドルのpublicフォルダー内にある全てのファイルがコピーされます。+

s+For more information on conveniently getting the path to your bundle assets once they are in the public directory, refer to the documentation on \[asset management\](\/docs\/views\/assets#bundle-assets)\.+publicディレクトリーに入れたバンドルアセットへのパスを便利に取得する情報は、[アセット管理](/docs/views/assets#bundle-assets)のドキュメントを参照してください。+


s+Of course, you may always install bundles manually; however, the "Artisan" CLI provides an awesome method of installing and upgrading your bundle\. +もちろんいつでもバンドルを手動でインストールできますが、"artisan" CLIはバンドルをインストール／アップグレードする素晴らしい方法を提供しています。+

s+The framework uses simple Zip extraction to install the bundle\. +フレームワークでは、インストールするバンドルをシンプルにZip解凍して使用します。+

s+Here's how it works\.+実例をご覧ください：+

s+Installing a bundle via Artisan:+artisanでバンドルをインストールする+

s+Great! +素晴らしい！+

s+Now that you're bundle is installed, you're ready to \[register it\](#registering-bundles) and \[publish its assets\](#bundle-assets)\.+これでバンドルがインストールされました。これを[登録](#registering-bundles)し、[アセットを公開](#bundle-assets)する準備ができました。+

s+Need a list of available bundles? +利用できるバンドルのリストが必要ですか？+

s+Check out the Laravel \[bundle directory\](http:\/\/bundles\.laravel\.com)+Laravelの[バンドルディレクトリー](http://bundles.laravel.com)をチェックしてください。+


s+When you upgrade a bundle, Laravel will automatically remove the old bundle and install a fresh copy\.+バンドルをアップグレードすれば、Laravelは自動的に古いバンドルを削除し、新しくコピーします。+

s+Upgrading a bundle via Artisan:+artisanでバンドルをアップグレードする+

s+\*\*Note:\*\* After upgrading the bundle, you may need to \[re-publish its assets\](#bundle-assets)\.+**注目：**バンドルをアップグレードしたあとは、[アセットを再公開](#bundle-assets)してください。+

s+\*\*Important:\*\* Since the bundle is totally removed on an upgrade, you must be aware of any changes you have made to the bundle code before upgrading\. +**重要：**バンドルはアップグレード時に完全に削除されますので、バンドルのコアに加えた変更を認識しておく必要があります。+

s+You may need to change some configuration options in a bundle\. +バンドルの設定オプションを変更する必要もあることでしょう。+

s+Instead of modifying the bundle code directly, use the bundle start events to set them\. +バンドルのコードを直接変更する代わりに、バンドルのstartイベントで設定することができます。+

s+Place something like this in your \*\*application\/start\.php\*\* file\.+次のようなコードを**application/start.php**ファイルに書いてください。+

s+Listening for a bundle's start event:+バンドルのstartイベントをリッスンする+

s+The "admin" bundle has started\.\.\.+"admin"バンドルが開始されました…+