# イベント

## 内容

- [基本](#the-basics)
- [イベントの発行](#firing-events)
- [イベントのリッスン](#listening-to-events)
- [キューイングされるイベント](#queued-events)
- [Laravelイベント](#laravel-events)

<a name="the-basics"></a>
## 基本

イベントは複数のアプリケーションを独立させ、コードに手を加えること無く、アプリケーションのコアにプラグインを実現する素晴らしい手段を提供します。

<a name="firing-events"></a>
## イベントの発行

イベントを発生させるには、**Event**クラスに、発生させたいイベントの名前を指定します。

#### イベント発生

	$responses = Event::fire('loaded');

**fire**メソッドの結果を変数に受け取っていることに注目してください。このメソッドは、すべてのイベントリスナーのレスポンスで構成された配列です。

場合により、最初のイベントを発生させ、最初のレスポンスを受け取りたい時があるでしょう。次のようにします。

#### イベントを発生させ、最初のレスポンスを受け取る

	$response = Event::first('loaded');

> **注目：** **first**メソッドは、リッスンしている全てのハンドラーにむけイベントを発行させますが、最初のレスポンスのみが返されます。

**Event::until**メソッドは、最初にNULLではないレスポンスが返るまで、イベントハンドラを実行します。

#### 最初の非NULLレスポンスが返ってくるまで、イベントを発生

	$response = Event::until('loaded');

<a name="listening-to-events"></a>
## イベントのリッスン

ところで、誰もイベントをリッスンしなければ、役に立ちませんよね？イベントが発生したときに、呼び出されるハンドラーを登録しましょう。

#### イベントハンドラーを登録する

	Event::listen('loaded', function()
	{
		// 私は"loaded"イベントで実行される！
	});

メソッドに指定した無名関数は、"loaded"イベントが発生するたびに実行されます。

<a name="queued-events"></a>
## キューイングされるイベント

ある場合には、イベント発生を「キュー」にため、直ぐに発生させたくない場合もあることでしょう。これは、"queue"と"flush"メソッドで可能です。最初に、ユニークな識別子を指定し、キューにイベントを入れましょう。

#### イベントをキューに登録する

	Event::queue('foo', $user->id, array($user));

このメソッドには３つの引数があります。最初はキューの名前です。２番目はキューに入れるアイテムのユニークな識別子です。３つはキューのフラッシャー(flusher)に渡すデーターの配列です。

次に、"foo"キューにフラッシャーを登録します。

#### イベントフラッシャーを登録する

	Event::flusher('foo', function($key, $user)
	{
		//
	});

イベントフラッシャーは２つの引数を取ることに注意してください。最初は、キューイベントのユニークな識別子です。この場合はユーザーIDです。２つ目（残りの）引数は、そのキューイベントに対する実行アイテムです。

最後に、フラッシャーを実行し、全てのキューに溜まっているイベントを実行させるために"flush"メソッドを使用してください。

	Event::flush('foo');

<a name="laravel-events"></a>
## Laravelイベント

Laravelのコアにより、発生させられるイベントもいくつか存在します。確認してください。

#### バンドル開始時に発生するイベント

	Event::listen('laravel.started: bundle', function() {});

#### データベースクエリが実行された時に発生するイベント

	Event::listen('laravel.query', function($sql, $bindings, $time) {});

#### ブラウザにレスポンスが送信される直前に発生するイベント

	Event::listen('laravel.done', function($response) {});

#### Logクラスを用い、メッセージをログした時に発生するイベント

	Event::listen('laravel.log', function($type, $message) {});