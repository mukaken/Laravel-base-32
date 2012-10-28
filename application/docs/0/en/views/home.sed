s+Views contain the HTML that is sent to the person using your application\. +ビューはアプリケーションを使用している人に送られるHTMLで構成されています。+

s+By separating your view from the business logic of your application, your code will be cleaner and easier to maintain\.+アプリケーションのビジネスロジックから、ビューを分けることで、コードは綺麗になり、メンテナンスしやすくなります。+

s+All views are stored within the \*\*application\/views\*\* directory and use the PHP file extension\. +すべてのビューは**application/views**ディレクトリーの中に設置され、PHPファイル拡張子を付けます。+

s+The \*\*View\*\* class provides a simple way to retrieve your views and return them to the client\. +**View**クラスはビューを取得するシンプルな方法を提供します。それを使用者にリターンします。+

s+Let's look at an example!+例を見てみましょう！+

s+Creating the view:+ビューを作成する+

s+I'm stored in views\/home\/index\.php!+私はviews/home/index.phpに保存されている！+

s+Returning the view from a route:+ルートからビューを返す+

s+Returning the view from a controller:+コントローラーからビューを返す+

s+Determining if a view exists:+ビューが存在するか確かめる+

s+Sometimes you will need a little more control over the response sent to the browser\. +時々、ブラウザーに送るレスポンスをもうちょっとコントロールする必要があることでしょう。+

s+For example, you may need to set a custom header on the response, or change the HTTP status code\. +例えば、レスポンスにカスタムヘッダーをセットしたいとか、HTTPステータスコードを変えたいとかです。+

s+Here's how:+こうやります：+

s+Returning a custom response:+カスタムレスポンスを返す+

s+Returning a custom response containing a view, with binding data:+データーを渡し、ビューを含めたカスタムレスポンスを返す+

s+Returning a JSON response:+JSONレスポンスを返す+

s+Returning Eloquent models as JSON:+EloquentモデルをJSONで返す+


s+Typically, a route or controller will request data from a model that the view needs to display\. +典型的には、ルートかコントローラーは表示するビューのデーターをモデルへリクエストします。+

s+So, we need a way to pass the data to the view\. +ですから、データーをビューに渡す方法が必要になります。+

s+There are several ways to accomplish this, so just pick the way that you like best!+やり方は色々とありますので、自分にベストな方法を選んでください！+

s+Binding data to a view:+ビューにデーターを結びつける+

s+Accessing the bound data within a view:+結びつけたデーターをビューの中でアクセスする+

s+Chaining the binding of data to a view:+ビューにチェーンでデーターを結びつける+

s+Passing an array of data to bind data:+データーを結びつけるために、配列を渡す+

s+Using magic methods to bind data:+データーを結びつけるために、マジックメソッドを使う+

s+Using the ArrayAccess interface methods to bind data:+データーを結びつけるために、配列アクセスインターフェイス方式を使用する。+



s+Often you will want to nest views within views\. +時々、ビューの中からビューをネストしたい場合があるでしょう。+

s+Nested views are sometimes called "partials", and help you keep views small and modular\.+ネストされたビューは時々「パーシャル」と呼ばれますが、ビューを小さく、モジュール分割するのに役に立ちます。+

s+Binding a nested view using the "nest" method:+"nest"メソッドを使い、ネストしたビューを結びつける+

s+Passing data to a nested view:+ネストしたビューにデーターを渡す+

s+Sometimes you may wish to directly include a view from within another view\. +時々、ビューの中から直接他のビューを取り込みたいことがあるでしょう。+

s+You can use the \*\*render\*\* helper function:+**render**ヘルパー機能が使えます。+

s+Using the "render" helper to display a view:+ビューを表示するのに"render"ヘルパーを使用する+



s+It is also very common to have a partial view that is responsible for display an instance of data in a list\. +またこれもよくありますが、リスト中のデーターのインスタンスに応じて、パーシャルビューを表示することもあります。+

s+For example, you may create a partial view responsible for displaying the details about a single order\. +例えば、一つの注文に応じた詳細をパーシャルビューで表示する場合です。+

s+Then, for example, you may loop through an array of orders, rendering the partial view for each order\. +また別の例としては、注文の配列をループで処理し、それぞれのオーダーをパーシャルビューでレンダリングする場合もあるでしょう。+

s+This is made simpler using the \*\*render_each\*\* helper:+このような場合は、シンプルに**render_each**ヘルパーを使ってください。+

s+Rendering a partial view for each item in an array:+配列の中のアイテムをそれぞれパーシャルビューでレンダリングする+


s+The first argument is the name of the partial view, the second is the array of data, and the third is the variable name that should be used when each array item is passed to the partial view\.+最初の引数はパーシャルビューの名前で、２つ目はデータの配列です。３つ目は配列のアイテムそれぞれが、パーシャルビューに渡される時に参照される変数の名前です。+


s+Named views can help to make your code more expressive and organized\. +名前付きビューはコードを表現的で組織立てるのに、役立ちます。+

s+Using them is simple:+シンプルに使ってみましょう。+

s+Registering a named view:+名前付きビューの登録+

s+Getting an instance of the named view:+名前付きビューのインスタンスを得る+

s+Binding data to a named view:+データーを名前付きビューと結びつける+


s+Each time a view is created, its "composer" event will be fired\. +ビューが生成されるたびに"composer"イベントが発生します。+

s+You can listen for this event and use it to bind assets and common data to the view each time it is created\. +このイベントをlestenし、ビューが生成されるたびに資源や共通データーをビューに結びつけることができます。+

s+A common use-case for this functionality is a side-navigation partial that shows a list of random blog posts\. +一般的によくつかわれる機能としては、ブログのサイドナビにあるランダムポストのリストがあげられるでしょう。+

s+You can nest your partial view by loading it in your layout view\. +レイアウトビューの中でロードすることで、パーシャルビューをネストすることができます。+

s+Then, define a composer for that partial\. +それから、パーシャルに対し、コンポーサーを定義します。+

s+The composer can then query the posts table and gather all of the necessary data to render your view\. +それから、コンポーサーはポストテーブルをクエリーし、ビューをレンダリングするのに必要なデーターを全て集めます。+

s+No more random logic strewn about! +ランダムロジックをあちこちにばらまかなくて済みます！+

s+Composers are typically defined in \*\*application\/routes\.php\*\*\. +一般的にコンポーサーは**application/routes.php**の中で定義されます。+

s+Here's an example:+サンプルをどうぞ：+


s+Register a view composer for the "home" view:+"home"ビューにコンポーサーを登録する+


s+Now each time the "home" view is created, an instance of the View will be passed to the registered Closure, allowing you to prepare the view however you wish\.+これで"home"ビューが生成されるたびに、登録した無名関数にViewのインスタンスが渡され、あなたがやりたいことがなんであれ、ビューに対し準備ができます。+

s+Register a composer that handles multiple views:+コンポーサーを複数のビューに対し登録する+


s+\*\*Note:\*\* A view can have more than one composer\. Go wild!+**注目：**ビューは一つ以上のコンポーサーを持てます。使いまくってください！+


s+It's important to note that both routes and controllers require responses to be returned with the 'return' directive\. +重要な注意点は、ルートでもコントローラーでも、"return"文でレスポンスを返さなくてはならないことです。+

s+Instead of calling "Redirect::to()"" where you'd like to redirect the user\. You'd instead use "return Redirect::to()". +ユーザーをお好きな場所へリダイレクトするため、"Redirect::to()"を使う代わりに、"return Redirect::to()"を使ってください。+


s+This distinction is important as it's different than most other PHP frameworks and it could be easy to accidentally overlook the importance of this practice\.+これは他のPHPフレームワークと一番異なっているという点でとても重要です。この実務的な重要点は、思いがけず簡単に見落とされてしまいます。+

s+Redirecting to another URI:+他のURIへリダイレクトする+

s+Redirecting with a specific status:+特定のステータスでリダイレクトする+

s+Redirecting to a secure URI:+セキュアなURIへリダイレクトする+

s+Redirecting to the root of your application:+アプリケーションのルートへリダイレクトする+

s+Redirecting back to the previous action:+以前のアクションへリダイレクトする+

s+Redirecting to a named route:+名前付きルートへリダイレクトする+

s+Redirecting to a controller action:+コントローラーアクションへリダイレクトする+


s+Sometimes you may need to redirect to a named route, but also need to specify the values that should be used instead of the route's URI wildcards\. +時々、名前付きルートへリダイレクトする必要があるが、URIのワイルドカードの代わりに、特定の値を使いたい場合があることでしょう。+

s+It's easy to replace the wildcards with proper values:+ワイルドカードを特定の値へ簡単に置き換えられます。+


s+Redirecting to a named route with wildcard values:+ワイルドカード値を指定して、名前付きルートへリダイレクトする+

s+Redirecting to an action with wildcard values:+ワイルドカード値を指定して、アクションへリダイレクトする+


s+After a user creates an account or signs into your application, it is common to display a welcome or status message\. +アプリケーションにユーザー登録した後や、ログイン後に、ウェルカムもしくはステータスメッセージを表示するのは一般的です。+

s+But, how can you set the status message so it is available for the next request? +しかし、どうやって次のリクエストのステータスメッセージをセットできるのでしょう？+

s+Use the with() method to send flash data along with the redirect response\.+リダイレクトのレスポンスにwith()メソッドを使い、データーをフラッシュ保存できます。+

s+You can access your message from the view with the Session get method:+ビューからのメッセージはSessionのgetメソッドでアクセスできます。+


s+Sending a file download response:+ファイルダウンロードのレスポンスを送る+

s+Sending a file download and assigning a file name:+ファイル名を指定し、ダウンロードレスポンスを送る+


s+To generating proper error responses simply specify the response code that you wish to return\. +特定のエラーレスポンスを生成するには、シンプルに返したいレスポンスコードを指定してください。+

s+The corresponding view stored in \*\*views\/error\*\* will automatically be returned\.+**views/error**の中に保存されている、対応したビューが自動的にリターンされます。+

s+Generating a 404 error response:+404エラーレスポンスを生成する+

s+Generating a 500 error response:+500エラーレスポンスを生成する+
