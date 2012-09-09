# エラーとログ

## 内容

- [基本設定](#basic-configuration)
- [ログ](#logging)
- [Loggerクラス](#the-logger-class)

<a name="basic-configuration"></a>
## 基本設定

エラーとログに関する設定オプションはすべて、**application/config/errors.php**にあります。早速、見てみましょう。

### エラーを無視する

**ignore**オプションはLaravelにより、無視されるエラーレベルを配列で指定します。「無視する(ignore)」ことで、それらのエラーが発生しても、スクリプトの実行を止めません。しかし、ログが有効になっていれば、ログに残されます。

### エラー詳細

**detail**オプションで、エラーが発生した時にエラーメッセージとスタックトレースを表示するかをフレームワークに指示します。開発時は、**true**にしておきましょう。ですが、実機環境では**false**にセットします。falseの時は、一般的なエラーメッセージの内容である**application/views/error/500.php**にあるビューが表示されます。

<a name="logging"></a>
## ログ

ログを有効にするためには、error設定の中の**log**オプションを"true"にセットします。有効にすると、エラー発生時に、**logger**設定アイテムで定義されている無名関数が実行されます。これにより、どのようにエラーをログするかをとても柔軟に取り扱えます。そのエラーを開発チームにメールで送信することもできます！

デフォルトでは、ログは**strage/logs**ディレクトリーに保存され、毎日新しいログファイルが作成されます。 これでログファイルが、余りに込み入ってしまうことを防ぎます。

<a name="the-logger-class"></a>
## Loggerクラス

時には、Laravelの**log**クラスをデバッグや、もしくはただ情報メッセージを取り扱うのに使いたい場合もあるでしょう。

#### ログにメッセージを書く

	Log::write('info', 'This is just an informational message!');

#### ログメッセージタイプを指定するためにマジックメソッドを使う

	Log::info('This is just an informational message!');