s+\[Redis\](http:\/\/redis\.io) is an open source, advanced key-value store\. +[Redis](http://redis.io)はオープンソースの、進化したキー／値のデータストアです。+

s+It is often referred to as a data structure server since keys can contain \[strings\](http:\/\/redis\.io\/topics\/data-types#strings), \[hashes\](http:\/\/redis\.io\/topics\/data-types#hashes), \[lists\](http:\/\/redis\.io\/topics\/data-types#lists), \[sets\](http:\/\/redis\.io\/topics\/data-types#sets), and \[sorted sets\](http:\/\/redis\.io\/topics\/data-types#sorted-sets)\.+Redisはキーに[文字列](http://redis.shibu.jp/commandreference/strings.html)、[ハッシュ](http://redis.shibu.jp/commandreference/hashes.html)、[リスト](http://redis.shibu.jp/commandreference/lists.html), [セット](http://redis.shibu.jp/commandreference/sets.html)、[ソート済みセット](http://redis.shibu.jp/commandreference/sortedsets.html)で構成できるため、データー構造サーバーとして多く参照されます。+



s+The Redis configuration for your application lives in the \*\*application\/config\/database\.php\*\* file\. +アプリケーションのRedis設定は**application/config/database.php**ファイルの中です。+

s+Within this file, you will see a \*\*redis\*\* array containing the Redis servers used by your application:+このファイルの**redis**配列はRedisサーバーの設定で構成されています。+


s+The default server configuration should suffice for development\. +デフォルトの設定で開発には充分でしょう。+

s+However, you are free to modify this array based on your environment\. +しかし、環境に合わせてこの配列を自由に変更してくだし。+

s+Simply give each Redis server a name, and specify the host and port used by the server\.+シンプルに、Redisサーバーの名前と、ホスト、ポート番号を指定します。+




s+You may get a Redis instance by calling the \*\*db\*\* method on the \*\*Redis\*\* class:+**Reids**クラスの**db**メソッドを呼び出し、Redisインスタンスを取得します。+


s+This will give you an instance of the \*\*default\*\* Redis server\. +これで**デフォルト**のRedisサーバーのインスタンスが得られます。+

s+You may pass the server name to the \*\*db\*\* method to get a specific server as defined in your Redis configuration:+Redis設定で定義したサーバーを指定するために**db**メソッドに名前を渡すこともできます。+


s+Great! +素晴らしい！+

s+Now that we have an instance of the Redis client, we may issue any of the \[Redis commands\](http:\/\/redis\.io\/commands) to the instance\. +これでRedisインスタンスが入手できました。このインスタンスでどんな[Redisコマンド](http://redis.io/commands)も発行できます。+

s+Laravel uses magic methods to pass the commands to the Redis server:+Laravelでは、Redisサーバーにコマンドを渡すために、マジックメソッドを使用しています。+


s+Notice the arguments to the comment are simply passed into the magic method\. +引数をコマンドにマジックメソッドで渡していることに注目してください。+

s+Of course, you are not required to use the magic methods, you may also pass commands to the server using the \*\*run\*\* method:+もちろん、マジックメソッドを使用しなければならないわけでなく、サーバーにコマンドを渡すのには**run**メソッドも使用できます。+


s+Just want to execute commands on the default Redis server? +デフォルトRedisサーバーでコマンドを実行したいだけですか？+

s+You can just use static magic methods on the Redis class:+Radisクラスの静的マジックメソッドが使用できます。+


s+\*\*Note:\*\* Redis \[cache\](\/docs\/cache\/config#redis) and \[session\](\/docs\/session\/config#redis) drivers are included with Laravel\.+**注目：**Redisを使用する[キャッシュ](/docs/cache/config#redis)と[セッション](docs/session/config#redis)のドライバーはLaravelに含まれています。+
