s+The \*\*query\*\* method is used to execute arbitrary, raw SQL against your database connection\. +**query**メソッドは、データベース接続に対して、そのままのSQLを任意に実行できるように用意されています。+

s+Selecting records from the database:+データベースからレコードをセレクト+

s+Selecting records from the database using bindings:+バインディングを使いデータベースからレコードをセレクト+

s+Inserting a record into the database+データベースにレコードを挿入する+

s+Updating table records and getting the number of affected rows:+レコードを更新し、影響を受けたレコード数を取得+

s+Deleting from a table and getting the number of affected rows:+テーブルから削除し、影響を受けたレコード数を取得+


s+Laravel provides a few other methods to make querying your database simple\. +Laravelはデータベースへのクエリーをシンプルに出来るように、他のメソッドも用意しています。+

s+Here's an overview:+おおまかな使い方です。+

s+Running a SELECT query and returning the first result:+SELECTクエリーを実行し、最初の結果を取得+

s+Running a SELECT query and getting the value of a single column:+SELECTクエリーを実行し、ひとつのカラムの値だけを取得+


s+Sometimes you may wish to access the raw PDO connection behind the Laravel Connection object\.+時には、Laravel接続オブジェクトの後ろで使用されているPDO接続に直接アクセスしたい場合もあるでしょう。+

s+Get the raw PDO connection for a database:+データベースへのPDO接続を取得+

s+\*\*Note:\*\* If no connection name is specified, the \*\*default\*\* connection will be returned\.+**注目：**コネクション名が指定されない場合は、**default**の接続がリターンされます。+
