# Redis

## 内容

- [基本](#the-basics)
- [設定](#config)
- [使用法](#usage)

<a name="the-basics"></a>
## 基本

[Redis](http://redis.io)はオープンソースの、進化したキー／値のデータストアです。Redisはキーに[文字列](http://redis.shibu.jp/commandreference/strings.html)、[ハッシュ](http://redis.shibu.jp/commandreference/hashes.html)、[リスト](http://redis.shibu.jp/commandreference/lists.html), [セット](http://redis.shibu.jp/commandreference/sets.html)、[ソート済みセット](http://redis.shibu.jp/commandreference/sortedsets.html)で構成できるため、データー構造サーバーとして多く参照されます。

<a name="config"></a>
## 設定

アプリケーションのRedis設定は**application/config/database.php**ファイルの中です。このファイルの**redis**配列はRedisサーバーの設定で構成されています。

	'redis' => array(

		'default' => array('host' => '127.0.0.1', 'port' => 6379),

	),

デフォルトの設定で開発には充分でしょう。しかし、環境に合わせてこの配列を自由に変更してくだし。シンプルに、Redisサーバーの名前と、ホスト、ポート番号を指定します。

<a name="usage"></a>
## 使用法

**Reids**クラスの**db**メソッドを呼び出し、Redisインスタンスを取得します。

	$redis = Redis::db();

これで**デフォルト**のRedisサーバーのインスタンスが得られます。Redis設定で定義したサーバーを指定するために**db**メソッドに名前を渡すこともできます。

	$redis = Redis::db('redis_2');

素晴らしい！これでRedisインスタンスが入手できました。このインスタンスでどんな[Redisコマンド](http://redis.io/commands)も発行できます。Laravelでは、Redisサーバーにコマンドを渡すために、マジックメソッドを使用しています。

	$redis->set('name', 'Taylor');

	$name = $redis->get('name');

	$values = $redis->lrange('names', 5, 10);

Notice the arguments to the command are simply passed into the magic method. もちろん、マジックメソッドを使用しなければならないわけでなく、サーバーにコマンドを渡すのには**run**メソッドも使用できます。

	$values = $redis->run('lrange', array(5, 10));

デフォルトRedisサーバーでコマンドを実行したいだけですか？Radisクラスの静的マジックメソッドが使用できます。

	Redis::set('name', 'Taylor');

	$name = Redis::get('name');

	$values = Redis::lrange('names', 5, 10);

> **注目：**Redisを使用する[キャッシュ](/docs/cache/config#redis)と[セッション](docs/session/config#redis)のドライバーはLaravelに含まれています。