# URLの生成

## 内容

- [基本](#the-basics)
- [ルートへのURL](#urls-to-routes)
- [コントローラーアクションへのURL](#urls-to-controller-actions)
- [アセットへのURL](#urls-to-assets)
- [URLヘルパー](#url-helpers)

<a name="the-basics"></a>
## 基本

#### アプリケーションのベースURLを取得

	$url = URL::base();

#### ベースURLからの相対アドレスより生成

	$url = URL::to('user/profile');

#### HTTPS URLを生成

	$url = URL::to_secure('user/login');

#### 現在のURLを取得

	$url = URL::current();

#### クエリー文字列も含めた現在のRULを取得

	$url = URL::full();

<a name="urls-to-routes"></a>
## ルートへのURL

#### 名前付きルートへのURLを生成

	$url = URL::to_route('profile');

時々、名前付きルートへのURLを生成する場合に、URIのワイルドカードを指定した値で置き換えたいことがあると思います。ワイルドカードを実際の値に置き換えるのは、簡単です。

#### ワイルドカード値と共に、名前付きルートを生成する

	$url = URL::to_route('profile', array($username));

*参照：*

- [名前付きルート](/docs/routing#named-routes)

<a name="urls-to-controller-actions"></a>
## コントローラーアクションへのURL

#### コントローラーアクションへのURLを生成

	$url = URL::to_action('user@profile');

#### ワイルドカード値と共に、アクションへのURLを生成

	$url = URL::to_action('user@profile', array($username));

<a name="urls-to-assets"></a>
## アセットへのURL

アセットへのURLには、"application.index"設定オプションの値は含まれません。

#### アセットへのURLを生成

	$url = URL::to_asset('js/jquery.js');

<a name="url-helpers"></a>
## URLヘルパー

あなたの人生を楽にし、コードをクリーンにするように設計されたURL生成のためのグローバルfunctionがあります。

#### ベースURLからの相対アドレスより生成

	$url = url('user/profile');

#### アセットへのURLを生成

	$url = asset('js/jquery.js');

#### 名前付きルートへのURLを生成

	$url = route('profile');

#### ワイルドカード値と共に、名前付きルートを生成する

	$url = route('profile', array($username));

#### コントローラーアクションへのURLを生成

	$url = action('user@profile');

#### ワイルドカード値と共に、アクションへのURLを生成

	$url = action('user@profile', array($username));