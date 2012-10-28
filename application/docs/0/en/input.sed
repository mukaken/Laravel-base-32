s+The \*\*Input\*\* class handles input that comes into your application via GET, POST, PUT, or DELETE requests\. +**input**クラスはアプリケーションへGET、POST、PUT、DELETEリクエストを通じて行われる入力を処理します。+

s+Here are some examples of how to access input data using the Input class:+入力データーへどうやってアクセスするのか、いくつか例を見てみましょう。+

s+Retrieve a value from the input array:+入力配列から値を得る+

s+\*\*Note:\*\* The "get" method is used for all request types (GET, POST, PUT, and DELETE), not just GET requests\.+**注目：**"get"メソッドは、全てのリクエストタイプ(GET、POST、PUT、DELETE)の入力を扱います。GETだけではありません。+

s+Retrieve all input from the input array:+入力配列から、全部入力を得る+

s+Retrieve all input including the $_FILES array:+$_FILES配列も含めて、全ての入力を得る+

s+By default, \*null\* will be returned if the input item does not exist\. +デフォルトでは、入力アイテムが存在しない場合、*null*が返されます。+

s+However, you may pass a different default value as a second parameter to the method:+しかし、メソッドの２番目の引数として、他のデフォルト値を指定できます。+

s+Returning a default value if the requested input item doesn't exist:+要求する入力項目が存在しない時の、デフォルト値を指定する+

s+Using a Closure to return a default value:+デフォルト値を返すために、無名関数を使用する+

s+Determining if the input contains a given item:+与えられた名前のアイテムが入力に存在するか確かめる+

s+\*\*Note:\*\* The "has" method will return \*false\* if the input item is an empty string\.+**注目：**"has"メソッドは、入力項目が空文字列の場合、*false*を返します。+


s+When working with JavaScript MVC frameworks like Backbone\.js, you will need to get the JSON posted by the application\. +例えば、BackboneのようなJavascript MVCフレームワークを使用している時、アプリケーションでJSONのポストを受け取る必要があるでしょう。+

s+To make your life easier, we've included the `Input::json` method:+人生を楽にするために、"Input::json"メソッドを導入してあります。+

s+Get JSON input to the application:+アプリケーションで、JSON入力を受け取る+

s+Retrieving all items from the $_FILES array:+全ての$_FILES配列を受け取る+

s+Retrieving an item from the $_FILES array:+$_FILES配列から、一つの項目を受け取る+

s+Retrieving a specific item from a $_FILES array:+$_FILES配列から、特定のアイテムを受け取る+


s+You'll commonly need to re-populate forms after invalid form submissions\. +正しくないフォームが送信された後は、通常再表示する必要があります。+

s+Laravel's Input class was designed with this problem in mind\. +LaravelのInputクラスは、この問題も心に留めて設計されています。+

s+Here's an example of how you can easily retrieve the input from the previous request\. +ここに示すのは、いかに簡単に前のリクエストから入力を受け取れるかという例です。+

s+First, you need to flash the input data to the session:+最初に、セッションに入力データーを退避します。+

s+Flashing input to the session:+セッションに入力を退避する+

s+Flashing selected input to the session:+特定の入力をセッションに退避する+

s+Retrieving a flashed input item from the previous request:+前回のリクエストで退避した入力を受け取る+

s+\*\*Note:\*\* You must specify a session driver before using the "old" method\.+**注目：**"old"メソッドを使用する前に、セッションドライバーを指定してください。+


s+Now that you know how to flash input to the session\. +これで、どうやって入力をセッションに退避させるか理解できたでしょう。+

s+Here's a shortcut that you can use when redirecting that prevents you from having to micro-manage your old input in that way:+リダイレクトする場合、古い入力に多少手間をかけなくても良いように、ショートカットも使えます。+

s+Flashing input from a Redirect instance:+Redirectインスタンスで、入力を退避する+

s+Flashing selected input from a Redirect instance:+Redirectインスタンスで、特定の入力を退避する+


s+Laravel provides a nice wrapper around the $_COOKIE array\. +Laravelは$_COOKIE配列を、ナイスにラップしています。+

s+However, there are a few things you should be aware of before using it\. +しかしながら、使用する前にいくつかの点を認識しておく必要があります。+

s+First, all Laravel cookies contain a "signature hash"\. +最初に、全てのLaravelクッキーは「署名ハッシュ」で保存されます。+

s+This allows the framework to verify that the cookie has not been modified on the client\. +これによりフレームワークが、そのクッキーはユーザーによって変更されていないことを確認できるようになります。+

s+Secondly, when setting cookies, the cookies are not immediately sent to the browser, but are pooled until the end of the request and then sent together\. +第二に、クッキーを保存する場合、そのクッキーは直ぐにブラウザには送信されません。リクエストの最後まで保持し、一緒に送信されます。+

s+This means that you will not be able to both set a cookie and retrieve the value that you set in the same request\.+これが意味するのは、セットしたクッキーの値を同じリクエストの中で取得することはできないということを表します。+

s+Retrieving a cookie value:+クッキーの値を取得する+

s+Returning a default value if the requested cookie doesn't exist:+要求したクッキーが存在していない場合のデフォルト値を指定する+

s+Setting a cookie that lasts for 60 minutes:+持続時間６０分のクッキーを保存する+

s+Creating a "permanent" cookie that lasts five years:+５年間持続する、「永続」クッキーを作成する+

s+Deleting a cookie:+クッキーを削除する+

s+Sometimes you may wish to merge or replace the current input\. Here's how:+時々、現時点の入力とマージしたり、書き換えたりしたいことがあるでしょう。+

s+Merging new data into the current input:+現在の入力に新しいデーターをマージする+

s+Replacing the entire input array with new data:+入力全部を新しいデーターに置き換える+

s+Clearing Input+入力のクリア+

s+To clear all input data for the current request, you may use the `clear` method:+現在のリクエストの入力データーを全てクリアする場合は、"clear"メソッドを使用してください：+

s+Cookie::+XXXcoo::+