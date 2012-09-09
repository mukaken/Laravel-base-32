# タスク

## 内容

- [基本](#the-basics)
- [タスクの作成と実行](#creating-tasks)
- [バンドルタスク](#bundle-tasks)
- [CLIオプション](#cli-options)

<a name="the-basics"></a>
## 基本

LaravelのコマンドラインツールはArtisanです。Artisan can be used to run "tasks" such as migrations, cronjobs, unit-tests, or anything that want.

<a name="creating-tasks"></a>
## タスクの作成と実行

タスクを作成するには、**application/tasks**ディレクトリーに新しいクラスを書きます。クラスの名前はサフィックスとして"_Task"を付け、"run"メソッドを含まなくてはなりません。このように：

#### タスククラスの生成

	class Notify_Task {

		public function run($arguments)
		{
			// 素晴らしいことを知らせる……
		}

	}

それから、コマンドラインでタスクのメソッドを"run"するために呼び出します。引数も渡せます

#### コマンドラインからタスクを呼び出す

	php artisan notify

#### 引数を渡し、タスクを呼び出す

	php artisan notify taylor

#### アプリケーションからタスクを呼び出す

	Command::run(array('notify'));

#### 引数をつけ、アプリケーションからタスクを呼び出す

	Command::run(array('notify', 'taylor'));

タスクに存在する特定のメソッドを呼び出せることを覚えておいてください。Notifyタスクにurgentメソッドを追加しましょう。

#### タスクにメソッドを追加

	class Notify_Task {

		public function run($arguments)
		{
			// 素晴らしいことを知らせる……
		}

		public function urgent($arguments)
		{
			// これは緊急だ！
		}

	}

これで"urgent"メソッドを呼び出せます。

#### タスクの特定メソッドを呼び出す

	php artisan notify:urgent

<a name="bundle-tasks"></a>
## バンドルタスク

バンドルにタスクを作成するには、クラス名の先頭にタスク名を付けます。ですから、バンドル名が"admin"でしたら、タスクはこんなふうになるでしょう。

#### バンドルに所属するタスクを作成

	class Admin_Generate_Task {

		public function run($arguments)
		{
			// adminを作成！
		}

	}

タスクを実行するには、いつもどおり二重のコロン構文でバンドルを指定します。

#### バンドル所属のタスクを実行

	php artisan admin::generate

#### バンドルに所属するタスクの中の、特定メソッドを実行

	php artisan admin::generate:list

<a name="cli-options"></a>
## CLIオプション

#### Laravel環境を設定

	php artisan foo --env=local

#### デフォルトデータベース接続を設定

	php artisan foo --database=sqlite
