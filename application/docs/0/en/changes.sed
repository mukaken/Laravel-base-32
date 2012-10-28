s+Fixed eager loading bug in Eloquent\.+Eloquentのeagerローディングの修正+
s+Added `laravel\.resolving` event for all IoC resolutions\.+全てのIoCの解決に対し、"laravel.resolving"イベントを追加+


s+Replace the \*\*laravel\*\* folder\.+**laravel**フォルダーを置き換え+

s+Overall improvement of Postgres support\.+Postgresサポートの全体的な改善+
s+Fix issue in SQL Server Schema grammar\.+SQLサーバースキーマ構文の問題を修正+
s+Fix issue with eager loading and `first` or `find`\.+eagerローディングの"first"と"find"の問題を修正+
s+Fix bug causing parameters to not be passed to `IoC::resolve`\.+"IoC::resolve"に引数を渡されないことで発生するバグを修正+
s+Allow the specification of hostnames in environment setup\.+環境の設定で、hostnamesの指定を行えるようにした+
s+Added `DB::last_query` method\.+"DB::last_query"メソッドの追加+
s+Added `password` option to Auth configuration\.+Auth設定で、"password"オプションを追加+

s+Fixed bug in cookie retrieval when cookie is set on same request\.+同じリクエストで設定したクッキーを取得する場合のバグを修正+
s+Fixed bug in SQL Server grammar for primary keys\.+プライマリーキーに対するSQLサーバーの構文に関するバグを修正+
s+Fixed bug in Validator on PHP 5\.4\.+PHP 5.4のバリデーターに関するバグを修正+
s+If HTTP \/ HTTPS is not specified for generated links, current protocol is used\.+リンクを生成する場合にHTTP/HTTPSを指定しない場合、現在のプロトコルを使用する+
s+Fix bug in Eloquent auth driver\.+Eloquent Authドライバーのバグ修正+
s+Added `format` method to message container\.+メッセージコンテナに"format"メソッドを追加+

s/Upgrading From \([0-9\.]\+\)/\1 からのアップグレード/

s+Speed up many to many eager loading mapping.+多対多eagerローディングのスピードアップ+
s+Tweak the Eloquent::changed() method.+Eloquent::change()メソッドの調節+
s+Various bug fixes and improvements.+多くのバグフィックスと機能向上+

s+Revert nested where code back to 3.2.3 tag.+ネストしたwhereに対するコードを3.2.3へダウングレード+

s+Fix bug in Eloquent `to_array` method.+Eloquentの`to_array`メソッドのバグ修正+
s+Fix bug in displaying of generic error page.+一般的なエラーページ表示のバグ修正+

s+Revert Blade code back to 3\.2\.3 tag\.+Bladeクラスのコードを3.2.3へダウングレード+
s+Fix double slash bug in URLs when using languages and no "index.php"\.+"index.php"を付けずに言語をURLに指定した場合、スラッシュがつながるバグを修正+
s+Fix possible security issue in Auth "remember me" cookies\.+認証の"Remember me"クッキーでセキュリティ問題となり得る部分の修正+