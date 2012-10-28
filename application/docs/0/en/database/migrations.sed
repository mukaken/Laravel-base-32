s+Think of migrations as a type of version control for your database\. +データベースのバージョンコントロールを行うマイグレーションを考えてみましょう。+

s+Let's say your working on a team, and you all have local databases for development\. +あなたは開発チームにあなたも関わっていること、そしてローカル開発環境に全てを整えたことを伝えるましょう。+

s+Good ole' Eric makes a change to the database and checks in his code that uses the new column\. +エリックのやつがデータベースに変更を加え、新しく追加したカラムを使用するコードをチェックインしました。+

s+You pull in the code, and your application breaks because you don't have the new column\. +あなたはそのコードをプルし、アプリケーションは動かなくなります。だって、あなたは新しいカラムを作っていませんからね。+

s+What do you do? +どう対処しましょう？+

s+Migrations are the answer\. +マイグレーションが答えです。+

s+Let's dig in deeper to find out how to use them!+もっと深く掘り下げ、どうやって使用するか見てみましょう！+



s+Before you can run migrations, we need to do some work on your database\. +マイグレーションを始める前に、データベースに幾らかの準備を行う必要があります。+

s+Laravel uses a special table to keep track of which migrations have already run\. +Laravelは実行されたマイグレーションの記録を保持するために特別のテーブルを使用しています。+

s+To create this table, just use the Artisan command-line:+このテーブルを作成するには、Artisanコマンドラインを使うだけです。+

s+\*\*Creating the Laravel migrations table:\*\*+**Laravelマイグレーションテーブルを作成**+



s+You can easily create migrations through Laravel's "Artisan" CLI\. It looks like this:+Laravelの"Artisan"CLIを使い簡単にマイグレーションを作成できます。次のように行います：+

s+\*\*Creating a migration\*\*+マイグレーションの作成+


s+Now, check your \*\*application\/migrations\*\* folder\. +では、**application/migrations**フォルダーを調べてみましょう。+

s+You should see your brand new migration! +新しいマイグレーションが見つかるはずです！+

s+Notice that it also contains a timestamp\. +ファイル名にはタイプスタンプも含まれていることに注目してください。+

s+This allows Laravel to run your migrations in the correct order\.+これでLaravelは正しい順序でマイグレーションを実行できます。+

s+You may also create migrations for a bundle\. +また、バンドルに対してマイグレーションを作成したい場合もあるでしょう。+

s+\*\*Creating a migration for a bundle:\*\*+**バンドルのマイグレーションを作成**+


s+\*\*Running all outstanding migrations in application and bundles:\*\*+**実行されていないアプリケーションとバンドルのマイグレーションを全て実行**+

s+\*\*Running all outstanding migrations in the application:\*\*+**アプリケーションの未実行なマイグレーションを全部実行**+

s+\*\*Running all outstanding migrations in a bundle:\*\*+**バンドルの未実行なマイグレーションを全部実行**+




s+When you roll back a migration, Laravel rolls back the entire migration "operation"\. +マイグレーションをロールバックすると、Laravelはそのマイグレーション「操作」全体をロールバックします。+

s+So, if the last migration command ran 122 migrations, all 122 migrations would be rolled back\.+ですから、もし最後のマイグレーションコマンドで122個のマイグレーションを実行していたならば、その122個全部がロールバックされます。+


s+\*\*Rolling back the last migration operation:\*\*+**最後のマイグレーション操作をロールバック**+

s+\*\*Roll back all migrations that have ever run:\*\*+**まだ実行していないすべてのマイグレーションを全部ロールバック**+
