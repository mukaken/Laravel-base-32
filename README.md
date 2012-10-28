Laravel-base-32
===============

Sample and development base of Laravel ver. 3.2

### Fundation バージョン

Laravel 3.2.7

Laravel ver.3.2のサンプルです。実際の動作を見ながら、コードを確認していただくために、公開します。開発のベースとして使用できるように、設定をしています。詳細は[Laravel開発ベースサンプル](http://kore1server.com/laravel-tutorial/312-laravel-32-development-base-sample.html)をご覧ください。

このfundationブランチはCSSフレームワークのFundationを組み込んだバージョンです。一般的な用途やLaravelの学習にはoriginal-cssバージョンをご利用ください。コードがすっきりとして見やすくなっています。
他にtwitter-bootstrapブランチもあります。その名の通りtwitter bootstrapを使用したバージョンです。
また、Masterブランチは開発中のブランチのため、動作しないことがあります。

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

インストール方法
================

0. PHPのintl拡張を入れてください。たいていの共有サーバーであれば入っています。
1. このリポジトリをクローンするか、もしくはzipで落としてください。リポジトリはたまにしか更新しません。Laravelの最新版を使用したい方は、これをクローンするより、Laravelの最新版のlaravelディレクトリーを上書きしたほうが、大抵の場合早いです。
2. storageディレクトリー以下を書き込めるようにしてください。
3. application/configとapplication/config/local下にあるdatabase.phpを変更してください。MySQL使用の前提にして有りますが、他のストレージでも動作するでしょう。とりあえず、最初は両方とも同じ設定にしておくと、はまらないですみます。続いて、設定に合わせ、ストレージの準備を行なってください。（MySQLでしたら、DBを作成し、必要に応じユーザーを作成、権限をつけます。）
4. インストールしたディレクトリー（フォルダー）で端末（ターミナル、cmd.exeなど）を開き、`php artisan migrate:install`を実行します。
5. 続いて、`php artisan migrate`を実行します。
6. ブラウザからpublicへアクセスしてください。トップページが表示されます。
7. <http://kore1server.com/tutorial/laravel/312-laravel-32-development-base-sample>と<http://kore1server.com/tutorial/laravel/316-development-base-bootstrap-version>を参照し、残りの設定を行なってください。
