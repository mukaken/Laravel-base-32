# リクエストの確認

## 内容

- [URI操作](#working-with-the-uri)
- [他のリクエストヘルパー](#other-request-helpers)

<a name="working-with-the-uri"></a>
## URI操作

#### リクエストの現在のURIを取得

	echo URI::current();

#### URIの特定のセグメントを取得

	echo URI::segment(1);

#### セグメントが存在しない場合、デフォルト値を返す

	echo URI::segment(10, 'Foo');

#### クエリ文字列も含んだ、完全なURIを取得

	echo URI::full();

時々、URIが与えられた文字列であるか、もしくは文字列で始まっているかを調べる必要が有ることでしょう。このために、is()メソッドをどうやって使用するかのサンプルです。

#### URIが"home"であるか確かめる

	if (URI::is('home'))
	{
		// 現在のURIは"home"だ！
	}

#### 現在のURIが"docs/"で始まっているか確かめる

	if URI::is('docs/*'))
	{
		// 現在のURIは"docs/"で始まっている！
	}

<a name="other-request-helpers"></a>
## 他のリクエストヘルパー

#### 現在のリクエストのメソッドを得る

	echo Request::method();

#### $_SERVERグローバル配列にアクセスする

	echo Request::server('http_referer');

#### リクエスト場所のIPアドレスを取得する

	echo Request::ip();

#### 現在のリクエストがHTTPSを使っているか確かめる

	if (Request::secure())
	{
		// このリクエストはHTTPSで送られてきた！
	}

#### 現在のリクエストがAJAXリクエストであるかチェックする

	if (Request::ajax())
	{
		// このリクエストはAJAXを使用している！
	}

#### 現在のリクエストがartisan CLIを通しているか確かめる

	if (Request::cli())
	{
		// このリクエストは、CLIからだ！
	}