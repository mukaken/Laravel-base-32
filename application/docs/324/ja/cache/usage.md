# キャッシュ使用法

## 内容

- [アイテムの保存](#put)
- [アイテムの取得](#get)
- [アイテムの削除](#forget)

<a name="put"></a>
## アイテムの保存

キャッシュにアイテムを保存するのは、実に簡単です。Cacheクラスの**put**メソッドをただ呼び出してください。

	Cache::put('name', 'Taylor', 10);

最初の引数はキャッシュされるアイテムの**キー**です。このキーを使い、キャッシュからアイテムを取得します。２つ目の引数は**値**です。３つ目の引数は、アイテムがキャッシュに保存される**分**数です。

キャッシュに有効期限を付けない場合は、"forever"を使ってください。

	Cache::forever('name', 'Taylor');

> キャッシュにアイテムを保存するときにシリアライズの必要はありません。

<a name="get"></a>
## アイテムの取得

キャッシュからアイテムを取得するのは、保存するより簡単です。**get**メソッドを使います。ただ、取得したいアイテムのキーを指定してください。

	$name = Cache::get('name');

アイテムの有効期限が過ぎているか、存在していない場合、デフォルトとしてNULL値が返されます。ですが、他の値を第２引数に指定することで、デフォルト値を指定できます。

	$name = Cache::get('name', 'Fred');

これで、"name"キャッシュアイテムの期限が切れていたり、存在していない場合、"Fred"がリターンされます。

キャッシュアイテムが存在しない場合、データベースから値を取りたい時はどうしましょう？解決策はシンプルです。**get**メソッドのデフォルト値に無名関数を渡してください。無名関数は、キャッシュアイテムが存在していない場合のみ、実行されます。

	$users = Cache::get('count', function() {return DB::table('users')->count();});

この例を、もうちょっと進めてみましょう。アプリケーションの登録済みユーザー数を取得することをイメージシてください。もし、値がキャッシュされていなければ、デフォルト値をキャシュに保存したい場合は、**remember**メソッドを使います。

	$users = Cache::remember('count', function() {return DB::table('users')->count();}, 5);

この例を解説しましょう。**count**アイテムがキャッシュに存在するならば、その値が返されます。もし存在しなければ、無名関数の結果がキャッシュに５分間保存され、**かつ**メソッドの戻り値になります。絶妙でしょう？

Laravelは**has**メソッドでキャッシュアイテムが存在しているかを確認するシンプルな方法も提供しています。

	if (Cache::has('name'))
	{
	     $name = Cache::get('name');
	}

<a name="forget"></a>
## アイテムの削除

キャッシュアイテムを削除したい？問題ありません。**forget**メソッドにアイテムの名前を指定してください。

	Cache::forget('name');