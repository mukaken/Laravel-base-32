# HTMLの作成

## 内容

- [HTMLエンティティ](#entities)
- [スクリプトとスタイルシート](#scripts-and-style-sheets)
- [リンク](#links)
- [名前付きルートへのリンク](#links-to-named-routes)
- [コントローラーアクションへのリンク](#links-to-controller-actions)
- [Mailtoリンク](#mail-to-links)
- [画像](#images)
- [リスト](#lists)
- [カスタムマクロ](#custom-macros)

<a name="entities"></a>
## HTMLエンティティ

ユーザーのインプットをビューに表示するときには、HTML中の重要なすべての文字をHTMLエンティティ表現に変換することは重要です。

例えば、<シンボルは必ずエンティティ表現に変換します。HTMLキャラクターをエンティティ表現にコンバートすることは、クロスサイトスクリプティングより、あなたのアプリケーションを守る手助けになります。

#### 文字列をHTMLエンティティ表現にコンバートする

	echo HTML::entities('<script>alert('hi');</script>');

#### グローバルヘルパーの"e"を使う

	echo e('<script>alert('hi');</script>');

<a name="scripts-and-style-sheets"></a>
## スクリプトとスタイルシート

#### Javascriptファイルへの参照を生成する

	echo HTML::script('js/scrollTo.js');

#### CSSファイルへの参照を生成する

	echo HTML::style('css/common.css');

#### メディアタイプを指定し、CSSファイルへの参照を生成する

	echo HTML::style('css/common.css', 'print');

*参照：*

- *[アセットの管理](/docs/views/assets)*

<a name="links"></a>
## リンク

#### URIからリンクを生成する

	echo HTML::link('user/profile', 'User Profile');

#### HTTPSを使用し、リンクを生成する

	echo HTML::secure_link('user/profile', 'User Profile');

#### 追加のHTML属性を指定し、リンクを生成する

	echo HTML::link('user/profile', 'User Profile', array('id' => 'profile_link'));

<a name="links-to-named-routes"></a>
## 名前付きルートへのリンク

#### 名前付きルートへリンクを生成する

	echo HTML::link_to_route('profile');

#### ワイルドカード値と共に、名前付きルートへリンクを生成する

	$url = HTML::link_to_route('profile', array($username));

*参照：*

- *[名前付きルート](/docs/routing#named-routes)*

<a name="links-to-controller-actions"></a>
## コントローラーアクションへのリンク

#### コントローラーアクションへリンクを生成する

	echo HTML::link_to_action('home@index');

### ワイルドカード値と共に、コントローラーアクションへリンクを生成する

	echo HTML::link_to_action('user@profile', 'User Profile', array($username));

<a name="mail-to-links"></a>
## Mailtoリンク

ボットをあしらうために、HTMLクラスの"mailto"メソッドは与えられたメールアドレスを分かりづらくします。

#### Mailtoリンクを生成する

	echo HTML::mailto('example@gmail.com', 'E-Mail Me!');

#### メールアドレスをリンクテキストとして生成する

	echo HTML::mailto('example@gmail.com');

<a name="images"></a>
## 画像

#### HTMLイメージタグを生成する

	echo HTML::image('img/smile.jpg', $alt_text);

#### 追加のHTML属性と共に、HTMLイメージタグを生成する

	echo HTML::image('img/smile.jpg', $alt_text, array('id' => 'smile'));

<a name="lists"></a>
## リスト

#### 配列のアイテムからリストを生成する

	echo HTML::ol(array('Get Peanut Butter', 'Get Chocolate', 'Feast'));

	echo HTML::ul(array('Ubuntu', 'Snow Leopard', 'Windows'));

<a name="custom-macros"></a>
## カスタムマクロ

HTMLクラスヘルパー、"macros"を使い、簡単に自分自身のカスタムマクロを定義できます。実例をどうぞ。最初に名前と無名関数でマクロを登録します。

#### HTMLマクロを登録する

	HTML::macro('my_element', function()
	{
		return '<article type="awesome">';
	});

次に、名前でマクロを呼び出します。

#### カスタムHTMLマクロを呼び出す

	echo HTML::my_element();
