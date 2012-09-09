# スキーマビルダー

## 内容

- [基本](#the-basics)
- [テーブルの作成と削除](#creating-dropping-tables)
- [カラム追加](#adding-columns)
- [カラム削除](#dropping-columns)
- [インデックス追加](#adding-indexes)
- [インデックス削除](#dropping-indexes)
- [外部キー](#foreign-keys)

<a name="the-basics"></a>
## 基本

スキーマビルダーはデータベーステーブルの作成と変更のメソッドを提供します。スラスラ書ける構文で、ベンダー限定の何かにとらわれず、テーブルを操作できます。

*参照：*

- [マイグレーション](/docs/database/migrations)

<a name="creating-dropping-tables"></a>
## テーブルの作成と削除

**Schema**クラスはテーブルを作成／修正するために使います。さっそく、例を見てみましょう。

#### 簡単なデータベーステーブルを作成

	Schema::create('users', function($table)
	{
		$table->increments('id');
	});

このサンプルを確認して行きましょう。スキーマビルダーに**create**メソッドでこれは新しいテーブルで、作成する必要があると伝えます。２つ目の引数で、無名関数を渡し、Tableインスタンスを受けます。このTableオブジェクトを利用し、カラムを足したり引いたり、テーブルに索引を付けたり、すらすら書けます。

#### データベースからテーブルを削除

	Schema::drop('users');

#### 指定したデータベース接続のテーブルを削除

	Schema::drop('users', 'connection_name');

時々、スキーマ操作を行うデータベース接続を指定する必要があるかも知れません。

#### 操作を行う接続を指定

	Schema::create('users', function($table)
	{
		$table->on('connection');
	});

<a name="adding-columns"></a>
## カラム追加

Fluentテーブルビルダーのメソッドは、特定のベンダーのSQLを使用せず、カラムを追加できます。まずはメソッドです。見て行きましょう。

コマンド  | 説明
------------- | -------------
`$table->increments('id');`  |  自動増分されるIDをテーブルへ
`$table->string('email');`  |  VARCHARのカラム
`$table->string('name', 100);`  |  長さ指定のVARCHAR
`$table->integer('votes');`  |  INTEGERをテーブルへ
`$table->float('amount');`  |  FLOATをテーブルへ
`$table->decimal('amount', 5, 2);`  |  最大桁数と少数桁を指定しDECIMALを追加
`$table->boolean('confirmed');`  |  BOOLEANをテーブルへ
`$table->date('created_at');`  |  日付をテーブルへ
`$table->timestamp('added_on');`  |  TIMESTAMPをテーブルへ
`$table->timestamps();`  |  **created_at**と**updated_at**を追加
`$table->text('description');`  |  TEXTをテーブルへ
`$table->blob('data');`  |  BLOBをテーブルへ
`->nullable()`  |  NULL値可能を指定
`->default($value)`  |  そのカラムのデフォルト値を宣言

> **追記：**Laravelの"boolean"タイプはすべてのデータベースシステムでsmall integerカラムにマップされます。

#### テーブルの作成とカラム追加例

	Schema::table('users', function($table)
	{
		$table->create();
		$table->increments('id');
		$table->string('username');
		$table->string('email');
		$table->string('phone')->nullable();
		$table->text('about');
		$table->timestamps();
	});

<a name="dropping-columns"></a>
## カラム削除

#### データベーステーブルからカラムを削除

	$table->drop_column('name');

#### データベーステーブルから複数のカラムを削除

	$table->drop_column(array('name', 'email'));

<a name="adding-indexes"></a>
## インデックス追加

スキーマビルダーは多くのタイプのインデックスをサポートしています。インデックスを付け加えるためには２つの方法があります。それぞれのインデックスタイプごとにメソッドがあります。しかしながら、カラムを追加時に索引を定義することもできます。見てみましょう。

#### インデックス付きでstringカラムを作成

	$table->string('email')->unique();

もし別の行でインデックスを定義するなら、もっと様々な指定ができます。インデックスメソッドの例をご覧ください。

コマンド  | 説明
------------- | -------------
`$table->primary('id');`  |  プライマリキーを追加
`$table->primary(array('fname', 'lname'));`  |  複合キーの追加
`$table->unique('email');`  |  ユニークキーの追加
`$table->fulltext('description');`  |  フルテキストインデックスの追加
`$table->index('state');`  |  基本インデックスの追加

<a name="dropping-indexes"></a>
## インデックス削除

インデックスを削除するには、名前を指定しなくてはなりません。Laravelはすべてのインデックスに適した名前をつけます。シンプルにテーブル名に続け、インデックスしているカラムの名前、それからインデックスのタイプです。例をご覧ください。

コマンド  | 説明
------------- | -------------
`$table->drop_primary('users_id_primary');`  |  "users"テーブルのプライマリーキーを削除
`$table->drop_unique('users_email_unique');`  |  "users"テーブルのユニークインデックスを削除
`$table->drop_fulltext ('profile_description_fulltext');`  |  "profile"テーブルから、フルテキストインデックスを削除
`$table->drop_index('geo_state_index');`  |  "geo"テーブルから、基本インデックスを削除

<a name="foreign-keys"></a>
## 外部キー

Schemaクラスの記述的なインターフェイスを使用し、テーブルに外部キー束縛を簡単に追加できます。例えば、**posts**テーブルに、**user_id**があり、**users**テーブルの**id**カラムを参照しているとしましょう。カラムに外部キー束縛を付け加える方法です。

	$table->foreign('user_id')->references('id')->on('users');

更に、「削除(on delete)」と「更新(on update)」アクションを外部キーに指定できます。

	$table->foreign('user_id')->references('id')->on('users')->on_delete('restrict');

	$table->foreign('user_id')->references('id')->on('users')->on_update('cascade');

また、簡単に外部キーを削除することもできます。スキームビルダーにおけるデフォルトの外部キーの名前は、他のインデックスを作成する場合と[同じ規則](#dropping-indexes)に従っています。サンプルをどうぞ。

	$table->drop_foreign('posts_user_id_foreign');