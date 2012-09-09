# 入力とクッキー

## 内容

- [入力](#input)
- [JSON 入力](#json)
- [ファイル](#files)
- [以前の入力](#old-input)
- [以前の入力とリダイレクト](#redirecting-with-old-input)
- [クッキー](#cookies)
- [マージと置換え](#merge)

<a name="input"></a>
## 入力

**input**クラスはアプリケーションへGET、POST、PUT、DELETEリクエストを通じて行われる入力を処理します。入力データーへどうやってアクセスするのか、いくつか例を見てみましょう。

#### 入力配列から値を得る

	$email = Input::get('email');

> **注目：**"get"メソッドは、全てのリクエストタイプ(GET、POST、PUT、DELETE)の入力を扱います。GETだけではありません。

#### 入力配列から、全部入力を得る

	$input = Input::get();

#### $_FILES配列も含めて、全ての入力を得る

	$input = Input::all();

デフォルトでは、入力アイテムが存在しない場合、*null*が返されます。しかし、メソッドの２番目の引数として、他のデフォルト値を指定できます。

#### 要求する入力項目が存在しない時の、デフォルト値を指定する

	$name = Input::get('name', 'Fred');

#### デフォルト値を返すために、無名関数を使用する

	$name = Input::get('name', function() {return 'Fred';});

#### 与えられた名前のアイテムが入力に存在するか確かめる

	if (Input::has('name')) ...

> **注目：**"has"メソッドは、入力項目が空文字列の場合、*false*を返します。

<a name="json"></a>
## JSON 入力

例えば、BackboneのようなJavascript MVCフレームワークを使用している時、アプリケーションでJSONのポストを受け取る必要があるでしょう。人生を楽にするために、"Input::json"メソッドを導入してあります。

#### アプリケーションで、JSON入力を受け取る

	$data = Input::json();

<a name="files"></a>
## ファイル

#### 全ての$_FILES配列を受け取る

	$files = Input::file();

#### $_FILES配列から、一つの項目を受け取る

	$picture = Input::file('picture');

#### $_FILES配列から、特定のアイテムを受け取る

	$size = Input::file('picture.size');

<a name="old-input"></a>
## 以前の入力

正しくないフォームが送信された後は、通常再表示する必要があります。LaravelのInputクラスは、この問題も心に留めて設計されています。ここに示すのは、いかに簡単に前のリクエストから入力を受け取れるかという例です。最初に、セッションに入力データーを退避します。

#### セッションに入力を退避する

	Input::flash();

#### 特定の入力をセッションに退避する

	Input::flash('only', array('username', 'email'));

	Input::flash('except', array('password', 'credit_card'));

#### 前回のリクエストで退避した入力を受け取る

	$name = Input::old('name');

> **注目：**"old"メソッドを使用する前に、セッションドライバーを指定してください。

*参照：*

- *[セッション](/docs/session/config)*

<a name="redirecting-with-old-input"></a>
## 以前の入力とリダイレクト

これで、どうやって入力をセッションに退避させるか理解できたでしょう。リダイレクトする場合、古い入力に多少手間をかけなくても良いように、ショートカットも使えます。

#### Redirectインスタンスで、入力を退避する

	return Redirect::to('login')->with_input();

#### Redirectインスタンスで、特定の入力を退避する

	return Redirect::to('login')->with_input('only', array('username'));

	return Redirect::to('login')->with_input('except', array('password'));

<a name="cookies"></a>
## クッキー

Laravelは$_COOKIE配列を、ナイスにラップしています。しかしながら、使用する前にいくつかの点を認識しておく必要があります。最初に、全てのLaravelクッキーは「署名ハッシュ」で保存されます。これによりフレームワークが、そのクッキーはユーザーによって変更されていないことを確認できるようになります。第二に、クッキーを保存する場合、そのクッキーは直ぐにブラウザには送信されません。リクエストの最後まで保持し、一緒に送信されます。これが意味するのは、セットしたクッキーの値を同じリクエストの中で取得することはできないということを表します。

#### クッキーの値を取得する

	$name = Cookie::get('name');

#### 要求したクッキーが存在していない場合のデフォルト値を指定する

	$name = Cookie::get('name', 'Fred');

#### 持続時間６０分のクッキーを保存する

	Cookie::put('name', 'Fred', 60);

#### ５年間持続する、「永続」クッキーを作成する

	Cookie::forever('name', 'Fred');

#### クッキーを削除する

	Cookie::forget('name');

<a name="merge"></a>
## マージと置換え

時々、現時点の入力とマージしたり、書き換えたりしたいことがあるでしょう。

#### 現在の入力に新しいデーターをマージする

	Input::merge(array('name' => 'Spock'));

#### 入力全部を新しいデーターに置き換える

	Input::replace(array('doctor' => 'Bones', 'captain' => 'Kirk'));

## 入力のクリア

現在のリクエストの入力データーを全てクリアする場合は、"clear"メソッドを使用してください：

	Input::clear();