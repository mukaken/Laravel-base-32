# IoCコンテナ

- [定義](/docs/ioc#definition)
- [オブジェクトの登録](/docs/ioc#register)
- [オブジェクトの解決](/docs/ioc#resolve)

<a name="definition"></a>
## 定義

IoCコンテナはオブジェクトの生成を管理するシンプルな方法です。複雑なオブジェクトの生成を定義しておき、プロジェクト全体のどこからでも、一行のコードで生成することができます。更に、依存性の「注入」をクラスやコントローラーに導入することもできます。

IoCコンテナはあなたのアプリケーションを柔軟でテストしやすくするのに役立ちます。コンテナでインターフェイスの実装の別バージョンを登録できますから、[スタブとモック](http://martinfowler.com/articles/mocksArentStubs.html)を使い、外部の依存からコードのテストを独立させることができます。

<a name="register"></a>
## オブジェクトの登録

#### IoCコンテナで、リゾルバを登録する

	IoC::register('mailer', function()
	{
		$transport = Swift_MailTransport::newInstance();

		return Swift_Mailer::newInstance($transport);
	});


素晴らしい！これでコンテナにSwiftMailerのリゾルバを登録できました。しかし、必要になるたびに毎回メイラーのインスタンスをコンテナに生成させたくないですよね？多分、最初に生成したインスタンスと同じインスタンスがコンテナから返される方が良いですよね。その場合、ただコンテナに、そのオブジェクトはシングルトンであると伝えてください。

#### コンテナにシングルトンを登録する

	IoC::singleton('mailer', function()
	{
		//
	});

既に存在しているインスタンスをコンテナにシングルトンとして登録することもできます。

#### 存在しているインスタンスをコンテナに登録する

	IoC::instance('mailer', $instance);

<a name="resolve"></a>
## オブジェクトの解決

これでSwiftMailerはコンテナに登録されました。**IoC**クラスの**resolve**メソッドを使うことで、解決することができます。

	$mailer = IoC::resolve('mailer');

> **注目：**[コンテナにコントローラーを登録する](/docs/controllers#dependency-injection)こともできます。