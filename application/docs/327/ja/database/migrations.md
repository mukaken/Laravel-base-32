# マイグレーション

## 内容

- [基本](#the-basics)
- [データベースの準備](#prepping-your-database)
- [マイグレーションの作成](#creating-migrations)
- [マイグレーションの実行](#running-migrations)
- [ロールバック](#rolling-back)

<a name="the-basics"></a>
## 基本

データベースのバージョンコントロールを行うマイグレーションを考えてみましょう。あなたは開発チームにあなたも関わっていること、そしてローカル開発環境に全てを整えたことを伝えるましょう。エリックのやつがデータベースに変更を加え、新しく追加したカラムを使用するコードをチェックインしました。あなたはそのコードをプルし、アプリケーションは動かなくなります。だって、あなたは新しいカラムを作っていませんからね。どう対処しましょう？マイグレーションが答えです。もっと深く掘り下げ、どうやって使用するか見てみましょう！

<a name="prepping-your-database"></a>
## データベースの準備

マイグレーションを始める前に、データベースに幾らかの準備を行う必要があります。Laravelは実行されたマイグレーションの記録を保持するために特別のテーブルを使用しています。このテーブルを作成するには、Artisanコマンドラインを使うだけです。

**Laravelマイグレーションテーブルを作成**

	php artisan migrate:install

<a name="creating-migrations"></a>
## マイグレーションの作成

Laravelの"Artisan"CLIを使い簡単にマイグレーションを作成できます。次のように行います：

マイグレーションの作成

	php artisan migrate:make create_users_table

では、**application/migrations**フォルダーを調べてみましょう。新しいマイグレーションが見つかるはずです！ファイル名にはタイプスタンプも含まれていることに注目してください。これでLaravelは正しい順序でマイグレーションを実行できます。

また、バンドルに対してマイグレーションを作成したい場合もあるでしょう。

**バンドルのマイグレーションを作成**

	php artisan migrate:make bundle::create_users_table

*参照：*

- [スキーマビルダー](/docs/database/schema)

<a name="running-migrations"></a>
## マイグレーションの実行

**実行されていないアプリケーションとバンドルのマイグレーションを全て実行**

	php artisan migrate

**アプリケーションの未実行なマイグレーションを全部実行**

	php artisan migrate application

**バンドルの未実行なマイグレーションを全部実行**

	php artisan migrate bundle

<a name="rolling-back"></a>
## ロールバック

マイグレーションをロールバックすると、Laravelはそのマイグレーション「操作」全体をロールバックします。ですから、もし最後のマイグレーションコマンドで122個のマイグレーションを実行していたならば、その122個全部がロールバックされます。

**最後のマイグレーション操作をロールバック**

	php artisan migrate:rollback

**まだ実行していないすべてのマイグレーションを全部ロールバック**

	php artisan migrate:reset