# セッション使用法

## 内容

- [アイテムの保存](#put)
- [アイテムの取得](#get)
- [アイテムの削除](#forget)
- [再生成](#regeneration)

<a name="put"></a>
## アイテムの保存

セッションにアイテムを保存するには、Sessionクラスのputメソッドを使います。

	Session::put('name', 'Taylor');

最初の引数は、セッションアイテムの**キー**です。このキーを指定してセッションからアイテムを取得します。２つ目の引数は、そのアイテムの**値**です。

**flash**メソッドは、次のセッションの後に消去されるアイテムを保存します。これは、ステータスメッセージやエラーメッセージのような一時的なデーターを保存するのに便利です。

	Session::flash('status', 'Welcome Back!');

<a name="get"></a>
## アイテムの取得

フラッシュデーターも含め、セッションからアイテムを取得するには、Sessionクラスの**get**メソッドを使用します。取得したいアイテムのキーを渡してください。

	$name = Session::get('name');

セッションアイテムが存在しない場合、デフォルトではNULL値が返されます。ですが、getメソッドの第２引数に、デフォルト値を指定することもできます。

	$name = Session::get('name', 'Fred');

	$name = Session::get('name', function() {return 'Fred';});

これで"name"アイテムがセッションに存在しない場合、"Fred"がリターンされます。

Laravelはセッションアイテムが存在しているか確認するために**has**メソッドも提供しています。

	if (Session::has('name'))
	{
	     $name = Session::get('name');
	}

<a name="forget"></a>
## アイテムの削除

セッションからアイテムを削除するには、Sessionクラスの**forget**メソッドを使います。

	Session::forget('name');

さらに、セッションからすべてのアイテムを削除したい場合は、**flush**メソッドを使ってください。

	Session::flush();

<a name="regeneration"></a>
## 再生成

時々、セッションIDを「再生成」したい場合もあるでしょう。これはランダムな新しいセッションIDが、そのセッションに与えられることをシンプルに意味します。実例をどうぞ。

	Session::regenerate();