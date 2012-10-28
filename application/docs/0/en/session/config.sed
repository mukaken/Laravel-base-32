s+The web is a stateless environment\. +Webはステートレスな環境です。+

s+This means that each request to your application is considered unrelated to any previous request\. +つまり、アプリケーションに対する毎回のリクエストは、前回のリクエストと関係が無いことを意味しています。+

s+However, \*\*sessions\*\* allow you to store arbitrary data for each visitor to your application\. +しかし、**セッション**は任意のデーターをあなたのアプリケーションの各訪問者毎に任意のデータを保持してくれます。+

s+The session data for each visitor is stored on your web server, while a cookie containing a \*\*session ID\*\* is stored on the visitor's machine\. +それぞれの訪問者に対するセッションデーターはWebサーバーに保存され、同時に**セッションID**が訪問者のコンピューターのクッキーに保存されます。+

s+This cookie allows your application to "remember" the session for that user and retrieve their session data on subsequent requests to your application\.+クッキーはそのユーザーのセッションをアプリケーションに「思い出させ」、その後に続くリクエストでセッションを取得させてくれる役目をします。+

s+\*\*Note:\*\* Before using sessions, make sure an application key has been specified in the \*\*application\/config\/application\.php\*\* file\.+**注目：**セッションを使い始める前に、**application/config/application.php**ファイルのアプリケーションキーを指定してください。+

s+Six session drivers are available out of the box:+６つのセッションドライバーが用意されています。+


s+Cookie based sessions provide a light-weight and fast mechanism for storing session information\. +クッキーベースのセッションはライトウェイトで早いセッション情報の保持メカニズムです。+

s+They are also secure\. +しかも、セキュアです。+

s+Each cookie is encrypted using strong AES-256 encryption\. +それぞれのクッキーは、強力なAES-256を使用して暗号化されます。+

s+However, cookies have a four kilobyte storage limit, so you may wish to use another driver if you are storing a lot of data in the session\.+しかしながら、クッキーは４Kbの容量しか無いため、より多くの情報をセッションに保存したい場合、他のドライバーを使ってください。+

s+To get started using cookie sessions, just set the driver option in the \*\*application\/config\/session\.php\*\* file:+クッキーセッションを使い始める場合は、**application/config/session.php**ファイルのdriverオプションをセットするだけです。+


s+Most likely, your application will work great using file system sessions\. +ほとんどの場合、ファイルシステムセッションはあなたのアプリケーションで上手く機能するでしょう。+

s+However, if your application receives heavy traffic or runs on a server farm, use database or Memcached sessions\.+しかしながら、非常に多くのトラフィックを扱うか、サーバーの形態で運用する場合は、データベースか、Memchachセッションを使ってください。+

s+To get started using file system sessions, just set the driver option in the \*\*application\/config\/session\.php\*\* file:+ファイルシステムセッションを使い始める場合は、**application/config/session.php**ファイルのdriverオプションをセットするだけで済みます。+


s+That's it\. +これだけです。+

s+You're ready to go!+準備完了です！+

s+\*\*Note:\*\* File system sessions are stored in the \*\*storage\/sessions\*\* directory, so make sure it's writeable\.+**注目：**ファイルシステムは**strage/sessions**ディレクトリーに保存されます。ですから、書き込み可能に設定してください。+




s+To start using database sessions, you will first need to \[configure your database connection\](\/docs\/database\/config)\.+データベースセッションを使い始める前、最初に[データベース接続の設定](/docs/database/config)が必要です。+

s+Next, you will need to create a session table\. +次にセッションテーブルを作成する必要があります。+

s+Below are some SQL statements to help you get started\. +以降に、参考になるようにSQL文を紹介します。+

s+However, you may also use Laravel's "Artisan" command-line to generate the table for you!+しかしながら、Laravelの"Artisan"コマンドラインでテーブルの生成もできます！+



s+If you would like to use a different table name, simply change the \*\*table\*\* option in the \*\*application\/config\/session\.php\*\* file:+もし別のテーブル名を使用したいのでしたら、**application/config/session.php**ファイルの**table**オプションを変更してください。+


s+All you need to do now is set the driver in the \*\*application\/config\/session\.php\*\* file:+後、行うべきなのは**application/config/session.php**でドライバーの設定です。+


s+Before using Memcached sessions, you must \[configure your Memcached servers\](\/docs\/database\/config#memcached)\.+Memcacheセッションを使い始める前に、[Memcacheサーバーの設定](/docs/cache/config#memchached)を行なってください。+

s+Just set the driver in the \*\*application\/config\/session\.php\*\* file:+後は、**applicaton/config/session.php**ファイルでドライバーを設定します。+



s+Before using Redis sessions, you must \[configure your Redis servers\](\/docs\/database\/redis#config)\.+Redisセッションを使い始める前に、[Redisサーバーの設定](/docs/database/redis#config)を行なってください。+

s+Just set the driver in the \*\*application\/config\/session\.php\*\* file:+後は、**application/config/session.php**＋ファイルでドライバーを指定するだけです。+


s+The "memory" session driver just uses a simple array to store your session data for the current request\. +"memory"セッションドライバーは現在のリクエストのため、ただ配列に保存するだけです。+

s+This driver is perfect for unit testing your application since nothing is written to disk\. +このドライバーはディスクに何も書き込みませんから、アプリケーションのユニットテストにピッタリです。+

s+It shouldn't ever be used as a "real" session driver\.+これは「本当」のセッションドライバーではありません。+
