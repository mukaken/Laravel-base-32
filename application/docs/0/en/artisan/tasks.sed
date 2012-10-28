s+Laravel's command-line tool is called Artisan\. +LaravelのコマンドラインツールはArtisanです。+

s+Artisan can be used to run "tasks" such as migrations, cronjobs, unit-tests, or anything that want\. +Artisanでマイグレーション、クーロンジョブ、ユニットテストなどの「タスク」をなんでも実行できます。+

s+Creating a task class:+タスククラスの生成+


s+To create a task create a new class in your \*\*application\/tasks\*\* directory\. +タスクを作成するには、**application/tasks**ディレクトリーに新しいクラスを書きます。+

s+The class name should be suffixed with "_Task", and should at least have a "run" method, like this:+クラスの名前はサフィックスとして"_Task"を付け、"run"メソッドを含まなくてはなりません。このように：+

s+Do awesome notifying\.\.\.+素晴らしいことを知らせる……+


s+Now you can call the "run" method of your task via the command-line\. +それから、コマンドラインでタスクのメソッドを"run"するために呼び出します。+

s+You can even pass arguments:+引数も渡せます+

s+Calling a task from the command line:+コマンドラインからタスクを呼び出す+

s+Calling a task and passing arguments:+引数を渡し、タスクを呼び出す+

s+Remember, you can call specific methods on your task, so, let's add an "urgent" method to the notify task:+タスクに存在する特定のメソッドを呼び出せることを覚えておいてください。Notifyタスクにurgentメソッドを追加しましょう。+

s+Adding a method to the task:+タスクにメソッドを追加+

s+This is urgent!+これは緊急だ！+

s+Now we can call our "urgent" method:+これで"urgent"メソッドを呼び出せます。+

s+Calling a specific method on a task:+タスクの特定メソッドを呼び出す+




s+To create a task for your bundle just prefix the bundle name to the class name of your task\. +バンドルにタスクを作成するには、クラス名の先頭にタスク名を付けます。+

s+So, if your bundle was named "admin", a task might look like this:+ですから、バンドル名が"admin"でしたら、タスクはこんなふうになるでしょう。+

s+Creating a task class that belongs to a bundle:+バンドルに所属するタスクを作成+

s+To run your task just use the usual Laravel double-colon syntax to indicate the bundle:+タスクを実行するには、いつもどおり二重のコロン構文でバンドルを指定します。+

s+Running a task belonging to a bundle:+バンドル所属のタスクを実行+


s+Running a specific method on a task belonging to a bundle:+バンドルに所属するタスクの中の、特定メソッドを実行+




s+Setting the Laravel environment:+Laravel環境を設定+

s+Setting the default database connection:+デフォルトデータベース接続を設定+


s+Generate the admin!+adminを作成！+


s+Calling a task from your application:+アプリケーションからタスクを呼び出す+

s+Calling a task from your application with arguements:+引数をつけ、アプリケーションからタスクを呼び出す+