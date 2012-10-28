s+Storing items in the cache is simple\. +キャッシュにアイテムを保存するのは、実に簡単です。+

s+Simply call the \*\*put\*\* method on the Cache class:+Cacheクラスの**put**メソッドをただ呼び出してください。+


s+The first parameter is the \*\*key\*\* to the cache item\. +最初の引数はキャッシュされるアイテムの**キー**です。+

s+You will use this key to retrieve the item from the cache\. +このキーを使い、キャッシュからアイテムを取得します。+

s+The second parameter is the \*\*value\*\* of the item\. +２つ目の引数は**値**です。+

s+The third parameter is the number of \*\*minutes\*\* you want the item to be cached\.+３つ目の引数は、アイテムがキャッシュに保存される**分**数です。+

s+You may also cache something "forever" if you do not want the cache to expire:+キャッシュに有効期限を付けない場合は、"forever"を使ってください。+


s+\*\*Note:\*\* It is not necessary to serialize objects when storing them in the cache\.+キャッシュにアイテムを保存するときにシリアライズの必要はありません。+




s+Retrieving items from the cache is even more simple than storing them\. +キャッシュからアイテムを取得するのは、保存するより簡単です。+

s+It is done using the \*\*get\*\* method\. +**get**メソッドを使います。+

s+Just mention the key of the item you wish to retrieve:+ただ、取得したいアイテムのキーを指定してください。+


s+By default, NULL will be returned if the cached item has expired or does not exist\. +アイテムの有効期限が過ぎているか、存在していない場合、デフォルトとしてNULL値が返されます。+

s+However, you may pass a different default value as a second parameter to the method:+ですが、他の値を第２引数に指定することで、デフォルト値を指定できます。+


s+Now, "Fred" will be returned if the "name" cache item has expired or does not exist\.+これで、"name"キャッシュアイテムの期限が切れていたり、存在していない場合、"Fred"がリターンされます。+


s+What if you need a value from your database if a cache item doesn't exist? +キャッシュアイテムが存在しない場合、データベースから値を取りたい時はどうしましょう？+

s+The solution is simple\. +解決策はシンプルです。+

s+You can pass a closure into the \*\*get\*\* method as a default value\. +**get**メソッドのデフォルト値に無名関数を渡してください。+

s+The closure will only be executed if the cached item doesn't exist:+無名関数は、キャッシュアイテムが存在していない場合のみ、実行されます。+



s+Let's take this example a step further\. +この例を、もうちょっと進めてみましょう。+

s+Imagine you want to retrieve the number of registered users for your application; however, if the value is not cached, you want to store the default value in the cache using the \*\*remember\*\* method:+アプリケーションの登録済みユーザー数を取得することをイメージシてください。もし、値がキャッシュされていなければ、デフォルト値をキャシュに保存したい場合は、**remember**メソッドを使います。+


s+Let's talk through that example\. +この例を解説しましょう。+

s+If the \*\*count\*\* item exists in the cache, it will be returned\. +**count**アイテムがキャッシュに存在するならば、その値が返されます。+

s+If it doesn't exist, the result of the closure will be stored in the cache for five minutes \*\*and\*\* be returned by the method\. +もし存在しなければ、無名関数の結果がキャッシュに５分間保存され、**かつ**メソッドの戻り値になります。+

s+Slick, huh?+絶妙でしょう？+

s+Laravel even gives you a simple way to determine if a cached item exists using the \*\*has\*\* method:+Laravelは**has**メソッドでキャッシュアイテムが存在しているかを確認するシンプルな方法も提供しています。+


s+Need to get rid of a cached item? +キャッシュアイテムを削除したい？+

s+No problem\. +問題ありません。+

s+Just mention the name of the item to the \*\*forget\*\* method:+**forget**メソッドにアイテムの名前を指定してください。+
