s+Imagine your application displays the ten most popular songs as voted on by your users\. +あなたのアプリケーションでユーザーによって投票された、人気ソングトップ１０を表示していると想像してください。+

s+Do you really need to look up these ten songs every time someone visits your site? +誰かがあなたのサイトを訪れるたびに１０曲を探すのは、ほんとうに必要ですか？+

s+What if you could store them for 10 minutes, or even an hour, allowing you to dramatically speed up your application? +１０分ごと、もしくは１時間ごとに保存し、それを表示するとしたら、ドラマティックなスピードアップが望めると思いませんか？+

s+Laravel's caching makes it simple\.+Laravelのキャッシュはシンプルに実現します。+


s+Laravel provides five cache drivers out of the box:+Lravelは５つのキャッシュドライバーを提供しています。+



s+By default, Laravel is configured to use the \*\*file\*\* system cache driver\. +Laravelはデフォルト設定で**ファイル**システムキャッシュドライバーを使用します。+

s+It's ready to go out of the box with no configuration\. +これは最初から、設定なしで利用できます。+

s+The file system driver stores cached items as files in the \*\*cache\*\* directory\. +ファイルシステムドライバーは**cache**ディレクトリーの中にファイルとしてアイテムを保存します。+

s+If you're satisfied with this driver, no other configuration is required\. +もし、このドライバーに満足したならば、他の設定は必要ないでしょう。+

s+You're ready to start using it\.+もう、使用を開始する準備が済んでいます。+

s+\*\*Note:\*\* Before using the file system cache driver, make sure your \*\*storage\/cache\*\* directory is writeable\.+ファイルシステムキャッシュドライバーを使用する前に、**storage/cache**ディレクトリーが書き込めるようにしてください。+




s+The database cache driver uses a given database table as a simple key-value store\. +データベースキャッシュドライバーはデータベーステーブルをシンプルなキー／値の保存場所として使用します。+

s+To get started, first set the name of the database table in \*\*application\/config\/cache\.php\*\*:+使い始めるには、最初に**application/config/cache.php**の中にデータベーステーブルの名前を設定してください。+

s+Next, create the table on your database\. +次にデータベーステーブルを作成します。+

s+The table should have three columns:+テーブルに次の３カラムを作成してください。+

s+That's it\. +これだけです！+

s+Once your configuration and table is setup, you're ready to start caching!+一度設定を行い、テーブルを用意したら、キャッシュを使う準備ができました。+



s+\[Memcached\](http:\/\/memcached\.org) is an ultra-fast, open-source distributed memory object caching system used by sites such as Wikipedia and Facebook\. +[Memcached](http://memcached.org)はウィキペディアやフェイスブックのようなサイトで使用されている究極な速さの、メモリーオブジェクトキャッシュシステムであり、オープンソースで配布されています。+

s+Before using Laravel's Memcached driver, you will need to install and configure Memcached and the PHP Memcache extension on your server\.+LaravelのMemcachedドライバーを使用し始める前に、Memcachedをインストール、設定します。それとPHP Memcache拡張をサーバーに入れておく必要があります。+

s+Once Memcached is installed on your server you must set the \*\*driver\*\* in the \*\*application\/config\/cache\.php\*\* file:+一度、Memcachedがインストールされたら、**application/config/cache.php**ファイルの**driver**を設定してください。+


s+Then, add your Memcached servers to the \*\*servers\*\* array:+それから、**servers**にMemcachedサーバーを付け加えます。+




s+\[Redis\](http:\/\/redis\.io) is an open source, advanced key-value store\. +[Redis](http://redis.io)はオープンソースの、進化したキー／値のデータストアです。+

s+It is often referred to as a data structure server since keys can contain \[strings\](http:\/\/redis\.io\/topics\/data-types#strings), \[hashes\](http:\/\/redis\.io\/topics\/data-types#hashes), \[lists\](http:\/\/redis\.io\/topics\/data-types#lists), \[sets\](http:\/\/redis\.io\/topics\/data-types#sets), and \[sorted sets\](http:\/\/redis\.io\/topics\/data-types#sorted-sets)\.+Redisはキーに[文字列](http://redis.shibu.jp/commandreference/strings.html)、[ハッシュ](http://redis.shibu.jp/commandreference/hashes.html)、[リスト](http://redis.shibu.jp/commandreference/lists.html), [セット](http://redis.shibu.jp/commandreference/sets.html)、[ソート済みセット](http://redis.shibu.jp/commandreference/sortedsets.html)で構成できるため、データー構造サーバーとして多く参照されます。+

s+Before using the Redis cache driver, you must \[configure your Redis servers\](\/docs\/database\/redis#config)\. +Redisキャッシュドライバーを使用する前に、[Redisサーバーの設定](/docs/database/redis#config)を行なってください。+

s+Now you can just set the \*\*driver\*\* in the \*\*application\/config\/cache\.php\*\* file:+そうしたら、**application/config/cache.php**の中の**driver**を設定します。+


s+To avoid naming collisions with other applications using APC, Redis, or a Memcached server, Laravel prepends a \*\*key\*\* to each item stored in the cache using these drivers\. +APCやRedis、Memcachedサーバーを使用している他のアプリケーションとの間に名前の衝突が起きるのを防ぐため、Laravleはこれらのドライバーを使っているキャッシュの中で、各アイテムに**key**を付加しています。+

s+Feel free to change this value:+自由にこの値を変更してください。+




s+The "memory" cache driver does not actually cache anything to disk\. +「メモリー」キャッシュドライバーはディスクに何もキャッシュしません。+

s+It simply maintains an internal array of the cache data for the current request\. +現在のリクエストに対して、キャッシュデーターをただの内部配列として管理します。+

s+This makes it perfect for unit testing your application in isolation from any storage mechanism\. +これは、他のストレージメカニズムから独立して、アプリケーションをテストするためにピッタリです。+

s+It should never be used as a "real" cache driver\.+決して、「本当」のキャッシュドライバーとしては使用しないでください。+



s+File System+ファイルシステム+
s+Memory (Arrays)+メモリー（配列）+
