# バンドル

## 内容

- [基本](#the-basics)
- [バンドルを作成する](#creating-bundles)
- [バンドルを登録する](#registering-bundles)
- [バンドルとクラスのロード](#bundles-and-class-loading)
- [バンドルを始める](#starting-bundles)
- [バンドルへのルーティング](#routing-to-bundles)
- [バンドルを使用する](#using-bundles)
- [バンドルのアセット](#bundle-assets)
- [バンドルのインストール](#installing-bundles)
- [バンドルのアップグレード](#upgrading-bundles)

<a name="the-basics"></a>
## 基本

バンドルはLaravel3.0の改善点の中心になるものです。シンプルな方法で、コードを便利な「バンドル（束）」にグルーピングできるようになりました。バンドルは、それぞれ独自のビュー、設定、ルート、マイグレーション、タスクなどが持てます。バンドルでデータベースORMから強固な認証システムまで、何でも開発できます。このスコープのモジュール化は重要な一面で、Laravelにおける設計の決定全部を事実上行わせたものです。あなたはapplicationフォルダーを色々な捉え方をしているでしょうが、Laravelに置ける特別なデフォルトバンドルで一番最初にロードされ、使用される様にプログラムされていると考えることができます。

<a name="creating-and-registering"></a>
## バンドルを作成する

バンドル作成の最初のステップは、**bundles**ディレクトリーの中にフォルダーを作ることです。例えば、アプリケーションの管理者用バックエンドとして動作する、"admin"バンドルを作成してみましょう。**application/start.phpファイルはアプリケーションをどのように実行するかを決めるための基本的な設定を提供しています。同じ目的で、新しいバンドルフォルダーの中に**start.php**ファイルを作成できます。これは、バンドルがロードされるといつも実行されます。これを作成しましょう。

#### バンドルstart.phpファイルの作成

	<?php

	Autoloader::namespaces(array(
		'Admin' => Bundle::path('admin').'models',
	));

このstartファイル中では、オートローダーに対し、名前空間"Admin"のクラスはバンドルのmodelsディレクトリーからロードするように、指示しています。startファイルの中でなんでも好きな事ができますが、典型的な使用方法はクラスのオートロードを登録することです。しかし実際のところ、バンドルにstartファイルを作成しなければならない訳ではありません。

次に、アプリケーションにこのバンドルをどうやって登録するのかを見てみましょう。

<a name="registering-bundles"></a>
## バンドルを登録する

さあ、adminバンドルは出来ました。Laravleへ登録しなければなりません。**application/bundles.php**を開いてください。このファイルでアプリケーションに必要なバンドルを全て登録します。では、付け加えましょう。

#### シンプルなバンドルを登録する

	return array('admin'),

利便性のため、Laravelはルートレベルのbundleディレクトリーにあるadminバンドルを読み込もうとしますが、もしご希望なら他の場所を指定することもできます。

#### 場所を指定し、バンドルを登録する

	return array(

		'admin' => array('location' => 'userscape/admin'),

	);

これでLaravelは**bundles/userscape/admin**でバンドルを探します。

<a name="bundles-and-class-loading"></a>
## バンドルとクラスのロード

通常、バンドルのstart.phpファイルはオートローダーの登録のみ行います。ですから、**start.php**を飛ばして、バンドルのマッピングを登録配列でそのまま宣言できます。こうなります：

#### バンドル登録で、オートローダーの定義を行う

	return array(

		'admin' => array(
			'autoloads' => array(
				'map' => array(
					'Admin' => '(:bundle)/admin.php',
				),
				'namespaces' => array(
					'Admin' => '(:bundle)/lib',
				),
				'directories' => array(
					'(:bundle)/models',
				),
			),
		),

	);

それぞれのオプションが、Laravelの[オートローダー](/docs/loading)の機能に対応していることに注目してください。実際、オプションは対応するオートローダーの機能に自動的に渡されています。

多分、**(:bundle)**プレースホルダーに気が付かれたことでしょう。使いやすいように、これは自動的にバンドルへのパスへ置き換わります。簡単ですね。

<a name="starting-bundles"></a>
## バンドルを始める

さあ、これでバンドルを作成し、登録も済みました。しかしまだ使えません。最初にスタートする必要があります。

#### バンドルを開始する

	Bundle::start('admin');

これでLaravelに、クラスのオートローダーを登録しているだろう、バンドルの**start.php**ファイルを実行するように、指示します。startメソッドは、**routes.php**がバンドルに存在するならば、それも読みこむように指示します。

> バンドルは一度だけしか開始できません。続けてstartメソッドを呼び出しても、無視されます。

もし、アプリケーション全体でバンドルを使用したいのでしたら、リクエストのたびに開始したいでしょう。そんな場合は、**application/bundles.php**ファイルでバンドルを自動スタートするように設定しましょう。

#### バンドルを自動スタートするように設定する

	return array(

		'admin' => array('auto' => true),

	);

いつもバンドルを明白に開始する必要はありません。実際、通常はバンドルを自動開始するように設定してしておけば、Laravelは残りを上手く処理します。例えば、バンドルのビュー、設定、言語、ルートやフィルターを使用しようとすると、バンドルは自動的に開始されます。

バンドルが開始されると、毎回イベントが発生します。バンドルの開始をこんな風にして、リッスンできます：

#### バンドルの開始イベントをリッスンする

	Event::listen('laravel.started: admin', function()
	{
		// The "admin" bundle has started...
	});

更に、バンドルがスタートしないように、「不使用」にすることもできます。

#### バンドルを開始しないように、「不使用」にする

	Bundle::disable('admin');

<a name="routing-to-bundles"></a>
## バンドルへのルーティング

ルーティングとバンドルの情報に関しては、[バンドルルーティング」(/docs/routing#bundle-routes)と[バンドルコントローラー](/docs/controllers#bundle-controllers)のドキュメントを参照してください。

<a name="using-bundles"></a>
## バンドルを使用する

前に述べた通り、バンドルはビュー、設定、言語ファイルなどを持てます。Laravelでは、構文にダブルコロンを使い、それらのアイテムをロードします。いくつか例を見てみましょう。

#### バンドルのビューを読み込む

	return View::make('bundle::view');

#### バンドルの設定アイテムを読み込む

	return Config::get('bundle::file.option');

#### バンドルの言語ファイルを読み込む

	return Lang::line('bundle::file.line');

時々、存在しているかとか、場所とか、設定配列に含まれているかとか、バンドルの「メタ」情報を集めたい時もあることでしょう。こうなります：

#### バンドルが存在するか調べる

	Bundle::exists('admin');

#### バンドルがインストールされている場所を取得する

	$location = Bundle::path('admin');

#### バンドルの設定配列を取得する

	$config = Bundle::get('admin');

#### インストールされているすべてのバンドル名を取得する

	$names = Bundle::names();

<a name="bundle-assets"></a>
## バンドルのアセット

もしバンドルにビューが含まれているのでしたら、アプリケーションの**public**ディレクトリーにJavascriptや画像などのアセットを用意する必要があります。問題ありませんただ、バンドルの中に**public**フォルダーを作成し、そこに全部のアセットをおいてください。

素晴らしい！でも、どうやってアプリケーションの**public**フォルダーへ移せばいいのでしょう。Laravelの"artisan"コマンドラインは、全てのバンドルのアセットをpublicディレクトリーへコピーする、シンプルなコマンドを提供しています。ご覧ください。

#### publicディレクトリーでバンドルのアセットを公開する

	php artisan bundle:publish

このコマンドは、バンドルのアセットのためにapplication下の**public/bundles**ディレクトリーの中にフォルダーを作成します。例えば、あなたのバンドルの名前が"admin"でしたら、**public/bundles/admin**フォルダーが作成され、あなたのバンドルのpublicフォルダー内にある全てのファイルがコピーされます。

publicディレクトリーに入れたバンドル焦ってへのパスを便利に取得する情報は、[アセット管理](/docs/views/assets#bundle-assets)のドキュメントを参照してください。

<a name="installing-bundles"></a>
## バンドルのインストール

もちろんいつでもバンドルを手動でインストールできますが、"artisan" CLIはバンドルをインストール／アップグレードする素晴らしい方法を提供しています。フレームワークでは、インストールするバンドルをシンプルにZip解凍して使用します。実例をご覧ください：

#### artisanでバンドルをインストールする

	php artisan bundle:install eloquent

素晴らしい！これでバンドルがインストールされました。これを[登録](#registering-bundles)し、[アセットを公開](#bundle-assts)する準備ができました。

利用できるバンドルのリストが必要ですか？Laravelの[バンドルディレクトリー](http://bundles.laravel.com)をチェックしてください。

<a name="upgrading-bundles"></a>
## バンドルのアップグレード

バンドルをアップグレードすれば、Laravelは自動的に古いバンドルを削除し、新しくコピーします。

#### artisanでバンドルをアップグレードする

	php artisan bundle:upgrade eloquent

> **注目：**バンドルをアップグレードしたあとは、[アセットを再公開](#bundle-assets)してください。

**重要：**バンドルはアップグレード時に完全に削除されますので、バンドルのコアに加えた変更を認識しておく必要があります。バンドルの設定オプションを変更する必要もあることでしょう。バンドルのコードを直接変更する代わりに、バンドルのstartイベントで設定することができます。次のようなコードを**application/start.php**ファイルに書いてください。

#### バンドルのstartイベントをリッスンする

	Event::listen('laravel.started: admin', function()
	{
		Config::set('admin::file.option', true);
	});