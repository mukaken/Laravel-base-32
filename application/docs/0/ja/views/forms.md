# フォームの作成

## 内容

- [フォームを開く](#opening-a-form)
- [CSRFプロテクション](#csrf-protection)
- [ラベル](#labels)
- [テキスト、テキストエリア、パスワード、隠しフィールド](#text)
- [チェックボックスとラジオボタン](#checkboxes-and-radio-buttons)
- [ドロップダウンリスト](#drop-down-lists)
- [ボタン](#buttons)
- [カスタムマクロ](#custom-macros)

> **注意：**フォーム要素に表示されるすべての入力データーはHTML::entitiesメソッドを通してフィルタリングされます。

<a name="opening-a-form"></a>
## フォームを開く

#### 現在のURLへPOSTするフォームを開く

	echo Form::open();

#### URIとリクエスト方法を指定し、フォームを開く

	echo Form::open('user/profile', 'PUT');

#### HTTPSのURLへPOSTするフォームを開く

	echo Form::open_secure('user/profile');

#### フォームタグに追加のHTML属性を指定する

	echo Form::open('user/profile', 'POST', array('class' => 'awesome'));

#### ファイルアップロードを受け付けるフォームを開く

	echo Form::open_for_files('users/profile');

#### HTTPSを使い、ファイルアップロードを受け付けるフォームを開く

	echo Form::open_secure_for_files('users/profile');

#### フォームを閉じる

	echo Form::close();

<a name="csrf-protection"></a>
## CSRFプロテクション

Lravelはクロスサイト・リクエスト・フォージェリからサイトを守る簡単な方法を提供しています。まず、ユーザーのセッションにランダムトークンを設置します。これは自動的に行われますので、何もする必要はありません。次に、フォームに隠し入力フィールドを生成し、ランダムトークンを埋め込みます。

#### セッションのCSRFトークンを埋め込む隠しフィールドを生成する

	echo Form::token();

#### ルートにCSRFフィルターを追加する

	Route::post('profile', array('before' => 'csrf', function()
	{
		//
	}));

#### CSRFトークン文字列を取得する

	$token = Session::token();

> LaravelのCSRFプロテクション機能を使用する前に、セッションドライバーを指定する必要があります。

*参照：*

- [ルートフィルター](/docs/routing#filters)
- [クロスサイト・リクエスト・フォージェリ](http://ja.wikipedia.org/wiki/%E3%82%AF%E3%83%AD%E3%82%B9%E3%82%B5%E3%82%A4%E3%83%88%E3%83%AA%E3%82%AF%E3%82%A8%E3%82%B9%E3%83%88%E3%83%95%E3%82%A9%E3%83%BC%E3%82%B8%E3%82%A7%E3%83%AA)

<a name="labels"></a>
## ラベル

#### ラベル要素を生成する

	echo Form::label('email', 'E-Mail Address');

#### ラベルに追加のHTML要素を指定する

	echo Form::label('email', 'E-Mail Address', array('class' => 'awesome'));

> ラベルを生成後に、ラベルと一致する名前で作られるHTML要素は、その名前と同じIDも生成されます。

<a name="text"></a>
## テキスト、テキストエリア、パスワード、隠しフィールド

#### テキスト入力要素の生成

	echo Form::text('username');

#### テキスト入力要素にデフォルト値を指定する

	echo Form::text('email', 'example@gmail.com');

> **注目：** *hidden*と*textarea*メソッドは*text*メソッドと使い方は同じです。一つ覚えるだけで、３つ分学べます。

#### パスワード入力要素を生成する

	echo Form::password('password');

<a name="checkboxes-and-radio-buttons"></a>
## チェックボックスとラジオボタン

#### チェックボックス要素を生成する

	echo Form::checkbox('name', 'value');

#### チェック状態をデフォルトにして生成する

	echo Form::checkbox('name', 'value', true);

> **注目：** *radio*メソッドは*checkbox*と全く同じです。２つで１つ分です。

<a name="drop-down-lists"></a>
## ドロップダウンリスト

#### 配列の要素から、ドロップダウンリストを生成する

	echo Form::select('size', array('L' => 'Large', 'S' => 'Small'));

#### 一つのアイテムをデフォルトに指定し、ドロップダウンリストを生成する

	echo Form::select('size', array('L' => 'Large', 'S' => 'Small'), 'S');

<a name="buttons"></a>
## ボタン

#### Submitボタン要素を生成する

	echo Form::submit('Click Me!');

> **注目：** ボタン要素を生成する必要がある？ならば、*button*メソッドをお試しください。*submit*と使い方は同じです。

<a name="custom-macros"></a>
## カスタムマクロ

カスタムフォームクラスヘルパー、通称「マクロ」を簡単に定義できます。実例を見て下さい。最初に、マクロを名前と無名関数を指定して、登録します。

#### フォームマクロを登録する

	Form::macro('my_field', function()
	{
		return '<input type="awesome">';
	});

次に、名前でそのマクロを呼び出します。

#### カスタムマクロを呼び出す。

	echo Form::my_field();