s+The Fluent Query Builder is Laravel's powerful fluent interface for building SQL queries and working with your database\. +Fluentクエリビルダーは、データーベースを取り扱うための、Laravelのパワフルで流暢(fluent)なSQLクエリビルダーです。+

s+All queries use prepared statements and are protected against SQL injection\.+全てのクエリーはプリペアードステートメントを使用し、SQLインジェクションから保護されます。+

s+You can begin a fluent query using the \*\*table\*\* method on the DB class\. +DBクラスの**table**メソッドを使用し、流暢にクエリーを開始しましょう。+

s+Just mention the table you wish to query:+クエリーする対象テーブルを指示だけしましょう。+

s+You now have a fluent query builder for the "users" table\. +これで、"users"テーブルに対するFluentクエリービルダーのインスタンスを手に入れました。+

s+Using this query builder, you can retrieve, insert, update, or delete records from the table\.+このクエリービルダーを使い、テーブルに対しレコードを取得、挿入、更新もしくは削除することができます。+

s+Retrieving an array of records from the database:+データベースから、レコードを配列で取得+

s+\*\*Note:\*\* The \*\*get\*\* method returns an array of objects with properties corresponding to the column on the table\.+**注目：** **get**メソッドはテーブルのカラムに対応するプロパティを持つオブジェクトの配列をリターンします。+

s+Retrieving a single record from the database:+データベースから一件のみ取得する+

s+Retrieving a single record by its primary key:+プライマリーキーを指定し、一件のみ取得する+

s+\*\*Note:\*\* If no results are found, the \*\*first\*\* method will return NULL\. +**注目：**模試結果が見つからない場合は、**first**メソッドはNULLをリターンします。+

s+The \*\*get\*\* method will return an empty array\.+**get**メソッドは、空配列をリターンします。+

s+Retrieving the value of a single column from the database:+データベースから、１カラムの値だけを取得+

s+Only selecting certain columns from the database:+データベースから、特定のカラムのみ取得+

s+Selecting distinct results from the database:+distinctを指定し、データベースからセレクト+




s+There are a variety of methods to assist you in building where clauses\. +様々なメソッドがwhere節を生成する手助けを行います。+

s+The most basic of these methods are the \*\*where\*\* and \*\*or_where\*\* methods\. +最も基本的なメソッドは、**where**と**or_where**です。+

s+Here is how to use them:+使い方をご覧ください：+


s+Of course, you are not limited to simply checking equality\. +もちろん、ただ値の同じレコードを指定するだけに制限されているわけではありません。+

s+You may also use \*\*greater-than\*\*, \*\*less-than\*\*, \*\*not-equal\*\*, and \*\*like\*\*:+**以上**、**以下**、**等しくない**、**like**も使用できます。+


s+As you may have assumed, the \*\*where\*\* method will add to the query using an AND condition, while the \*\*or_where\*\* method will use an OR condition\.+あなたの考えている通り、**where**メソッドはAND条件でクエリーします。OR条件の場合は、**or_where**を使います。+


s+The suite of \*\*where_in\*\* methods allows you to easily construct queries that search an array of values:+**whrere_in**メソッドは、配列の中の値で検索するクエリーを簡単に作るために使用できます。+



s+The suite of \*\*where_null\*\* methods makes checking for NULL values a piece of cake:+**whrere_null**メソッドは、NULL値を簡単にチェックするのに最適です+



s+You may discover the need to group portions of a WHERE clause within parentheses\. +WHERE節でカッコを使用し、グループにする必要があることもあります。+

s+Just pass a Closure as parameter to the \*\*where\*\* or \*\*or_where\*\* methods:+そんな場合は、**whrere**や**where_or**メソッドのパラメーターに無名関数を渡してください。+


s+The example above would generate a query that looks like:+上の例は、以下の様なクエリーを生成します。+


s+Dynamic where methods are great way to increase the readability of your code\. +動的whereメソッドはコードの読みやすさを上げる、素晴らしい手法です。+

s+Here are some examples:+いくつかサンプルを挙げましょう。+


s+Need to join to another table? +他のテーブルをjoinする必要がありますか？+

s+Try the \*\*join\*\* and \*\*left\\\_join\*\* methods:+**jon**と**left_join**を試してください。+


s+The \*\*table\*\* you wish to join is passed as the first parameter\. +最初の引数にjoinしたい**テーブル**を指定します。+

s+The remaining three parameters are used to construct the \*\*ON\*\* clause of the join\.+残りの３引数は、joinの**ON**節を構成します。+

s+Once you know how to use the join method, you know how to \*\*left_join\*\*\. +joinメソッドの使い方を覚えれば、**left_join**も使用できるようになります。+

s+The method signatures are the same:+メソッドの引数は同じです。+


s+You may also specify multiple conditions for an \*\*ON\*\* clause by passing a Closure as the second parameter of the join:+joinの第２パラメーターに無名関数を使用することで、**ON**節の複数条件を指定できます。+



s+You can easily order the results of your query using the \*\*order_by\*\* method\. +クエリー結果の並び順は**order_by**メソッドを使用し、簡単に指定できます。+

s+Simply mention the column and direction (desc or asc) of the sort:+メソッドに並べ替るカラムと方向(descかasc）を指定してください。+


s+Of course, you may sort on as many columns as you wish:+もちろん、好きなだけカラムを指定できます。+


s+If you would like to \*\*LIMIT\*\* the number of results returned by your query, you can use the \*\*take\*\* method:+クエリーで受け取る結果の数を**制限(limit)**したい時は、**take**メソッドが使用できます。+


s+To set the \*\*OFFSET\*\* of your query, use the \*\*skip\*\* method:+**オフセット**をクエリーに指定するには、**skip**メソッドを使用します。+


s+Need to get a \*\*MIN\*\*, \*\*MAX\*\*, \*\*AVG\*\*, \*\*SUM\*\*, or \*\*COUNT\*\* value? +**最大**、**最小**、**平均**、**合計**、**件数**を求めたいのですか？+

s+Just pass the column to the query:+でしたら、クエリーにカラム名を渡してください。+


s+Of course, you may wish to limit the query using a WHERE clause first:+もちろん、初めにWHERE節を使い、クエリーに条件をつけることもできます。+


s+Sometimes you may need to set the value of a column to a SQL function such as \*\*NOW()\*\*\. +場合により、**NOW()**のようなSQL関数をカラムの値にセットする場合もあります。+

s+Usually a reference to now() would automatically be quoted and escaped\. +通常、now()は自動的にエスケープ処理でクオートされてしまいます。+

s+To prevent this use the \*\*raw\*\* method on the \*\*DB\*\* class\. +これを防ぐには、**DB**クラスの**raw**メソッドを使います。+

s+Here's what it looks like:+このようになります：+


s+The \*\*raw\*\* method tells the query to inject the contents of the expression into the query as a string rather than a bound parameter\. +**row**メソッドは、クエリーに式の内容をパラメーターではなく、文字列として挿入するように、指示するものです。+

s+For example, you can also use expressions to increment column values:+例えば、項目の値をインクリメントする式に使えます。+


s+Of course, convenient methods are provided for \*\*increment\*\* and \*\*decrement\*\*:+もちろん、便利な**increment**、**decrement**メソッドも提供しています。+



s+The insert method expects an array of values to insert\. +insertメソッドは挿入する値の配列を受け取ります。+

s+The insert method will return true or false, indicating whether the query was successful:+insertメソッドはtrueかfalseをクエリーが成功したか示すために、リターンします。+


s+Inserting a record that has an auto-incrementing ID? +挿入したレコードは自動的にIDがインクリメントされるはずですって？+

s+You can use the \*\*insert\\\_get\\\_id\*\* method to insert a record and retrieve the ID:+**insert_get_id**メソッドで、レコードを挿入し、そのIDを取得できます。+

s+\*\*Note:\*\* The \*\*insert\\\_get\\\_id\*\* method expects the name of the auto-incrementing column to be "id"\.+**注目：** **insert_get_id**メソッドは、自動的に増分されるカラムの名前が"id"であることを前提として動作します。+



s+To update records simply pass an array of values to the \*\*update\*\* method:+レコードを更新するには、**update**メソッドに配列で値を渡します。+


s+Of course, when you only want to update a few records, you should add a WHERE clause before calling the update method:+もちろん、いくつかのレコードだけを更新したい時には、updateメソッドを呼び出す前に、WHERE節を付け加えてください。+



s+When you want to delete records from your database, simply call the \*\*delete\*\* method:+データベースからレコードを削除したい時には、シンプルに**delete**メソッドを呼び出してください。+

s+Want to quickly delete a record by its ID? +レコードをIDで手早く削除したいのですか？+

s+No problem\. +大丈夫です。+

s+Just pass the ID into the delete method:+deleteメソッドに、そのIDを渡してください。+



s+where and or\\\_where+whereとor_where+

s+where\\\_in, where\\\_not\\\_in, or\\\_where\\\_in, and or\\\_where\\\_not\\\_in+where_in、where_not_in、or_where_in、or_where_not_in+

s+where\\\_null, where\\\_not\\\_null, or\\\_where\\\_null, and or\\\_where\\\_not\\\_null+where_null、where_not_null、or_where_null、or_where_not_null+
