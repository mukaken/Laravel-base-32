s+Events can provide a great away to build de-coupled applications, and allow plug-ins to tap into the core of your application without modifying its code\.+イベントは複数のアプリケーションを独立させ、コードに手を加えること無く、アプリケーションのコアにプラグインを実現する素晴らしい手段を提供します。+

s+To fire an event, just tell the \*\*Event\*\* class the name of the event you want to fire:+イベントを発生させるには、**Event**クラスに、発生させたいイベントの名前を指定します。+

s+Firing an event:+イベント発生+

s+Notice that we assigned the result of the \*\*fire\*\* method to a variable\. +**fire**メソッドの結果を変数に受け取っていることに注目してください。+

s+This method will return an array containing the responses of all the event's listeners\.+このメソッドは、すべてのイベントリスナーのレスポンスで構成された配列です。+

s+Sometimes you may want to fire an event, but just get the first response\. Here's how:+場合により、最初のイベントを発生させ、最初のレスポンスを受け取りたい時があるでしょう。次のようにします。+

s+Firing an event and retrieving the first response:+イベントを発生させ、最初のレスポンスを受け取る+
s+\*\*Note:\*\* The \*\*first\*\* method will still fire all of the handlers listening to the event, but will only return the first response\.+**注目：** **first**メソッドは、リッスンしている全てのハンドラーにむけイベントを発行させますが、最初のレスポンスのみが返されます。+

s+The \*\*Event::until\*\* method will execute the event handlers until the first non-null response is returned\.+**Event::until**メソッドは、最初にNULLではないレスポンスが返るまで、イベントハンドラを実行します。+

s+Firing an event until the first non-null response:+最初の非NULLレスポンスが返ってくるまで、イベントを発生+

s+So, what good are events if nobody is listening? +ところで、誰もイベントをリッスンしなければ、役に立ちませんよね？+

s+Register an event handler that will be called when an event fires:+イベントが発生したときに、呼び出されるハンドラーを登録しましょう。+

s+Registering an event handler:+イベントハンドラーを登録する+

s+I'm executed on the "loaded" event!+私は"loaded"イベントで実行される！+

s+The Closure we provided to the method will be executed each time the "loaded" event is fired\.+メソッドに指定した無名関数は、"loaded"イベントが発生するたびに実行されます。+


s+Sometimes you may wish to "queue" an event for firing, but not fire it immediately\. +ある場合には、イベント発生を「キュー」にため、直ぐに発生させたくない場合もあることでしょう。+

s+This is possible using the `queue` and `flush` methods\. +これは、"queue"と"flush"メソッドで可能です。+

s+First, throw an event on a given queue with a unique identifier:+最初に、ユニークな識別子を指定し、キューにイベントを入れましょう。+

s+Registering a queued event:+イベントをキューに登録する+


s+This method accepts three parameters\. +このメソッドには３つの引数があります。+

s+The first is the name of the queue, the second is a unique identifier for this item on the queue, and the third is an array of data to pass to the queue flusher\.+最初はキューの名前です。２番目はキューに入れるアイテムのユニークな識別子です。３つはキューのフラッシャー(flusher)に渡すデーターの配列です。+

s+Next, we'll register a flusher for the `foo` queue:+次に、"foo"キューにフラッシャーを登録します。+
s+Registering an event flusher:+イベントフラッシャーを登録する+


s+Note that the event flusher receives two arguments\. +イベントフラッシャーは２つの引数を取ることに注意してください。+

s+The first, is the unique identifier for the queued event, which in this case would be the user's ID\. +最初は、キューイベントのユニークな識別子です。この場合はユーザーIDです。+

s+The second (and any remaining) parameters would be the payload items for the queued event\.+２つ目（残りの）引数は、そのキューイベントに対する実行アイテムです。+

s+Finally, we can run our flusher and flush all queued events using the `flush` method:+最後に、フラッシャーを実行し、全てのキューに溜まっているイベントを実行させるために"flush"メソッドを使用してください。+


s+There are several events that are fired by the Laravel core\. +Laravelのコアにより、発生させられるイベントもいくつか存在します。+

s+Here they are:+確認してください。+

s+Event fired when a bundle is started:+バンドル開始時に発生するイベント+

s+Event fired when a database query is executed:+データベースクエリが実行された時に発生するイベント+

s+Event fired right before response is sent to browser:+ブラウザにレスポンスが送信される直前に発生するイベント+

s+Event fired when a messaged is logged using the Log class:+Logクラスを用い、メッセージをログした時に発生するイベント+
