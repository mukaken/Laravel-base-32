s+To store items in the session call the put method on the Session class:+セッションにアイテムを保存するには、Sessionクラスのputメソッドを使います。+

s+The first parameter is the \*\*key\*\* to the session item\. +最初の引数は、セッションアイテムの**キー**です。+

s+You will use this key to retrieve the item from the session\. +このキーを指定してセッションからアイテムを取得します。+

s+The second parameter is the \*\*value\*\* of the item\.+２つ目の引数は、そのアイテムの**値**です。+

s+The \*\*flash\*\* method stores an item in the session that will expire after the next request\. +**flash**メソッドは、次のセッションの後に消去されるアイテムを保存します。+

s+It's useful for storing temporary data like status or error messages:+これは、ステータスメッセージやエラーメッセージのような一時的なデーターを保存するのに便利です。+


s+Flashing Items+フラッシュアイテム+

s+You can use the \*\*get\*\* method on the Session class to retrieve any item in the session, including flash data\. +フラッシュデーターも含め、セッションからアイテムを取得するには、Sessionクラスの**get**メソッドを使用します。+

s+Just pass the key of the item you wish to retrieve:+取得したいアイテムのキーを渡してください。+


s+By default, NULL will be returned if the session item does not exist\. +セッションアイテムが存在しない場合、デフォルトではNULL値が返されます。+

s+However, you may pass a default value as a second parameter to the get method:+ですが、getメソッドの第２引数に、デフォルト値を指定することもできます。+

s+Now, "Fred" will be returned if the "name" item does not exist in the session\.+これで"name"アイテムがセッションに存在しない場合、"Fred"がリターンされます。+

s+Laravel even provides a simple way to determine if a session item exists using the \*\*has\*\* method:+Laravelはセッションアイテムが存在しているか確認するために**has**メソッドも提供しています。+


s+To remove an item from the session use the \*\*forget\*\* method on the Session class:+セッションからアイテムを削除するには、Sessionクラスの**forget**メソッドを使います。+

s+You can even remove all of the items from the session using the \*\*flush\*\* method:+さらに、セッションからすべてのアイテムを削除したい場合は、**flush**メソッドを使ってください。+


s+Sometimes you may want to "regenerate" the session ID\. +時々、セッションIDを「再生成」したい場合もあるでしょう。+

s+This simply means that a new, random session ID will be assigned to the session\. +これはランダムな新しいセッションIDが、そのセッションに与えられることをシンプルに意味します。+

s+Here's how to do it:+実例をどうぞ。+

s+Flash items that are expiring in subsequent requests can be retained for another request by using one of the \*\*reflash\*\* or \*\*keep\*\* methods:+フラッシュアイテムは次のリクエストで消えますが、**reflash**か**keep**メソッドで、その先のリクエストまで保持することも可能です。+

s+Retain all items for another request:+全てのアイテムを再度保持する：+

s+Retain an individual item for another request:+特定のアイテムを保持する：+

s+Retain several items for another request:+複数のアイテムを保持する：+