s+The Schema Builder provides methods for creating and modifying your database tables. +スキーマビルダーはデータベーステーブルの作成と変更のメソッドを提供します。+

s+Using a fluent syntax, you can work with your tables without using any vendor specific SQL\.+スラスラ書ける構文で、ベンダー限定の何かにとらわれず、テーブルを操作できます。+


s+The \*\*Schema\*\* class is used to create and modify tables\. +**Schema**クラスはテーブルを作成／修正するために使います。+

s+Let's jump right into an example:+さっそく、例を見てみましょう。+

s+Creating a simple database table:+簡単なデータベーステーブルを作成+


s+Let's go over this example\. +このサンプルを確認して行きましょう。+

s+The \*\*create\*\* method tells the Schema builder that this is a new table, so it should be created\. +スキーマビルダーに**create**メソッドでこれは新しいテーブルで、作成する必要があると伝えます。+

s+In the second argument, we passed a Closure which receives a Table instance\. +２つ目の引数で、無名関数を渡し、Tableインスタンスを受けます。+

s+Using this Table object, we can fluently add and drop columns and indexes on the table\.+このTableオブジェクトを利用し、カラムを足したり引いたり、テーブルに索引を付けたり、すらすら書けます。+


s+Dropping a table from the database:+データベースからテーブルを削除+

s+Dropping a table from a given database connection:+指定したデータベース接続のテーブルを削除+


s+Sometimes you may need to specify the database connection on which the schema operation should be performed\.+時々、スキーマ操作を行うデータベース接続を指定する必要があるかも知れません。+

s+Specifying the connection to run the operation on:+操作を行う接続を指定+


s+The fluent table builder's methods allow you to add columns without using vendor specific SQL\. +Fluentテーブルビルダーのメソッドは、特定のベンダーのSQLを使用せず、カラムを追加できます。+

s+Let's go over it's methods:+まずはメソッドです。見て行きましょう。+


s+Incrementing ID to the table+自動増分されるIDをテーブルへ+
s+VARCHAR equivalent column+VARCHARのカラム+
s+VARCHAR equivalent with a length+長さ指定のVARCHAR+
s+INTEGER equivalent to the table+INTEGERをテーブルへ+
s+FLOAT equivalent to the table+FLOATをテーブルへ+
s+DECIMAL equivalent with a precision and scale+最大桁数と少数桁を指定しDECIMALを追加+
s+BOOLEAN equivalent to the table+BOOLEANをテーブルへ+
s+DATE equivalent to the table+日付をテーブルへ+
s+TIMESTAMP equivalent to the table+TIMESTAMPをテーブルへ+
s+Adds \*\*created\\\_at\*\* and \*\*updated\\\_at\*\* columns+**created_at**と**updated_at**を追加+
s+TEXT equivalent to the table+TEXTをテーブルへ+
s+BLOB equivalent to the table+BLOBをテーブルへ+
s+Designate that the column allows NULL values+NULL値可能を指定+
s+Declare a default value for a column+そのカラムのデフォルト値を宣言+

s+\*\*Note:\*\* Laravel's "boolean" type maps to a small integer column on all database systems\.+**追記：**Laravelの"boolean"タイプはすべてのデータベースシステムでsmall integerカラムにマップされます。+

s+Example of creating a table and adding columns+テーブルの作成とカラム追加例+



s+Dropping a column from a database table:+データベーステーブルからカラムを削除+

s+Dropping several columns from a database table:+データベーステーブルから複数のカラムを削除+




s+The Schema builder supports several types of indexes\. +スキーマビルダーは多くのタイプのインデックスをサポートしています。+

s+There are two ways to add the indexes\. +インデックスを付け加えるためには２つの方法があります。+

s+Each type of index has its method; however, you can also fluently define an index on the same line as a column addition\. +それぞれのインデックスタイプごとにメソッドがあります。しかしながら、カラムを追加時に索引を定義することもできます。+

s+Let's take a look:+見てみましょう。+

s+Fluently creating a string column with an index:+インデックス付きでstringカラムを作成+

s+If defining the indexes on a separate line is more your style, here are example of using each of the index methods:+もし別の行でインデックスを定義するなら、もっと様々な指定ができます。インデックスメソッドの例をご覧ください。+



s+Adding a primary key+プライマリキーを追加+
s+Adding composite keys+複合キーの追加+
s+Adding a unique index+ユニークキーの追加+
s+Adding a full-text index+フルテキストインデックスの追加+
s+Adding a basic index+基本インデックスの追加+



s+To drop indexes you must specify the index's name\. +インデックスを削除するには、名前を指定しなくてはなりません。+

s+Laravel assigns a reasonable name to all indexes\. +Laravelはすべてのインデックスに適した名前をつけます。+

s+Simply concatenate the table name and the names of the columns in the index, then append the type of the index\. +シンプルにテーブル名に続け、インデックスしているカラムの名前、それからインデックスのタイプです。+

s+Let's take a look at some examples:+例をご覧ください。+



s+Dropping a primary key from the "users" table+"users"テーブルのプライマリーキーを削除+
s+Dropping a unique index from the "users" table+"users"テーブルのユニークインデックスを削除+
s+Dropping a full-text index from the "profile" table+"profile"テーブルから、フルテキストインデックスを削除+
s+Dropping a basic index from the "geo" table+"geo"テーブルから、基本インデックスを削除+



s+You may easily add foreign key constraints to your table using Schema's fluent interface\. +Schemaクラスの記述的なインターフェイスを使用し、テーブルに外部キー束縛を簡単に追加できます。+

s+For example, let's assume you have a \*\*user_id\*\* on a \*\*posts\*\* table, which references the \*\*id\*\* column of the \*\*users\*\* table\. +例えば、**posts**テーブルに、**user_id**があり、**users**テーブルの**id**カラムを参照しているとしましょう。+

s+Here's how to add a foreign key constraint for the column:+カラムに外部キー束縛を付け加える方法です。+

s+You may also specify options for the "on delete" and "on update" actions of the foreign key:+更に、「削除(on delete)」と「更新(on update)」アクションを外部キーに指定できます。+


s+You may also easily drop a foreign key constraint\. +また、簡単に外部キーを削除することもできます。+

s+The default foreign key names follow the \[same convention\](#dropping-indexes) as the other indexes created by the Schema builder\. +スキームビルダーにおけるデフォルトの外部キーの名前は、他のインデックスを作成する場合と[同じ規則](#dropping-indexes)に従っています。+

s+Here's an example:+サンプルをどうぞ。+

# 以下は、テーブルの項目の改行を追加している
s+\$table->drop_fulltext('profile_description_fulltext');+$table->drop_fulltext ('profile_description_fulltext');+

s+\*\*Note:\*\* The field referenced in the foreign key is very likely an auto increment and therefore automatically an unsigned integer\. +**注意：**外部キーで参照されるフィールドは自動増分項目であり、そのため自動的にunsigned integerになります。+

s+Please make sure to create the foreign key field with \*\*unsigned()\*\* as both fields have to be the exact same type, the engine on both tables has to be set to \*\*InnoDB\*\*, and the referenced table must be created \*\*before\*\* the table with the foreign key\.+ですから、外部キーのフィールドは**unsigned()**で作成し、両方共に同じタイプであることを確認してください。さらに、両方のテーブルはエンジンに**InnoDB**をセットしていること、参照されるテーブルは、外部キーのテーブルの**前に**作成することも確実に行なってください。+

s+Command+コマンド+
s+Description+説明+
