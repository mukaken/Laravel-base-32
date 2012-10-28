# 生のクエリー

## 内容

- [基本](#the-basics)
- [その他のクエリーメソッド](#other-query-methods)
- [PDO接続](#pdo-connections)

<a name="the-bascis"></a>
## 基本

**query**メソッドは、データベース接続に対して、そのままのSQLを任意に実行できるように用意されています。

#### データベースからレコードをセレクト

	$users = DB::query('select * from users');

#### バインディングを使いデータベースからレコードをセレクト

	$users = DB::query('select * from users where name = ?', array('test'));

#### データベースにレコードを挿入する

	$success = DB::query('insert into users values (?, ?)', $bindings);

#### レコードを更新し、影響を受けたレコード数を取得

	$affected = DB::query('update users set name = ?', $bindings);

#### テーブルから削除し、影響を受けたレコード数を取得

	$affected = DB::query('delete from users where id = ?', array(1));

<a name="other-query-methods"></a>
## その他のクエリーメソッド

Laravelはデータベースへのクエリーをシンプルに出来るように、他のメソッドも用意しています。おおまかな使い方です。

#### SELECTクエリーを実行し、最初の結果を取得

	$user = DB::first('select * from users where id = 1');

#### SELECTクエリーを実行し、ひとつのカラムの値だけを取得

	$email = DB::only('select email from users where id = 1');

<a name="pdo-connections"></a>
## PDO接続

時には、Laravel接続オブジェクトの後ろで使用されているPDO接続に直接アクセスしたい場合もあるでしょう。

#### データベースへのPDO接続を取得

	$pdo = DB::connection('sqlite')->pdo;

> **注目：**コネクション名が指定されない場合は、**default**の接続がリターンされます。