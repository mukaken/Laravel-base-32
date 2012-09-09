# バリデーション

## 内容

- [基本](#the-basics)
- [バリデーションルール](#validation-rules)
- [エラーメッセージの取得](#retrieving-error-messages)
- [バリデーション実例](#validation-walkthrough)
- [カスタムエラーメッセージ](#custom-error-messages)
- [カスタムバリデーションルール](#custom-validation-rules)

<a name="the-basics"></a>
## 基本

ほとんどのインタラクティブなWebアプリケーションは、データーのバリデーションが必要です。例えば、登録フォームでは、パスワードの再確認が必要でしょう。多分、メールアドレスは重複していてはいけません。データーのバリデーションは堅苦しいプロセスです。ありがたいことに、Laravelでは、そうではありません。Validatorクラスはデーターのバリデーションを簡単にしてくれる素晴らしいヘルパーを用意してくれています。 一例を見てみましょう。

#### バリデーションしたいデーターを配列で獲得

	$input = Input::all();

#### データーに対するバリデーションルールを定義

	$rules = array(
		'name'  => 'required|max:50',
		'email' => 'required|email|unique:users',
	);

#### Validatorインスタンスを作成し、実行する

	$validation = Validator::make($input, $rules);

	if ($validation->fails())
	{
		return $validation->errors;
	}

*errors*プロパティは、エラーメッセージの取り扱いを簡単にしてくれる、シンプルなmessage collectorクラスです。もちろん、デフォルトのエラーメッセージは全てのバリデーションルールに用意してあります。デフォルトのメッセージは**language/en/validation.php**にあります。

これで、基本的なValidatorクラスの使い方に慣れました。データーをバリデーションするのに使用するルールについて、掘り下げて学ぶ用意ができました。

<a name="validation-rules"></a>
## バリデーションルール

- [必須項目](#rule-required)
- [文字種指定](#rule-alpha)
- [サイズ](#rule-size)
- [数字項目](#rule-numeric)
- [内包と除外](#rule-in)
- [確認項目](#rule-confirmation)
- [受け入れの確認](#rule-acceptance)
- [他項目との比較](#same-and-different)
- [正規表現](#regex-match)
- [一意と存在](#rule-unique)
- [日付](#dates)
- [メールアドレス](#rule-email)
- [URL](#rule-url)
- [アップロードファイル](#rule-uploads)

<a name="rule-required"></a>
### 必須項目

#### 存在し、空文字列ではないことをバリデートする属性です。

	'name' => 'required'

#### あるフィールドが入力済みの場合、同時に入力されていることをバリデートする属性です。
	'last_name' => 'required_with:first_name'

<a name="rule-alpha"></a>
### 文字種指定

#### 英文字だけで構成されていることをバリデートする属性です。

	'name' => 'alpha'

#### 英文字と数字だけで構成されていることをバリデートする属性です。

	'username' => 'alpha_num'

#### 英数字とダッシュ、下線で構成されていることをバリデートする属性です。

	'username' => 'alpha_dash'

<a name="rule-size"></a>
### サイズ

#### 与えられた文字数であること、もしくは数字項目の場合はその値であることをバリデートする属性です。

	'name' => 'size:10'

#### サイズが与えられた範囲内であることをバリデートする属性です。

	'payment' => 'between:10,50'

> **注目：**最低値と最高値も含まれます。

#### 与えられたサイズ以上であることをバリデートする属性です。

	'payment' => 'min:10'

#### 与えられたサイズ以下であることをバリデートする属性です。

	'payment' => 'max:50'

<a name="rule-numeric"></a>
### 数字項目

#### 数字であることをバリデートする属性です。

	'payment' => 'numeric'

#### 整数であることをバリデートする属性です。

	'payment' => 'integer'

<a name="rule-in"></a>
### 内包と除外

#### リストの値の中にあることをバリデートする属性です。

	'size' => 'in:small,medium,large'

#### リストの値の中に無いことをバリデートする属性です。

	'language' => 'not_in:cobol,assembler'

<a name="rule-confirmation"></a>
### 確認項目

*confirmed*ルールは*attribute_confirmation*項目が存在し、その値と一致していることをバリデートする属性です。

#### 確認項目と一致していることをバリデート

	'password' => 'confirmed'

この例でValidatorは、*password*項目が、配列の中の*password_confirmation*項目と一致していることを、確認します。

<a name="rule-acceptance"></a>
### 受け入れの確認

*accepted*ルールは項目が*yes*か*1*であることをバリデートします。このルールは「サービスの規約」のようなフォームのチェックボックスのバリデーションに役立ちます。

#### その項目が受け入れられたかバリデートする

	'terms' => 'accepted'

<a name="same-and-different"></a>
## 他項目との比較

#### 項目値が、他のフィールドの値と同じ事をバリデートする

	'token1' => 'same:token2'

#### ２つの項目の値が異なることをバリデートする

	'password' => 'different:old_password',

<a name="regex-match"></a>
### 正規表現

*match*ルールは与えられた正規表現と一致することをバリデートします。

#### 正規表現と一致することをバリデートする

	'username' => 'match:/[a-z]+/';

<a name="rule-unique"></a>
### 一意と存在

#### 値が与えられたデータベーステーブルで一意であることをバリデートする

	'email' => 'unique:users'

上記の例では、*email*項目は*users*テーブルで、ユニークであるかチェックされます。その項目名とカラム名が異なっている時にもユニークであることを確かめたいのですか？問題ありません。

#### uniqueルールでカスタムカラム名を指定する

	'email' => 'unique:users,email_address'

レコードを更新する場合、通常はuniqueルールを使用しても、更新するそのレコードに対しては適用を除外したいことはよくあります。例えば、ユーザープロフィールの更新では、メールアドレスの変更は許可されていることでしょう。しかし、*unique*ルールが効いていると、そのユーザーがメールアドレスを変更しなかった場合、*unique*ルールは失敗してしまいます。そのため、更新するユーザーに対しては、このルール適用を飛ばす必要があります。

#### IDを指定し、uniqueルールを無視するよう強制する

	'email' => 'unique:users,email_address,10'

#### データベーステーブルに項目の値が存在していることをバリデートする

	'state' => 'exists:states'

#### existsルールにカスタムカラム名を指定する

	'state' => 'exists:states,abbreviation'

<a name="dates"></a>
### 日付

#### 指定日付以前であることをバリデートする

	'birthdate' => 'before:1986-28-05';

#### 指定日付以降であることをバリデートする

	'birthdate' => 'after:1986-28-05';

> **注目：** **before**と**after**バリデーションルールは日付の解析に、PHPの関数である**strtotime**を利用しています。

<a name="rule-email"></a>
### メールアドレス

#### メールアドレスとして正しいかバリデートする

	'address' => 'email'

> **注目：**このルールはPHP組み込み関数の*filter_var*メソッドを使用しています。

<a name="rule-url"></a>
### URL

#### 有効なURLであるかバリデートする

	'link' => 'url'

#### アクティブなURLであるかバリデートする

	'link' => 'active_url'

> **注目：** *active_url*ルールはURLがアクティブであるか判断するために*checkdnsr*を使用しています。

<a name="rule-uploads"></a>
### アップロードファイル

*mimes*ルールはアップロードファイルが指定されたMIMEタイプであるかバリデートします。このルールは、そのファイルの内容を読み、実際のMIMEタイプを決めるために、PHP Fileinfo拡張を使用しています。*config/mimes.php*の中で定義されている拡張子で、引数で指定されたものは、このルールを通されます

#### 指定されたタイプの一つであることをバリデートする

	'picture' => 'mimes:jpg,gif'

> **注目：**ファイルをバリデートする時は、Input::file()か入力::all()を入力項目収集に使用してください。

#### ファイルが画像であることをバリデートする

	'picture' => 'image'

#### ファイルが指定キロバイトより小さいことをバリデートする

	'picture' => 'image|max:100'

<a name="retrieving-error-messages"></a>
## エラーメッセージの取得

Laravelでは、シンプルなエラー収集クラスを使用し、手軽にエラーメッセージを取り扱えるようになっていますValidatorのインスタンで*passes*か*fails*メソッドを呼び出した後に、*errors*プロパティーを利用してアクセスできます。メッセージを取得するためにいくつかの関数が用意されています。

#### 一項目にエラーメッセージがあるか確かめる

	if ($validation->errors->has('email'))
	{
		// e-mail項目にエラーがある……
	}

#### その項目の最初のエラーメッセージを取得する

	echo $validation->errors->first('email');

時には、HTML要素でラップしたエラーメッセージが必要なこともあるでしょう。大丈夫です。２番目の引数に、:messageプレースホルダーを使い、フォーマットを指定してください。

#### エラーメッセージをフォーマットする

	echo $validation->errors->first('email', '<p>:message</p>');

#### 指定された項目の、すべてのエラーメッセージを取得

	$messages = $validation->errors->get('email');

#### 指定された項目の、すべてのエラーメッセージをフォーマット

	$messages = $validation->errors->get('email', '<p>:message</p>');

#### 全ての項目の、全てのエラーメッセージを取得

	$messages = $validation->errors->all();

#### 全ての項目の、全てのエラーメッセージをフォーマット

	$messages = $validation->errors->all('<p>:message</p>');

<a name="validation-walkthrough"></a>
## バリデーション実例

一度バリデーションを実行すれば、簡単にビューにそれを表示できます。Laravelでは、驚異的なシンプルさで行えます。典型的なシナリオに沿って、行なってみましょう。２つのルートを定義します。

	Route::get('register', function()
	{
		return View::make('user.register');
	});

	Route::post('register', function()
	{
		$rules = array(...);

		$validation = Validator::make(Input::all(), $rules);

		if ($validation->fails())
		{
			return Redirect::to('register')->with_errors($validation);
		}
	});

素晴らしいですね！２つのシンプルな登録のためのルートができました。一つはフォームを表示処理し、もうひとつはフォームの投稿を処理します。POSTルートでは、入力に対してバリデーションを行なっています。バリデーションが失敗した場合、表示に使えるようにバリデーションエラーをセッションに退避(flash)させ、登録フォームへリダイレクトします。

**しかし、GETルートでerrorsとビューを明確に結びつけていないことに注目してください。**それでも、エラー変数($errors)はビューで使用できます。賢明なことにLaravelは、errorsがセッションにあれば、あなたのため、ビューに渡してくれます。errorsがセッションに存在していなければ、からのメッセージコンテナがビューに渡されます。あなたはビューの中で、errors編集を通して、いつもメッセージコンテナが存在すると思っていられます。私たちは、あなたの人生を楽にすることが大好きです。

例えば、メールアドレスのバリデーションに失敗すれば、セッション変数の$errorsの中に'email'を見つけることができます。

	$errors->has('email')

Bladeを使い、ビューにエラーメッセージを条件付きで付け加えることもできます。

	{{ $errors->has('email') ? 'Invalid Email Address' : 'Condition is false. Can be left blank' }}

これは例えばTwitter Bootstrapのようなものを使用しているときに、条件付きでクラスを付け加えたい時に便利に使えます。
例えば、メールアドレスのバリデーションに失敗したら、Bootstrapの"error"クラスを*div class="control-group"*文に付け加えたいことでしょう。

	<div class="control-group {{ $errors->has('email') ? 'error' : '' }}">
	
バリーションが失敗したら、ビューには*error*クラスが付け加え表示されるでしょう。

	<div class="control-group error">
	


<a name="custom-error-messages"></a>
## カスタムエラーメッセージ

エラーメッセージをデフォルトから変更したいのですか？たぶん、項目名とルールを指定して、カスタムエラーメッセージを使いたい場合さえあるでしょう。どちらにしても、Validatorクラスが簡単に実現してくれます。

#### Validatorに渡すカスタムメッセージの配列を作成

	$messages = array(
		'required' => 'The :attribute field is required.',
	);

	$validation = Validator::make(Input::get(), $rules, $messages);

素晴らしいですね！これで、バリデーションのチェックしに失敗した時、いつでもカスタムメッセージが使用できます。けど、**:attribute**なんたらは、メッセージの中でどうなるんでしょう？あなたが楽になるように、Validatorクラスは、**attribute**プレースホルダーを実際の項目の名前に置き換えてくれます！項目名の下線も取り除いてくれます。

エラーメッセージを作成するときには、他にも**:other**、**:size**、**:min**、**:max**、**:values**プレースホルダーも使用できます。

#### 他のバリデーションプレースホルダー

	$messages = array(
		'same'    => 'The :attribute and :other must match.',
		'size'    => 'The :attribute must be exactly :size.',
		'between' => 'The :attribute must be between :min - :max.',
		'in'      => 'The :attribute must be one of the following types: :values',
	);

でも、カスタムメッセージが使えると言っても、email項目に対してしか指定できないのでしょうか？大丈夫です。**項目_ルール**のネーミングルールを使い、メッセージを指定して下さい。

#### 与えられた項目のカスタムメッセージを指定する

	$messages = array(
		'email_required' => 'We need to know your e-mail address!',
	);

上記の例のように、要求されたカスタムメッセージはemail項目に使用されますが、他のすべての項目にはデフォルトのメッセージが使用されます。

しかし、たくさんのカスタムエラーメッセージを使用するために、コードの中で指定すれば、扱いにくくめちゃくちゃになるでしょう。ですから、バリデーション言語ファイルの中の**custom**配列で、カスタムメッセージを指定して下さい。

#### バリデーション言語ファイルにカスタムエラーメッセージを追加する

	'custom' => array(
		'email_required' => 'We need to know your e-mail address!',
	)

<a name="custom-validation-rules"></a>
## カスタムバリデーションルール

Laravelは多くのパワフルなバリデーションルールを提供しています。しかし、結局自分用に作成する必要が起きるのは、よくあるでしょう。バリデーションルールを作成するには２つのシンプルな方法が用意されています。両方共素晴らしいので、プロジェクトにあった方をお使いください。

#### カスタムバリデーションルールを登録

	Validator::register('awesome', function($attribute, $value, $parameters)
	{
	    return $value == 'awesome';
	});

この例は、Validatorに新しいバリデーションルールを登録しています。ルールは３つの引数を取ります。最初はバリデーションを行う項目名です。２つ目はバリデーションを行う値で、３つ目はルールに指定されるパラメーターです。

あなたのカスタムバリデーションルールを使うには次のように呼び出します。

	$rules = array(
    	'username' => 'required|awesome',
	);

もちろん、新しいルールのエラーメッセージを定義する必要があります。これは、その場で直ぐに定義する方法と：

	$messages = array(
    	'awesome' => 'The attribute value must be awesome!',
	);

	$validator = Validator::make(Input::get(), $rules, $messages);

もしくは、**language/en/validation.php**の中にあなたのルールに対するエントリーを付け加える方法があります。

	'awesome' => 'The attribute value must be awesome!',

前に述べたように、カスタムルールに引数のリストを指定し、受け取ることができます：

	// ルール配列を作成する時……

	$rules = array(
	    'username' => 'required|awesome:yes',
	);

	// カスタムルールの中で……

	Validator::register('awesome', function($attribute, $value, $parameters)
	{
	    return $value == $parameters[0];
	});

この場合、バリデーションルールの引数は、要素が"yes"だけの配列を受け取ります。

バリデーションルールを作成し保存する、もうひとつの方法はValidatorクラス自身を拡張することです。拡張して新しいバージョンのValidatorを作成すれば、既に存在する機能を全部使用しつつ、あなたのカスタム機能を追加できます。もし望むのでしたら、デフォルトのメソッドを置き換えることもできます。例を見ていきましょう。

最初に、**Laravel\Validator**を拡張し、**application/libraries**に設置します。

#### カスタムValidatorクラスを定義

	<?php

	class Validator extends Laravel\Validator {}

次に、**config/application.php**からValidatorの別名(alias)を削除します。これは必要です。そうしないと２つの"Validator"という名前がコンフリクトを起こしてしまいます。

次に、"awesome"ルールを新しいクラスに付け加えます。

#### カスタムバリデーションルールを付け加える

	<?php

	class Validator extends Laravel\Validator {

	    public function validate_awesome($attribute, $value, $parameters)
	    {
	        return $value == 'awesome';
	    }

	}

メソッドの名前に、**validate\_ルール**命名規則を使っていることに注目してください。"awesome"という名前のルールのメソッドは、"validate\_awesome"にしなくてはなりません。これがカスタムルールを登録する時と、Validatorクラスを拡張する時の、違いの一つです。Validatorクラスはシンプルにtrueかfalseをリターンします。これでおしまいです！

自分で作ったバリデーションルールのカスタムメッセージを作成する必要があることも、心に留めておいてください。そうしてもらえるのでしたら、どんなルールを定義してもらってもかまいません！