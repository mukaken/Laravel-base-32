s+Laravel supports the following databases out of the box:+Laravelは以下のデータベースをサポートしています。+


s+All of the database configuration options live in the \*\*application\/config\/database\.php\*\* file\.+全てのデータベース設定オプションは、**application/config/database.php**の中にあります。+


s+\[SQLite\](http:\/\/sqlite\.org) is an awesome, zero-configuration database system\. +[SQLite](http://sqlite.org)は素晴らしいですね。設定が必要ないデータベースシステムです。+

s+By default, Laravel is configured to use a SQLite database\. +デフォルトで、LaravelはSQLiteデータベースを使用するように設定されています。+

s+Really, you don't have to change anything\. +本当に、何も変える必要はありません。+

s+Just drop a SQLite database named \*\*application\.sqlite\*\* into the \*\*application\/storage\/database\*\* directory\. +ただSQLiteデータベース名の**application.sqlite**を**application/storage/database**ディレクトリーに投下するだけです。+

s+You're done\.+これでおしまいです。+



s+Of course, if you want to name your database something besides "application", you can modify the database option in the SQLite section of the \*\*application\/config\/database\.php\*\* file:+もちろん、"application"以外の名前を付けたいのでしたら、**application/config/database.php**ファイルにある、データベースオプションSQLiteセクションを変更できます。+

s+your_database_name+あなたのデータベース名+


s+If your application receives less than 100,000 hits per day, SQLite should be suitable for production use in your application\. +もし、あなたのアプリケーションが一日１０万ヒット以下のアクセスを受けるのでしたら、SQLiteがアプリショーションの実稼働には最適でしょう。+

s+Otherwise, consider using MySQL or PostgreSQL\.+それ以上でしたら、MySQLかPostageSQLの使用を考えてください。+

s+\*\*Note:\*\* Need a good SQLite manager? +良いSQLiteの管理ソフトが必要ですか？+

s+Check out this \[Firefox extension\](https:\/\/addons\.mozilla\.org\/en-US\/firefox\/addon\/sqlite-manager\/)\.+この[Firefox拡張](https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/)をチェックしてみてください。+


s+If you are using MySQL, SQL Server, or PostgreSQL, you will need to edit the configuration options in \*\*application\/config\/database\.php\*\*\. +もし、MySQL、SQL Server、PostagreSQLを使用するのでしたら、**application/config/database.php**の中の設定オプションを変数する必要があります。+

s+In the configuration file you can find sample configurations for each of these systems\. +、設定ファイルの中をご覧になれば、それぞれのシステム毎に、サンプル設定が用意されているのが分かるでしょう。+
s+Just change the options as necessary for your server and set the default connection name\.+サーバーに合うように必要なオプションを変更し、デフォルトの接続名を設定してください。+



s+As you have probably noticed, each database connection defined in the \*\*application\/config\/database\.php\*\* file has a name\. +多分、お気づきになられたでしょうが、それぞれのデータベースの接続オプションは**aaplication/config/database.php**ファイル中で名前が定義されています。+

s+By default, there are three connections defined: \*\*sqlite\*\*, \*\*mysql\*\*, \*\*sqlsrv\*\*, and \*\*pgsql\*\*\. +デフォルトでは、３接続形態が定義されています。**sqlite**、**mysql**、**sqlsrv**、**pgsql**です。（訳注：原文のまま３接続と訳していますが、４接続が正しかと思います。）+

s+You are free to change these connection names\. +ご自由に接続名を変更してください。+

s+The default connection can be specified via the \*\*default\*\* option:+デフォルトの接続は**default**で設定します。+

s+The default connection will always be used by the \[fluent query builder\](\/docs\/database\/fluent)\. +デフォルト接続は、常に[Fluentクエリービルダー](/docs/database/fluent)で使用されます。+

s+If you need to change the default connection during a request, use the \*\*Config::set\*\* method\.+もし、リクエスト中にデフォルト接続を変更する必要がある場合は、**Congig::set()**メソッドを使用してください。+


s+Overwriting The Default PDO Options+デフォルトのPDOオプションをオーバーライトする+

s+The PDO connector class (\*\*laravel/database/connectors/connector.php\*\*) has a set of default PDO attributes defined which can be overwritten in the options array for each system. +PDO connectorクラス(**laravel/database/connectors/connector.php**)はデフォルトのPDO属性が定義してあり、それぞれのシステム毎にオプションの配列でオーバーライトできます。+

s+For example, one of the default attributes is to force column names to lowercase (\*\*PDO::CASE_LOWER\*\*) even if they are defined in UPPERCASE or CamelCase in the table. +例えばテーブルに大文字やキャメルケースでフィールドを定義してあっても、デフォルト属性としてカラム名を小文字へと強要(**PDO::CASE_LOWER**)しています。+

s+Therefore, under the default attributes, query result object variables would only be accessible in lowercase.+このため、デフォルト属性では、クエリー結果のオブジェクトの変数は小文字でのみアクセスできます。+

s+An example of the MySQL system settings with added default PDO attributes:+デフォルトのPDO属性にMySQLシステムの設定を追加する例：+

s+More about the PDO connection attributes can be found \[in the PHP manual\](http://php.net/manual/en/pdo.setattribute.php).+より多くのPDO接続属性については[PHPマニュアル](http://php.net/manual/ja/pdo.setattribute.php)をご覧ください。+