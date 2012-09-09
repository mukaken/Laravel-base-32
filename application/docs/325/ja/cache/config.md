# キャッシュ設定

## 内容

- [基本](#the-basics)
- [データベース](#database)
- [Memcached](#memcached)
- [Redis](#redis)
- [キャッシュキー](#keys)
- [オンメモリキャッシュ](#memory)

<a name="the-basics"></a>
## 基本

あなたのアプリケーションでユーザーによって投票された、人気ソングトップ１０を表示していると想像してください。誰かがあなたのサイトを訪れるたびに１０曲を探すのは、ほんとうに必要ですか？１０分ごと、もしくは１時間ごとに保存し、それを表示するとしたら、ドラマティックなスピードアップが望めると思いませんか？Laravelのキャッシュはシンプルに実現します。

Lravelは５つのキャッシュドライバーを提供しています。

- ファイルシステム
- データベース
- Memcached
- APC
- Redis
- メモリー（配列）

Laravelはデフォルト設定で**ファイル**システムキャッシュドライバーを使用します。これは最初から、設定なしで利用できます。ファイルシステムドライバーは**cache**ディレクトリーの中にファイルとしてアイテムを保存します。もし、このドライバーに満足したならば、他の設定は必要ないでしょう。もう、使用を開始する準備が済んでいます。

> ファイルシステムキャッシュドライバーを使用する前に、**storage/cache**ディレクトリーが書き込めるようにしてください。

<a name="database"></a>
## データベース

データベースキャッシュドライバーはデータベーステーブルをシンプルなキー／値の保存場所として使用します。使い始めるには、最初に**application/config/cache.php**の中にデータベーステーブルの名前を設定してください。

	'database' => array('table' => 'laravel_cache'),

次にデータベーステーブルを作成します。テーブルに次の３カラムを作成してください。

- key (varchar)
- value (text)
- expiration (integer)

これだけです！一度設定を行い、テーブルを用意したら、キャッシュを使う準備ができました。

<a name="memcached"></a>
## Memcached

[Memcached](http://memcached.org)はウィキペディアやフェイスブックのようなサイトで使用されている究極な速さの、メモリーオブジェクトキャッシュシステムであり、オープンソースで配布されています。LaravelのMemcachedドライバーを使用し始める前に、Memcachedをインストール、設定します。それとPHP Memcache拡張をサーバーに入れておく必要があります。

一度、Memcachedがインストールされたら、**application/config/cache.php**ファイルの**driver**を設定してください。

	'driver' => 'memcached'

それから、**servers**にMemcachedサーバーを付け加えます。

	'servers' => array(
	     array('host' => '127.0.0.1', 'port' => 11211, 'weight' => 100),
	)

<a name="redis"></a>
## Redis

[Redis](http://redis.io)はオープンソースの、進化したキー／値のデータストアです。Redisはキーに[文字列](http://redis.shibu.jp/commandreference/strings.html)、[ハッシュ](http://redis.shibu.jp/commandreference/hashes.html)、[リスト](http://redis.shibu.jp/commandreference/lists.html), [セット](http://redis.shibu.jp/commandreference/sets.html)、[ソート済みセット](http://redis.shibu.jp/commandreference/sortedsets.html)で構成できるため、データー構造サーバーとして多く参照されます。

Redisキャッシュドライバーを使用する前に、[Redisサーバーの設定](/docs/database/redis#config)を行なってください。そうしたら、**application/config/cache.php**の中の**driver**を設定します。

	'driver' => 'redis'

<a name="keys"></a>
### キャッシュキー

APCやRedis、Memcachedサーバーを使用している他のアプリケーションとの間に名前の衝突が起きるのを防ぐため、Laravleはこれらのドライバーを使っているキャッシュの中で、各アイテムに**key**を付加しています。自由にこの値を変更してください。

	'key' => 'laravel'

<a name="memory"></a>
### オンメモリキャッシュ

「メモリー」キャッシュドライバーはディスクに何もキャッシュしません。現在のリクエストに対して、キャッシュデーターをただの内部配列として管理します。これは、他のストレージメカニズムから独立して、アプリケーションをテストするためにピッタリです。決して、「本当」のキャッシュドライバーとしては使用しないでください。