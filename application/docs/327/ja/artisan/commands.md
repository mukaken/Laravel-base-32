# Artisanコマンド

## 内容

- [ヘルプ](#help)
- [アプリケーション設定](#application-configuration)
- [セッション](#sessions)
- [マイグレーション](#migrations)
- [バンドル](#bundles)
- [タスク](#tasks)
- [ユニットテスト](#unit-tests)
- [ルーティング](#routing)
- [アプリケーションキー](#keys)
- [CLIオプション](#cli-options)

<a name="help"></a>
## ヘルプ

説明  | コマンド
------------- | -------------
使用可能なArtisanのコマンドを表示する | `php artisan help:commands`

<a name="application-configuration"></a>
## アプリケーション設定 <small>[(追加情報)](/docs/install#basic-configuration)</small>

説明  | コマンド
------------- | -------------
セキュアーなアプリケーションキーを生成**config/application.php**のapplication keyが空文字列の場合、キーを生成する| `php artisan key:generate`

<a name="sessions"></a>
## データベースセッション <small>[(追加情報)](/docs/session/config#database)</small>

説明  | コマンド
------------- | -------------
セッションテーブルの生成  | `php artisan session:table`

<a name="migrations"></a>
## マイグレーション <small>[(追加情報)](/docs/database/migrations)</small>

説明  | コマンド
------------- | -------------
Laravelマイグレーションテーブルを生成  | `php artisan migrate:install`
マイグレーションを生成  | `php artisan migrate:make create_users_table`
バンドルのマイグレーションを生成  |  `php artisan migrate:make bundle::tablename`
未実行のマイグレーションを実施  |  `php artisan migrate`
アプリケーションの未実行なマイグレーションを実施 |  `php artisan migrate application`
バンドルの未実行なマイグレーションを実施  |  `php artisan migrate bundle`
最後のマイグレーション操作をロールバック | `php artisan migrate:rollback`
今まで実行した全てのマイグレーションをロールバック  |  `php artisan migrate:reset`

<a name="bundles"></a>
## バンドル <small>[(追加情報)](/docs/bundles)</small>

説明  | コマンド
------------- | -------------
バンドルをインストール  |  `php artisan bundle:install eloquent`
バンドルをアップデート  |  `php artisan bundle:upgrade eloquent`
全てのバンドルをアップデート | `php artisan bundle:upgrade`
バンドルのアセットを公開 | `php artisan bundle:publish bundle_name`
全てのバンドルのアセットを公開 | `php artisan bundle:publish`

<br>
> インスール後には、[バンドルの登録](/docs/bundles#registering-bundles)が必要です。

<a name="tasks"></a>
## タスク <small>[(追加情報)](/docs/artisan/tasks)</small>

説明  | コマンド
------------- | -------------
タスクの呼び出し  |  `php artisan notify`
引数を渡し、タスクの実行  |  `php artisan notify taylor`
タスクの特定なメソッドを実行  |  `php artisan notify:urgent`
バンドルのタスクを実行 | `php artisan admin::generate`
バンドルの特定メソッドを実行  |  `php artisan admin::generate:list`

<a name="unit-tests"></a>
## ユニットテスト <small>[(追加情報)](/docs/testing)</small>

説明  | コマンド
------------- | -------------
アプリケーションのテストを実行  |  `php artisan test`
バンドルのテストを実行  |  `php artisan test bundle-name`

<a name="routing"></a>
## ルーティング <small>[(追加情報)](/docs/routing)</small>

説明  | コマンド
------------- | -------------
ルートを呼び出す  |  `php artisan route:call get api/user/1`

<br>
> **注目：**getをpost、put、delete、その他なんでも置き換えられます。

<a name="keys"></a>
## アプリケーションキー

説明  | コマンド
------------- | -------------
アプリケーションキーを生成  |  `php artisan key:generate`

<br>
> 違った長さをコマンドの追加引数で渡すこともできます。

<a name="cli-options"></a>
## CLIオプション

説明  | コマンド
------------- | -------------
Laravelの環境をセットする  |  `php artisan foo --env=local`
デフォルトのデータベース接続をセットする  |  `php artisan foo --database=sqlitename`
