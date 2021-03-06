Laravel-base-32
===============

Sample and development base of Laravel ver. 3.2

### ベースバージョン

Laravel 3.2.12

Laravel ver.3.2のサンプルです。実際の動作を見ながら、コードを確認していただくために、公開します。

このオリジナルCSSブランチは、Laravelのデモに使用されているCSSをそのまま利用したもので、一番コードがすっきりしております。最初の学習目的には、一番適しています。

他にTwiiter Bootstrap使用ブランチ、Foundation使用ブランチを用意してあります。

特徴
====

* デモページ、エラーページを翻訳してあります。
* 日本語ドキュメントも同包しております。更新は遅れ気味になりますので、最新版は、[こちら](http://laravel.kore1server.com)をご覧ください。もしくは、[電子書籍版](https://leanpub.com/laravel-3-japanese)をご購入ください。
* IDEでの補完用コード(application/ccc.php)生成コマンドツールを用意しております。
* 以下のサンプルコードとして、利用していただけるでしょう。
  * オリジナルエラーページの作成
  * 多国語対応
  * Form Base Model（バンドル）の使用法
  * 設定(config)ファイルの環境による使い分け
  * 開発／実働環境でのエラー表示・ログの使い分け
  * 依存性の注入の導入例
  * バンドルの設定の変更例
* 使用しているバンドルは、デフォルトで含まれているdocs（改造してあるため、原型を留めていません）、Form Base Model（バンドル公式リポジトリーからインストールしたものです）です。Pagechachバンドルは私が作成したものですが、単純ですから、バンドル作成のひな形としても利用できます。
* 動作環境のチェックプログラムをpublicの下、checkerディレクトリーに追加してあります。インストール後にアクセスしてチェックしていただくことも可能ですし、checkerディレクトリーのみアップロードし、ホストの動作環境をチェックするためにも、使用できます。
* ブラウザの言語設定により、表示言語を設定するように機能追加してあります。application/config/application.phpの一番最初に追加したコードです。application/config/language.php設定ファイルを追加し、この中でサポート言語と、サポート言語の中にブラウザで指定してある言語が見つからない場合に使用するフォールバッグ言語を指定します
* コマンドラインツールのArtisanをブラウザ経由で実行できるようにしてあります。public/commandにアクセスしてください。これは、共有サーバーやPaSSなどを使用する場合、端末操作が許されない場合のために、付け加えました。セキュリティ的には大きな穴になりますので、実働環境では、無効にしてください。
* MarkdownをHTML変換をartisanコマンドにしてあります。コマンド作成の参考にどうぞ。

インストール方法
================

1. このリポジトリをクローンするか、もしくはzipで落としてください。コア（Laravelフォルダー）はたまにしか更新しません。Laravelの最新版を使用したい方は、自分でLaravelの最新バージョンを入手し、laravelディレクトリーを上書きしてください。
2. storageディレクトリー以下を書き込めるようにパーミッションを設定してください。
3. application/configとapplication/config/local下にあるdatabase.phpを変更してください。MySQL使用の前提にして有りますが、他のストレージでも動作するでしょう。とりあえず、最初は両方とも同じ設定にしておくと、はまらないですみます。続いて、設定に合わせ、ストレージの準備を行なってください。（MySQLでしたら、DBを作成し、必要に応じユーザーを作成、権限をつけます。）
4. インストールしたディレクトリー（フォルダー）で端末（ターミナル、cmd.exeなど）を開き、`php artisan migrate:install`を実行します。
5. 続いて、`php artisan migrate`を実行します。
6. ブラウザからpublicへアクセスしてください。トップページが表示されます。
7. <http://kore1server.com/tutorial/laravel/312-laravel-32-development-base-sample>と<http://kore1server.com/tutorial/laravel/316-development-base-bootstrap-version>を参照し、残りの設定を行なってください。
8. 初めてLaravelを使用される方は、public/checker/checker.phpへアクセスし、動作環境をチェックすることをおすすめします。PHPモジュールの不足等を確認できます。PHPモジュールは足りなくても、それを使用する機能を使用しなければ動作します。

統合環境コード補完用コード生成コマンド
======================================

統合環境では、クラスやメソッドの補完が利用できるものが多いです。しかし最近の小型フレームワークでは、統合環境よりも、テキストエディターで作成しやすくするため、クラス名の省略形を使用しています。そのため、統合環境を使用するメリットである、コードの補完が上手く働きません。

補完を行わせるため、省略名とメソッドの定義元のクラスを定義付ける、ダミーコードを利用すれば、補完を上手く行うことができます。そのダミーコードを生成するLaravelのタスクを追加してあります。

	// 生成コードを端末で確認
	php artisan ccc

	// 生成コードをapplication/ccc.phpへ保存
	php artisan ccc:save

この生成プログラムはapplication/config下に設定されてるファイル中で指定された、ドライバーの種類を元にクラスエイリアスを設定します。そのため、ドライバーの種類を変更した場合は、生成し直してください。なお、URLにより判定されるLaravelの環境は判断しておりません。configディレクトリー直下のファイル中の設定のみ、生成に利用しております。

バンドルの設定変更
==================

上手く設計されたバンドルであれば、動作の振る舞いを変更できるよう、設定がファイルになっていることでしょう。

この設定ファイルを直接変更してしまうと、バンドルをアップデートする際、上書きされる可能性があります。そのために設定を直接変更するのではなく、Laravelのイベントを利用し、変更する方法を紹介しています。

このために、サンプルのバンドルとして`sample`を作成しました。設定ファイルの内容を表示するだけのサンプルです。`application/routes.php`の中で、イベントのリスナーを登録し、設定を書き換えています。

ブラウザーから`sample-bundle'または、`sample/top`へアクセスしてください。設定ファイルの内容が表示されます。（ちなみに、このルートはバンドルのroutes.php中で定義しています。)

依存性の注入
============

Laravelには依存性注入のためにIoCコンテナクラスが用意されています。

使用サンプルとして定義の記述ファイルを`application/dependencies.php`として追加し、routes.phpの最後で読み込んでいます。

依存性の注入とはあるクラスのインスタンスを切り替え可能にすることです。Laravelを始めとするフレームワークでは、ほとんどをクラスでコーディングします。その時に他のクラスの生成をハードコードしてしまうと、呼び出し側と呼び出される側の関係が強くなってしまい、呼び出し側だけのコーディングのテストができません。さらに、呼び出すクラスを変更すると、呼び出し側のクラスのコードに手を入れることとなり、単体テストをやり直す事にもなります。

そこで呼び出される側を柔軟に切り替えられるようにする仕組みがあり、LaravelではIoCコンテナクラスとして実装されています。

当開発ベースではAppleとOrangeクラスをIoCクラスに登録し、テストする方法のサンプルを入れています。

例外メッセージ日本語化コマンド
==============================

Laravelが発生させる例外のメッセージを日本語化するコマンドです。できるだけ日本語で開発したい方、もしくはPHP教育にLaravelを使用される方などは、日本語でメッセージが表示されたほうがよろしいかと思いまして作成しました。

laravel-jaフォルダーが生成されます。オリジナルのlaravelフォルダーをlaravel-enなどにリネームし、laravel-jaをlaravelへリネームしてください。

コマンドラインのメッセージで日本語が表示できない場合、メッセージが文字化けします。コマンドラインを多用する方は、自分でPHPやコマンドラインの設定が可能な方を除き、日本語化は行わないほうがよろしいでしょう。

	// 例外メッセージ日本語置換実行
	php artisan japanize

Laravel実行環境判定
===================

多くのCMSやWebプログラムは、動作が正しく行われるか確認するためのチェッカーを用意していたり、インストールの最初に実行される仕組みになっております。

Laravelにはこのユーティリティが用意されていないため、独自に開発しました。

１．Laravelインストール前にチェックを行う

サーバーにpublic/checkerフォルダーをアップロードしてください。次にブラウザからアップしたサーバーのURLのchecker/checker.phpへアクセスしてください。結果が表示されます。

２．Laravelインストール後にチェックを行う

サーバーにこの開発ベースをアップし、設定してください。次にchecker/checker.phpもしくはpublic/checker/checker.phpにアクセスしてください。

Laravelの場合、必要なPHPエクステンションなどの説明がドキュメントに上手くまとまっていません。一応、公式ドキュメントで動作に必要だと明記されている項目は赤字、明記されていないが必要に応じインストールすべきものは黄色（茶色）で表示しています。ただし、赤で表示される項目であっても、それを使用する機能を使用しない場合は、インストールされていなくても動作します。例えば、認証や暗号化、セッションなどを使用せず、表示だけを行うサイトであれば、動作要件に指定されているMcryptさえなくても動作します。あくまで、どの機能を使用するかを考慮して、判断してください。

ユニットテストの強化
====================

Laravelのコマンドラインを利用してテストする場合、次の利点があります。

* 自動的にブートストラップコードを読み込むため、テストコードはLaravelの環境で実行される。余計なincludeを行う必要はない。

逆に欠点は以下のとおりです。

* phpunitの機能が十分に使用できない。例えば：
  * ファイル名が.test.phpと固定される。
  * スケルトンジェネレーターが生成するファイルの命名規則と異なるため、いちいち名前を変更しなくてはならない。
  * 便利なカバーレージツールなどが使えない。

LaravelのコマンドラインArtisanからPHPUnitを実行しても、機能を十分に生かせませんし、不便な部分が多いですから、直接phpunitで実行しましょう。そのために、以降の変更がしてあります。

phpunitの環境ファイルphpunit.xmlをルートへ追加してあります。これによりコマンドラインのパラメーターを指定せずとも"phpunit"を実行すれば、テストが実行されます。artisanを利用してテストするより、簡単で柔軟性があります。

xmlファイルを読んでいただけば、設定内容は一目瞭然です。コメントも入れてあります。

多少注意が必要なのは、directoryのsufiixの指定です。これによりテストを記述しているファイルのサフィックスを指定してあります。スケルトンジェネレータが生成する"Test.php"に設定してあります。もし、Laravelのテストファイルの命名規則と合わせたい場合は".test.php"に変更してください。

設定ファイル中ではカバーレージの対象も設定してありますが、テストのみの目的であれば、指定をしなくても動作します。

NetBeansで実行する場合、プロジェクトのPHPUnitの項目で、「XML構成の使用」にチェックを入れ、このファイルを指定してもらうと、ブートストラップの設定とカバーレージ範囲も指定されるので、大変便利です。
このテスト環境では、テストの速度を上げるため、SQLiteを使用しています。現状SchemaクラスがSQLiteの外部束縛生成に対応していません。SQLiteはテーブル生成時にしか外部キーの指定は出来ないのですが、Schemaクラスは、一度作成したテーブルに追加する形式でしか指定ができないためです。そのため、外部束縛を利用するテーブルに関連する単体テストでは、速度を上げるためのSQlite使用を諦め、別のDBシステムをご利用ください。

NetBeansでPHPUnitを使用する場合
===============================

２つの方法があります。

### １．上記のように「XML構成の使用」に設定ファイルを指定する。

カバーレージの範囲なども細かく指定できるため、これが一番良い方法だと思われます。

### ２．ブートストラップを指定する

カバーレージを使用せず、テストだけが行えれば良い場合、ブートストラップコードをプロジェクトのプロパティ、PHPUnitの設定項目から指定することで、NetBeans上からテストを実行できます。

ブートストラップコードは、laravel/cli/tasks/test/phpunit.phpになります。ただし、NetBeansでこれを直接指定してもエラーになるため、プロジェクトのトップページ、artisanコマンドラインツールが存在するディレクトリーにコピーし、それを指定することでエラーを回避することが可能です。

この方法の利点は、phpunitだけでなく、スケルトンジェネレーターにもブートストラップコードを指定できることですが、NetBeans7.2ではまだうまく対応できておらず、しかもスケルトンジェネレーター自身がLaravelのブートストラップを指定するとエラーを起こすため使用できません。お互いのオートローダーが干渉するようです。
NetNetBeans7.3ではスケルトンジェネレーターにブートストラップをきちんと渡すようになりますので、スケルトンジェネレーターが改善されれば、上手く動作するようになるでしょう。

テスト環境
==========

Laravelではテスト環境をドメインや環境変数から決定します。これを利用し'test'環境を構築してあります。テストのための参考としてご利用ください。

1. phpunit.xmlで環境変数LARAVEL_ENVを'test'に設定しています。この環境変数はLaravelの実行環境を切り替えのために予め用意されているものです。
2. paths.php中で'test'環境を設定しています。通常はURLで切り替えられるように、配列で指定しますが、テスト環境は環境変数LARAVEL_ENVのみで切り替えるため、URLの配列には空文字列を指定しています。
3. configディレクトリーにtestディレクトリーを作成し、そこでセッションcとキャッシュにテスト用ドライバーの'memory'を指定してあります。これは本当のドライバーの代わりにPHPの配列で値を保持しますので、高速にテストが行われます。
4. [Laravelフォーラムに投稿されたテストに関するポスト](http://forums.laravel.com/viewtopic.php?id=2521)の内容を利用し、以下の設定を行なっております。
5. testディレクトリーでデータベースをsqliteのメモリー使用に設定してあります。DBを利用するテストの高速化のためです。
6. テストのためのヘルパーをlibraries/test/helper.phpを用意しました。これは上記のポストに書かれているコードのコメントを日本語化したものです。マイグレーションとセッションの使用宣言を行います。（ポストのルーティングに関してはまだよく見ていません。）
7. 上記ポストに従いUserモデルを変更しました。セッターを使用するようにし、コメントを日本語化しております。
8. Userモデルに対するテストをapplication/tests/application/models/userTest.phpに書きました。上記ポストの内容を元に作成し、コメントを日本語化したものです。テストヘルパーの使用法が理解できるでしょう。

これを利用しなくても、PHPUnitにはDBのテストのための優れた仕組みが用意されていますので、ドキュメントを参考に、お好きな方法でテストしてください。

多言語の対応
============

ドキュメントに記述されていませんがURLに言語を指定することで、デフォルトを切り替える機能がLaravelに追加されています。URLの最初の項目に言語コードを指定することで、切り替える事ができます。

http://localhost/en/sample // 英語に切り替わる
http://localhost/fr/sample // フランス語に切り替わる

どの言語に切り替え可能にするかは、application/config/application.phpのlanguages（複数形）に配列で指定します。

この機能が取り込まれるに先立ち、application/config/application.phpの先頭に、ブラウザの言語設定でデフォルト言語を切り替えるコードを追加てあります。URLで切り替えるのはおしゃれでありませんからね。

この追加機能の設定ファイルは、application/config/language.phpです。対応する言語と、ブラウザの設定言語が対応言語にない場合に表示するデフォルト言語を指定します。

Makrdown変換ツール
==================

Laravelのドキュメントバンドル(docs)はPHP Markdown Extraをライブラリーとして使用しています。これを利用し、markdownファイルをHTMLファイルに変換するコマンドをArtisanを使用し作成しました。

単純な仕組みですので、コマンドを作成する場合の参考になるでしょう。

また、生成内容を自由に変更できるため、自分の状況にあったCSSを指定したり、ビューを使用し生成したりが可能です。

    php artisan markdown Input-markdownファイル名 Output-HTMLファイル名

これを利用し、ブラウザに内容を表示するbashスクリプトもトップフォルダーに用意してあります。実行パスが通っているディレクトリーにコピーし、エディターで開き、Artisanへのフルパスを設定してください。それと、一時ファイルを作成しますので、そのファイルも必要があればパスを変更してください。使用ブラウザもご利用のものに変更しましょう。

    markdown ファイル名

とすると、変換結果がブラウザに表示されます。

コードをドキュメントルートから外すツール
========================================

`laravel3-code-unite`は、Laravel3のコード部分をドキュメントルートから外すディレクトリー構成にするためのシェルツールです。これによりサーバー設定ミスから、コードを晒してしまう危険を防ぎます。

複数サイトを運営する場合でもコアを共通に使用するようにします。そのため、アップデートが楽になります。

[詳しい仕様方法の記事](http://kore1server.com/49/Laravel3%E3%80%81%E3%82%B3%E3%83%BC%E3%83%89%E3%82%92%E3%83%89%E3%82%AD%E3%83%A5%E3%83%A1%E3%83%B3%E3%83%88%E3%83%AB%E3%83%BC%E3%83%88%E3%81%8B%E3%82%89%E5%A4%96%E3%81%99)を用意しています。ご覧になってください。

