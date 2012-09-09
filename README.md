Laravel-base-32
===============

Sample and development base of Laravel ver. 3.2

Laravel ver.3.2のサンプルです。実際の動作を見ながら、コードを確認していただくために、公開します。開発のベースとして使用できるように、設定をしています。詳細は[Laravel開発ベースサンプル](http://kore1server.com/laravel-tutorial/312-laravel-32-development-base-sample.html)をご覧ください。

twitter-bootstrapブランチは、その名の通りtwitter bootstrapを使用したバージョンです。twitter bootstrapをベースに利用する場合のために、用意しました。コードがやや複雑になりますので、学習目的やbootstarpを使用しない開発のベースには、original-cssブランチをご利用ください。コードがすっきりとしており、分かりやすくなっています。

また、Masterブランチは作業中のため、動作しない場合もあります。

デモページ、エラーページを翻訳してあります。

日本語ドキュメントも同包しております。（まだ、粗訳です。最新版は、[こちら](http://laravel.kore1server.com)をご覧ください。）

IDEでの補完用コード(application/ccc.php)を用意しております。

以下のサンプルコードとして、利用していただけるでしょう。

多国語対応

Form Base Model（バンドル）の使用法

設定(config)ファイルの環境による使い分け

設定ファイルで無名関数を使用する

開発／実働環境でのエラー表示・ログの使い分け


使用しているバンドルは、デフォルトで含まれているdocs（改造してあるため、原型を留めていません）、Form Base Model（バンドル公式リポジトリーからインストールしたものです）です。

インストール方法
================

0. PHPのintl拡張を入れてください。たいていの共有サーバーであれば入っています。
1. このリポジトリをクローンするか、もしくはzipで落としてください。リポジトリはたまにしか更新しません。Laravelの最新版を使用したい方は、これをクローンするより、Laravelの最新版のlaravelディレクトリーを上書きしたほうが、大抵の場合早いです。
2. storageディレクトリー以下を書き込めるようにしてください。
3. application/configとapplication/config/local下にあるdatabase.phpを変更してください。MySQL使用の前提にして有りますが、他のストレージでも動作するでしょう。とりあえず、最初は両方とも同じ設定にしておくと、はまらないですみます。続いて、設定に合わせ、ストレージの準備を行なってください。（MySQLでしたら、DBを作成し、必要に応じユーザーを作成、権限をつけます。）
4. インストールしたディレクトリー（フォルダー）で端末（ターミナル、cmd.exeなど）を開き、`php artisan migrate:install`を実行します。
5. 続いて、`php artisan migrate`を実行します。
6. ブラウザからpublicへアクセスしてください。トップページが表示されます。
