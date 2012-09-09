# Fluentクエリービルダー

## 内容

- [基本](#the-basics)
- [レコード取得](#get)
- [Where節の生成](#where)
- [Where節のネスト](#nested-where)
- [動的Where節](#dynamic)
- [テーブル接合](#joins)
- [結果の順序](#ordering)
- [レコードスキップと取得数制限](#limit)
- [集計](#aggregates)
- [式](#expressions)
- [レコード挿入](#insert)
- [レコード更新](#update)
- [レコード削除](#delete)

## 基本

Fluentクエリビルダーは、データーベースを取り扱うための、Laravelのパワフルで流暢(fluent)なSQLクエリビルダーです。全てのクエリーはプリペアードステートメントを使用し、SQLインジェクションから保護されます。

DBクラスの**table**メソッドを使用し、流暢にクエリーを開始しましょう。クエリーする対象テーブルを指示だけしましょう。

	$query = DB::table('users');

これで、"users"テーブルに対するFluentクエリービルダーのインスタンスを手に入れました。このクエリービルダーを使い、テーブルに対しレコードを取得、挿入、更新もしくは削除することができます。

<a name="get"></a>
## レコード取得

#### データベースから、レコードを配列で取得

	$users = DB::table('users')->get();

> **注目：** **get**メソッドはテーブルのカラムに対応するプロパティを持つオブジェクトの配列をリターンします。

#### データベースから一件のみ取得する

	$user = DB::table('users')->first();
	
#### プライマリーキーを指定し、一件のみ取得する

	$user = DB::table('users')->find($id);

> **注目：**模試結果が見つからない場合は、**first**メソッドはNULLをリターンします。**get**メソッドは、空配列をリターンします。

#### データベースから、１カラムの値だけを取得

	$email = DB::table('users')->where('id', '=', 1)->only('email');

#### データベースから、特定のカラムのみ取得

	$user = DB::table('users')->get(array('id', 'email as user_email'));

#### distinctを指定し、データベースからセレクト

	$user = DB::table('users')->distinct()->get();

<a name="where"></a>
## Where節の生成

### whereとor_where

様々なメソッドがwhere節を生成する手助けを行います。最も基本的なメソッドは、**where**と**or_where**です。使い方をご覧ください：

	return DB::table('users')
		->where('id', '=', 1)
		->or_where('email', '=', 'example@gmail.com')
		->first();

もちろん、ただ値の同じレコードを指定するだけに制限されているわけではありません。**以上**、**以下**、**等しくない**、**like**も使用できます。

	return DB::table('users')
		->where('id', '>', 1)
		->or_where('name', 'LIKE', '%Taylor%')
		->first();

あなたの考えている通り、**where**メソッドはAND条件でクエリーします。OR条件の場合は、**or_where**を使います。

### where_in、where_not_in、or_where_in、or_where_not_in

**whrere_in**メソッドは、配列の中の値で検索するクエリーを簡単に作るために使用できます。

	DB::table('users')->where_in('id', array(1, 2, 3))->get();

	DB::table('users')->where_not_in('id', array(1, 2, 3))->get();

	DB::table('users')
		->where('email', '=', 'example@gmail.com')
		->or_where_in('id', array(1, 2, 3))
		->get();

	DB::table('users')
		->where('email', '=', 'example@gmail.com')
		->or_where_not_in('id', array(1, 2, 3))
		->get();

### where_null、where_not_null、or_where_null、or_where_not_null

**whrere_null**メソッドは、NULL値を簡単にチェックするのに最適です

	return DB::table('users')->where_null('updated_at')->get();

	return DB::table('users')->where_not_null('updated_at')->get();

	return DB::table('users')
		->where('email', '=', 'example@gmail.com')
		->or_where_null('updated_at')
		->get();

	return DB::table('users')
		->where('email', '=', 'example@gmail.com')
		->or_where_not_null('updated_at')
		->get();

<a name="nested-where"></a>
## Where節のネスト

WHERE節でカッコを使用し、グループにする必要があることもあります。そんな場合は、**whrere**や**where_or**メソッドのパラメーターに無名関数を渡してください。

	$users = DB::table('users')
		->where('id', '=', 1)
		->or_where(function($query)
		{
			$query->where('age', '>', 25);
			$query->where('votes' '>', 100);
		})
		->get();

上の例は、以下の様なクエリーを生成します。

	SELECT * FROM "users" WHERE "id" = ? OR ("age" > ? AND "votes" > ?)

<a name="dynamic"></a>
## 動的Where節

動的whereメソッドはコードの読みやすさを上げる、素晴らしい手法です。いくつかサンプルを挙げましょう。

	$user = DB::table('users')->where_email('example@gmail.com')->first();

	$user = DB::table('users')->where_email_and_password('example@gmail.com', 'secret');

	$user = DB::table('users')->where_id_or_name(1, 'Fred');


<a name="joins"></a>
## テーブル接合

他のテーブルをjoinする必要がありますか？**jon**と**left_join**を試してください。

	DB::table('users')
		->join('phone', 'users.id', '=', 'phone.user_id')
		->get(array('users.email', 'phone.number'));

最初の引数にjoinしたい**テーブル**を指定します。残りの３引数は、joinの**ON**節を構成します。

joinメソッドの使い方を覚えれば、**left_join**も使用できるようになります。メソッドの引数は同じです。

	DB::table('users')
		->left_join('phone', 'users.id', '=', 'phone.user_id')
		->get(array('users.email', 'phone.number'));

joinの第２パラメーターに無名関数を使用することで、**ON**節の複数条件を指定できます。

	DB::table('users')
		->join('phone', function($join)
		{
			$join->on('users.id', '=', 'phone.user_id');
			$join->or_on('users.id', '=', 'phone.contact_id');
		})
		->get(array('users.email', 'phone.numer'));

<a name="ordering"></a>
## 結果の順序

クエリー結果の並び順は**order_by**メソッドを使用し、簡単に指定できます。メソッドに並べ替るカラムと方向(descかasc）を指定してください。

	return DB::table('users')->order_by('email', 'desc')->get();

もちろん、好きなだけカラムを指定できます。

	return DB::table('users')
		->order_by('email', 'desc')
		->order_by('name', 'asc')
		->get();

<a name="limit"></a>
## レコードスキップと取得数制限

クエリーで受け取る結果の数を**制限(limit)**したい時は、**take**メソッドが使用できます。

	return DB::table('users')->take(10)->get();

**オフセット**をクエリーに指定するには、**skip**メソッドを使用します。

	return DB::table('users')->skip(10)->get();

<a name="aggregates"></a>
## 集計

**最大**、**最小**、**平均**、**合計**、**件数**を求めたいのですか？でしたら、クエリーにカラム名を渡してください。

	$min = DB::table('users')->min('age');

	$max = DB::table('users')->max('weight');

	$avg = DB::table('users')->avg('salary');

	$sum = DB::table('users')->sum('votes');

	$count = DB::table('users')->count();

もちろん、初めにWHERE節を使い、クエリーに条件をつけることもできます。

	$count = DB::table('users')->where('id', '>', 10)->count();

<a name="expressions"></a>
## 式

場合により、**NOW()**のようなSQL関数をカラムの値にセットする場合もあります。通常、now()は自動的にエスケープ処理でクオートされてしまいます。これを防ぐには、**DB**クラスの**raw**メソッドを使います。このようになります：

	DB::table('users')->update(array('updated_at' => DB::raw('NOW()')));

**row**メソッドは、クエリーに式の内容をパラメーターではなく、文字列として挿入するように、指示するものです。例えば、項目の値をインクリメントする式に使えます。

	DB::table('users')->update(array('votes' => DB::raw('votes + 1')));

もちろん、便利な**increment**、**decrement**メソッドも提供しています。

	DB::table('users')->increment('votes');

	DB::table('users')->decrement('votes');

<a name="insert"></a>
## レコード挿入

insertメソッドは挿入する値の配列を受け取ります。insertメソッドはtrueかfalseをクエリーが成功したか示すために、リターンします。

	DB::table('users')->insert(array('email' => 'example@gmail.com'));

挿入したレコードは自動的にIDがインクリメントされるはずですって？**insert_get_id**メソッドで、レコードを挿入し、そのIDを取得できます。

	$id = DB::table('users')->insert_get_id(array('email' => 'example@gmail.com'));

> **注目：** **insert_get_id**メソッドは、自動的に増分されるカラムの名前が"id"であることを前提として動作します。

<a name="update"></a>
## レコード更新

レコードを更新するには、**update**メソッドに配列で値を渡します。

	$affected = DB::table('users')->update(array('email' => 'new_email@gmail.com'));

もちろん、いくつかのレコードだけを更新したい時には、updateメソッドを呼び出す前に、WHERE節を付け加えてください。

	$affected = DB::table('users')
		->where('id', '=', 1)
		->update(array('email' => 'new_email@gmail.com'));

<a name="delete"></a>
## レコード削除

データベースからレコードを削除したい時には、シンプルに**delete**メソッドを呼び出してください。

	$affected = DB::table('users')->where('id', '=', 1)->delete();

レコードをIDで手早く削除したいのですか？大丈夫です。deleteメソッドに、そのIDを渡してください。

	$affected = DB::table('users')->delete(1);