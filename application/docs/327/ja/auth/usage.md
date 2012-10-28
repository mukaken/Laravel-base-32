# 認証使用法

## 内容

- [ソルトとハッシュ](#hash)
- [ログイン](#login)
- [ルートの保護](#filter)
- [ログインしたユーザーの取得](#user)
- [ログアウト](#logout)
- [カスタムドライバーの作成](#drivers)

> **注目：**Authクラスを使用する前に、[セッションドライバーを設定](docs/session/config)する必要があります。

<a name="hash"></a>
## ソルトとハッシュ

Authクラスを使用する場合、すべてのパスワードにハッシュとソルトを使用するように、強く推奨します。Webの開発は、責任をもって行われるべきです。ソルトとハッシュはユーザーのパスワードに対するレインボウテーブル攻撃の効力を無くします。

パスワードのソルトとハッシュは**Hash**クラスを使用します。Hashクラスは**暗号化**ハッシュアルゴリズムを使用します。例を確認してください。

	$password = Hash::make('secret');

Hashクラスの**make**メソッドは、６０文字のハッシュ文字列を返します。

**Hash**クラスの**check**メソッドを使えば、ハッシュされていない値とハッシュされた値を比較することができます。

	if (Hash::check('secret', $hashed_value))
	{
		return 'The password is valid!';
	}

<a name="login"></a>
## ログイン

アプリケーションのログイン処理は、Authクラスの**attempt**メソッドを使ってください。ただ、ユーザー名とパスワードをメソッドに渡すだけです。ログインに必要な内容は配列で渡します。柔軟性を高めるため、ドライバー毎に必要な引数の数は異なります。ログイン内容が有効であれば、**true**が返されます。そうでなければ、**false**です。

	$credentials = array('username' => 'example@gmail.com', 'password' => 'secret');

	if (Auth::attempt($credentials))
	{
	     return Redirect::to('user/profile');
	}

ユーザーのログイン内容が有効であった場合、IDはセッションに補完され、その後に続くアプリケーションへのリクエストで、「ログイン」状態として取り扱われます。

アプリケーション中でユーザーがログインしているかを判断するには、**check**メソッドを使用します。

	if (Auth::check())
	{
	     return "You're logged in!";
	}

ユーザーが登録した後などに、チェックを行わずログインさせる場合は、**login**メソッドを使ってください。ユーザーのオブジェクトかIDを渡します。

	Auth::login($user);

	Auth::login(15);

<a name="filter"></a>
## ルートの保護

ログイン済みのユーザーだけに特定のルートへアクセスさせるのは、一般的です。Laravelでは、[authフィルター](/docs/routing#filters)でこれを実現しています。ユーザーがログインしていれば、通常通りリクエストは処理されます。しかし、ユーザーがログインシテイなければ、"login"という[名前付きルート](/docs/routing#named-routes)へリダイレクトされます。

ルートを保護するためには、**auth**フィルターを付け加えるだけです。

	Route::get('admin', array('before' => 'auth', function() {}));

> **注目：**お好きなように、**auth**フィルターは編集できます。A default implementation is located in **application/routes.php**.

<a name="user"></a>
## ログインしたユーザーの取得

一度ユーザーがアプリケーションにログインしたら、Authクラスの**user**メソッドを使用し、ユーザーモデルにアクセスできます。

	return Auth::user()->email;

> **注目：**もし、ユーザーがログインしてなければ、**user**メソッドはNULL値を返します。

<a name="logout"></a>
## ログアウト

ユーザーをアプリケーションからログアウトさせる用意ができましたか？

	Auth::logout();

このメソッドはセッションからユーザーIDを取り除き、以降のアプリケーションに対するリクエストで、ユーザーはログアウトしているとして扱われます。