Laravel-base-32
===============

Sample and development base of Laravel ver. 3.2

### twitter-bootstrapバージョン

Laravel 3.2.10

Laravel ver.3.2のサンプルです。実際の動作を見ながら、コードを確認していただくために、公開します。開発のベースとして使用できるように、設定をしています。詳細は[Laravel開発ベースサンプル](http://kore1server.com/laravel-tutorial/312-laravel-32-development-base-sample.html)をご覧ください。

twitter-bootstrapブランチは、その名の通りtwitter bootstrapを使用したバージョンです。twitter bootstrapをベースに利用する場合のために、用意しました。コードがやや複雑になりますので、学習目的やbootstarpを使用しない開発のベースには、original-cssブランチをご利用ください。コードがすっきりとしており、分かりやすくなっています。

また、Masterブランチは作業中のため、動作しない場合もあります。

特徴
====

* デモページ、エラーページを翻訳してあります。
* 日本語ドキュメントも同包しております。更新は遅れ気味になりますので、最新版は、[こちら](http://laravel.kore1server.com)をご覧ください。もしくは、電子書籍版をご購入ください。
* IDEでの補完用コード(application/ccc.php)を用意しております。
*以下のサンプルコードとして、利用していただけるでしょう。
  * 多国語対応
  * Form Base Model（バンドル）の使用法
  * 設定(config)ファイルの環境による使い分け
  * 設定ファイルで無名関数を使用する
  * 開発／実働環境でのエラー表示・ログの使い分け
* 使用しているバンドルは、デフォルトで含まれているdocs（改造してあるため、原型を留めていません）、Form Base Model（バンドル公式リポジトリーからインストールしたものです）です。Pagechachバンドルは私が作成したものですが、単純ですから、バンドル作成のひな形としても利用できます。
* 動作環境のチェックプログラムをpublicの下、checkerディレクトリーに追加してあります。インストール後にアクセスしてチェックしていただくことも可能ですし、checkerディレクトリーのみアップロードし、ホストの動作環境をチェックするためにも、使用できます。
* ブラウザの言語設定により、表示言語を設定するように変更してあります。application/config/application.phpの一番最初に追加したコードです。application/config/language.php設定ファイルを追加し、この中でサポート言語と、サポート言語の中にブラウザで指定してある言語が見つからない場合に使用するフォールバッグ言語を指定します。
* コマンドラインツールのArtisanをブラウザ経由で実行できるようにしてあります。public/commandにアクセスしてください。これは、共有サーバーやPaSSなどを使用する場合、端末操作が許されない場合のために、付け加えました。セキュリティ的には大きな穴になりますので、実働環境では、無効にしてください。

インストール方法
================

1. このリポジトリをクローンするか、もしくはzipで落としてください。リポジトリはたまにしか更新しません。Laravelの最新版を使用したい方は、これをクローンするより、Laravelの最新版のlaravelディレクトリーを上書きしたほうが、大抵の場合早いです。
2. storageディレクトリー以下を書き込めるようにしてください。
3. application/configとapplication/config/local下にあるdatabase.phpを変更してください。MySQL使用の前提にして有りますが、他のストレージでも動作するでしょう。とりあえず、最初は両方とも同じ設定にしておくと、はまらないですみます。続いて、設定に合わせ、ストレージの準備を行なってください。（MySQLでしたら、DBを作成し、必要に応じユーザーを作成、権限をつけます。）
4. インストールしたディレクトリー（フォルダー）で端末（ターミナル、cmd.exeなど）を開き、`php artisan migrate:install`を実行します。
5. 続いて、`php artisan migrate`を実行します。
6. ブラウザからpublicへアクセスしてください。トップページが表示されます。
7. <http://kore1server.com/tutorial/laravel/312-laravel-32-development-base-sample>と<http://kore1server.com/tutorial/laravel/316-development-base-bootstrap-version>を参照し、残りの設定を行なってください。
8. 初めてLaravelを使用される方は、public/checker/checker.phpへアクセスし、動作環境をチェックすることをおすすめします。PHPモジュールの不足等を確認できます。PHPモジュールは足りなくても、それを使用する機能を使用しなければ動作します。
