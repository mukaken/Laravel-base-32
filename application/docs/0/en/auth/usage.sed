s+\*\*Note:\*\* Before using the Auth class, you must \[specify a session driver\](\/docs\/session\/config)\.+**注目：**Authクラスを使用する前に、[セッションドライバーを設定](docs/session/config)する必要があります。+



s+If you are using the Auth class, you are strongly encouraged to hash and salt all passwords\. +Authクラスを使用する場合、すべてのパスワードにハッシュとソルトを使用するように、強く推奨します。+

s+Web development must be done responsibly\. +Webの開発は、責任をもって行われるべきです。+

s+Salted, hashed passwords make a rainbow table attack against your user's passwords impractical\.+ソルトとハッシュはユーザーのパスワードに対するレインボウテーブル攻撃の効力を無くします。+

s+Salting and hashing passwords is done using the \*\*Hash\*\* class\. +パスワードのソルトとハッシュは**Hash**クラスを使用します。+

s+The Hash class is uses the \*\*bcrypt\*\* hashing algorithm\. +Hashクラスは**暗号化**ハッシュアルゴリズムを使用します。+

s+Check out this example:+例を確認してください。+

s+The \*\*make\*\* method of the Hash class will return a 60 character hashed string\.+Hashクラスの**make**メソッドは、６０文字のハッシュ文字列を返します。+

s+You can compare an unhashed value against a hashed one using the \*\*check\*\* method on the \*\*Hash\*\* class:+**Hash**クラスの**check**メソッドを使えば、ハッシュされていない値とハッシュされた値を比較することができます。+


s+Logging a user into your application is simple using the \*\*attempt\*\* method on the Auth class\. +アプリケーションのログイン処理は、Authクラスの**attempt**メソッドを使ってください。+

s+Simply pass the username and password of the user to the method\. +ただ、ユーザー名とパスワードをメソッドに渡すだけです。+

s+The credentials should be contained in an array, which allows for maximum flexibility across drivers, as some drivers may require a different number of arguments\. +ログインに必要な内容は配列で渡します。柔軟性を高めるため、ドライバー毎に必要な引数の数は異なります。+

s+The login method will return \*\*true\*\* if the credentials are valid\. +ログイン内容が有効であれば、**true**が返されます。+

s+Otherwise, \*\*false\*\* will be returned:+そうでなければ、**false**です。+

s+If the user's credentials are valid, the user ID will be stored in the session and the user will be considered "logged in" on subsequent requests to your application\.+ユーザーのログイン内容が有効であった場合、IDはセッションに補完され、その後に続くアプリケーションへのリクエストで、「ログイン」状態として取り扱われます。+

s+To determine if the user of your application is logged in, call the \*\*check\*\* method:+アプリケーション中でユーザーがログインしているかを判断するには、**check**メソッドを使用します。+


s+Use the \*\*login\*\* method to login a user without checking their credentials, such as after a user first registers to use your application\. +ユーザーが登録した後などに、チェックを行わずログインさせる場合は、**login**メソッドを使ってください。+

s+Just pass your user object or the user's ID:+ユーザーのオブジェクトかIDを渡します。+




s+It is common to limit access to certain routes only to logged in users\. +ログイン済みのユーザーだけに特定のルートへアクセスさせるのは、一般的です。+

s+In Laravel this is accomplished using the \[auth filter\](\/docs\/routing#filters)\. +Laravelでは、[authフィルター](/docs/routing#filters)でこれを実現しています。+

s+If the user is logged in, the request will proceed as normal; however, if the user is not logged in, they will be redirected to the "login" \[named route\](\/docs\/routing#named-routes)\.+ユーザーがログインしていれば、通常通りリクエストは処理されます。しかし、ユーザーがログインシテイなければ、"login"という[名前付きルート](/docs/routing#named-routes)へリダイレクトされます。+

s+To protect a route, simply attach the \*\*auth\*\* filter:+ルートを保護するためには、**auth**フィルターを付け加えるだけです。+


s+\*\*Note:\*\* You are free to edit the \*\*auth\*\* filter however you like\. +**注目：**お好きなように、**auth**フィルターは編集できます。+

s+A default implementation is located in \\*\\*application\\/routes\\.php\\*\\*\\.+**application/routes.php**にデフォルトの実装があります。+



s+Once a user has logged in to your application, you can access the user model via the \*\*user\*\* method on the Auth class:+一度ユーザーがアプリケーションにログインしたら、Authクラスの**user**メソッドを使用し、ユーザーモデルにアクセスできます。+


s+\*\*Note:\*\* If the user is not logged in, the \*\*user\*\* method will return NULL\.+**注目：**もし、ユーザーがログインしてなければ、**user**メソッドはNULL値を返します。+




s+Ready to log the user out of your application?+ユーザーをアプリケーションからログアウトさせる用意ができましたか？+

s+This method will remove the user ID from the session, and the user will no longer be considered logged in on subsequent requests to your application\.+このメソッドはセッションからユーザーIDを取り除き、以降のアプリケーションに対するリクエストで、ユーザーはログアウトしているとして扱われます。+
