s+All of the configuration options regarding errors and logging live in the \*\*application\/config\/errors\.php\*\* file\. +エラーとログに関する設定オプションはすべて、**application/config/errors.php**にあります。+

s+Let's jump right in\.+早速、見てみましょう。+

s+Ignored Errors+エラーを無視する+

s+The \*\*ignore\*\* option contains an array of error levels that should be ignored by Laravel\. +**ignore**オプションはLaravelにより、無視されるエラーレベルを配列で指定します。+

s+By "ignored", we mean that we won't stop execution of the script on these errors\. +「無視する(ignore)」ことで、それらのエラーが発生しても、スクリプトの実行を止めません。+

s+However, they will be logged when logging is enabled\.+しかし、ログが有効になっていれば、ログに残されます。+

s+Error Detail+エラー詳細+

s+The \*\*detail\*\* option indicates if the framework should display the error message and stack trace when an error occurs\. For development, you will want this to be \*\*true\*\*\. +**detail**オプションで、エラーが発生した時にエラーメッセージとスタックトレースを表示するかをフレームワークに指示します。開発時は、**true**にしておきましょう。+

s+However, in a production environment, set this to \*\*false\*\*\. +ですが、実機環境では**false**にセットします。+

s+When disabled, the view located in \*\*application\/views\/error\/500\.php\*\* will be displayed, which contains a generic error message\.+falseの時は、一般的なエラーメッセージの内容である**application/views/error/500.php**にあるビューが表示されます。+


s+To enable logging, set the \*\*log\*\* option in the error configuration to "true"\. +ログを有効にするためには、error設定の中の**log**オプションを"true"にセットします。+

s+When enabled, the Closure defined by the \*\*logger\*\* configuration item will be executed when an error occurs\. +有効にすると、エラー発生時に、**logger**設定アイテムで定義されている無名関数が実行されます。+

s+This gives you total flexibility in how the error should be logged\. +これにより、どのようにエラーをログするかをとても柔軟に取り扱えます。+
s+You can even e-mail the errors to your development team!+そのエラーを開発チームにメールで送信することもできます！+

s+By default, logs are stored in the \*\*storage/logs\*\* directory, and a new log file is created for each day\.+デフォルトでは、ログは**strage/logs**ディレクトリーに保存され、毎日新しいログファイルが作成されます。+

s+This keeps your log files from getting crowded with too many messages\.+これでログファイルが、余りに込み入ってしまうことを防ぎます。+

s+Sometimes you may wish to use Laravel's \*\*Log\*\* class for debugging, or just to log informational messages\. Here's how to use it:+時には、Laravelの**log**クラスをデバッグや、もしくはただ情報メッセージを取り扱うのに使いたい場合もあるでしょう。+

s+Writing a message to the logs:+ログにメッセージを書く+

s+Using magic methods to specify the log message type:+ログメッセージタイプを指定するためにマジックメソッドを使う+
