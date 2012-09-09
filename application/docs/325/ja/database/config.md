# データベース 設定

## 内容

- [SQLiteクイックスタート](#quick)
- [他のデータベースの設定](#server)
- [デフォルト接続名の設定](#default)
- [デフォルトのPDOオプションをオーバーライトする](#options)

Laravelは以下のデータベースをサポートしています。

- MySQL
- PostgreSQL
- SQLite
- SQL Server

全てのデータベース設定オプションは、**application/config/database.php**の中にあります。

<a name="quick"></a>
## SQLiteクイックスタート

[SQLite](http://sqlite.org)は素晴らしいですね。設定が必要ないデータベースシステムです。デフォルトで、LaravelはSQLiteデータベースを使用するように設定されています。本当に、何も変える必要はありません。ただSQLiteデータベース名の**application.sqlite**を**application/storage/database**ディレクトリーに投下するだけです。これでおしまいです。

もちろん、"application"以外の名前を付けたいのでしたら、**application/config/database.php**ファイルにある、データベースオプションSQLiteセクションを変更できます。

	'sqlite' => array(
	     'driver'   => 'sqlite',
	     'database' => 'あなたのデータベース名',
	)

もし、あなたのアプリケーションが一日１０万ヒット以下のアクセスを受けるのでしたら、SQLiteがアプリショーションの実稼働には最適でしょう。それ以上でしたら、MySQLかPostageSQLの使用を考えてください。

> 良いSQLiteの管理ソフトが必要ですか？この[Firefox拡張](https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/)をチェックしてみてください。

<a name="server"></a>
## 他のデータベースの設定

もし、MySQL、SQL Server、PostagreSQLを使用するのでしたら、**application/config/database.php**の中の設定オプションを変数する必要があります。、設定ファイルの中をご覧になれば、それぞれのシステム毎に、サンプル設定が用意されているのが分かるでしょう。サーバーに合うように必要なオプションを変更し、デフォルトの接続名を設定してください。

<a name="default"></a>
## デフォルト接続名の設定

多分、お気づきになられたでしょうが、それぞれのデータベースの接続オプションは**aaplication/config/database.php**ファイル中で名前が定義されています。デフォルトでは、３接続形態が定義されています。**sqlite**、**mysql**、**sqlsrv**、**pgsql**です。（訳注：原文のまま３接続と訳していますが、４接続が正しかと思います。）ご自由に接続名を変更してください。デフォルトの接続は**default**で設定します。

	'default' => 'sqlite';

デフォルト接続は、常に[Fluentクエリービルダー](/docs/database/fluent)で使用されます。もし、リクエスト中にデフォルト接続を変更する必要がある場合は、**Congig::set()**メソッドを使用してください。

<a href="options"></a>
##デフォルトのPDOオプションをオーバーライトする

PDO connectorクラス(**laravel/database/connectors/connector.php**)はデフォルトのPDO属性が定義してあり、それぞれのシステム毎にオプションの配列でオーバーライトできます。例えばテーブルに大文字やキャメルケースでフィールドを定義してあっても、デフォルト属性としてカラム名を小文字へと強要(**PDO::CASE_LOWER**)しています。このため、デフォルト属性では、クエリー結果のオブジェクトの変数は小文字でのみアクセスできます。
デフォルトのPDO属性にMySQLシステムの設定を追加する例：

	'mysql' => array(
		'driver'   => 'mysql',
		'host'     => 'localhost',
		'database' => 'database',
		'username' => 'root',
		'password' => '',
		'charset'  => 'utf8',
		'prefix'   => '',
		PDO::ATTR_CASE              => PDO::CASE_LOWER,
		PDO::ATTR_ERRMODE           => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_ORACLE_NULLS      => PDO::NULL_NATURAL,
		PDO::ATTR_STRINGIFY_FETCHES => false,
		PDO::ATTR_EMULATE_PREPARES  => false,
	),

より多くのPDO接続属性については[PHPマニュアル](http://php.net/manual/ja/pdo.setattribute.php)をご覧ください。