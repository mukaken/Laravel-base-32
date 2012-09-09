<a name="config"></a>
# セッション設定

## 内容

- [基本](#the-basics)
- [クッキーセッション](#cookie)
- [ファイルシステムセッション](#file)
- [データベースセッション](#database)
- [Memcacheセッション](#memcached)
- [Redisセッション](#redis)
- [オンメモリセッション](#memory)

<a name="the-basics"></a>
## 基本

Webはステートレスな環境です。つまり、アプリケーションに対する毎回のリクエストは、前回のリクエストと関係が無いことを意味しています。しかし、**セッション**は任意のデーターをあなたのアプリケーションの各訪問者毎に任意のデータを保持してくれます。それぞれの訪問者に対するセッションデーターはWebサーバーに保存され、同時に**セッションID**が訪問者のコンピューターのクッキーに保存されます。クッキーはそのユーザーのセッションをアプリケーションに「思い出させ」、その後に続くリクエストでセッションを取得させてくれる役目をします。

> **注目：**セッションを使い始める前に、**application/config/application.php**ファイルのアプリケーションキーを指定してください。

６つのセッションドライバーが用意されています。

- クッキー
- ファイルシステム
- データベース
- Memcached
- Redis
- メモリー（配列）

<a name="cookie"></a>
## クッキーセッション

クッキーベースのセッションはライトウェイトで早いセッション情報の保持メカニズムです。しかも、セキュアです。それぞれのクッキーは、強力なAES-256を使用して暗号化されます。しかしながら、クッキーは４Kbの容量しか無いため、より多くの情報をセッションに保存したい場合、他のドライバーを使ってください。

クッキーセッションを使い始める場合は、**application/config/session.php**ファイルのdriverオプションをセットするだけです。

	'driver' => 'cookie'

<a name="file"></a>
## ファイルシステムセッション

ほとんどの場合、ファイルシステムセッションはあなたのアプリケーションで上手く機能するでしょう。しかしながら、非常に多くのトラフィックを扱うか、サーバーの形態で運用する場合は、データベースか、Memchachセッションを使ってください。

ファイルシステムセッションを使い始める場合は、**application/config/session.php**ファイルのdriverオプションをセットするだけで済みます。

	'driver' => 'file'

これだけです。準備完了です！

> **注目：**ファイルシステムは**strage/sessions**ディレクトリーに保存されます。ですから、書き込み可能に設定してください。

<a name="database"></a>
## データベースセッション

データベースセッションを使い始める前、最初に[データベース接続の設定](/docs/database/config)が必要です。

次にセッションテーブルを作成する必要があります。以降に、参考になるようにSQL文を紹介します。しかしながら、Laravelの"Artisan"コマンドラインでテーブルの生成もできます！

### Artisan

	php artisan session:table

### SQLite

	CREATE TABLE "sessions" (
	     "id" VARCHAR PRIMARY KEY NOT NULL UNIQUE,
	     "last_activity" INTEGER NOT NULL,
	     "data" TEXT NOT NULL
	);

### MySQL

	CREATE TABLE `sessions` (
	     `id` VARCHAR(40) NOT NULL,
	     `last_activity` INT(10) NOT NULL,
	     `data` TEXT NOT NULL,
	     PRIMARY KEY (`id`)
	);

もし別のテーブル名を使用したいのでしたら、**application/config/session.php**ファイルの**table**オプションを変更してください。

	'table' => 'sessions'

後、行うべきなのは**application/config/session.php**でドライバーの設定です。

	'driver' => 'database'

<a name="memcached"></a>
## Memcacheセッション

Memcacheセッションを使い始める前に、[Memcacheサーバーの設定](/docs/cache/config#memchached)を行なってください。

後は、**applicaton/config/session.php**ファイルでドライバーを設定します。

	'driver' => 'memcached'

<a name="redis"></a>
## Redisセッション

Redisセッションを使い始める前に、[Redisサーバーの設定](/docs/database/redis#config)を行なってください。

後は、**applicaton/config/session.php**ファイルでドライバーを設定します。

	'driver' => 'redis'

<a name="memory"></a>
## オンメモリセッション

"memory"セッションドライバーは現在のリクエストのため、ただ配列に保存するだけです。このドライバーはディスクに何も書き込みませんから、アプリケーションのユニットテストにピッタリです。これは「本当」のセッションドライバーではありません。