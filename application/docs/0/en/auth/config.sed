s+Most interactive applications have the ability for users to login and logout\. +ほとんどの対話型アプリケーションはユーザーをログイン／ログアウトさせます。+

s+Laravel provides a simple class to help you validate user credentials and retrieve information about the current user of your application\.+Laravelはユーザー認証し、現在のユーザーに関する情報を取得できるシンプルなクラスを提供しています。+

s+To get started, let's look over the \*\*application\/config\/auth\.php\*\* file\. +初めましょう。**application/config/auto.php**をご覧ください。+

s+The authentication configuration contains some basic options to help you get started with authentication\.+認証設定は認証を使い始めるのに役に立つ基本的なオプションで構成されています。+




s+Laravel's authentication is driver based, meaning the responsibility for retrieving users during authentication is delegated to various "drivers"\. +Laravelの認証はドライバーベースです。これが意味するのは、認証するユーザーの取得に関する責任は、各種の「ドライバー」に任されているということです。+

s+Two are included out of the box: Eloquent and Fluent, but you are free to write your own drivers if needed!+EloquentとFluentは最初から用意されていますが、必要であれば自分でドライバーを自由に書いてください！+

s+The \*\*Eloquent\*\* driver uses the Eloquent ORM to load the users of your application, and is the default authentication driver\. +**Eloquent**ドライバーはEloquent ORMをユーザー情報の取得に使用し、デフォルトになっています。+

s+The \*\*Fluent\*\* driver uses the fluent query builder to load your users\.+**Fluent**ドライバーはFluentクエリビルダーをユーザー情報の取得に使用します。+



s+The second option in the configuration file determines the default "username" of your users\. +設定ファイル中、２つ目のオプションはユーザーのデフォルト「ユーザー名」を元に決定するかです。+

s+This will typically correspond to a database column in your "users" table, and will usually be "email" or "username"\.+典型的にはデータベースの"users"テーブル中のカラムで、通常は"email"か"username"でしょう。+




s+When using the \*\*Eloquent\*\* authentication driver, this option determines the Eloquent model that should be used when loading users\.+**Eloquent**認証ドライバーを使用する場合、このオプションはユーザーを読み込む際に使用するEloquentモデルを決めます。+




s+When using the \*\*Fluent\*\* authentication drivers, this option determines the database table containing the users of your application\.+**Fluent**認証ドライバーを使用する場合、このオプションは、アプリケーションのユーザーを構成するデータベーステーブルを決めます。+
