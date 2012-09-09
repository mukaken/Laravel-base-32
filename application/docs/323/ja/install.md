# インストールと準備

## 内容

- [動作要件](#requirements)
- [インストール](#installation)
- [基本設定](#basic-configuration)
- [環境](#environments)
- [クリーンURL](#cleaner-urls)

<a name="requirements"></a>
## 動作要件

- Apacheかnginx、もしくは他の互換性のあるWebサーバー
- LaravelはPHP 5.3で導入されたパワフルで有益な機能を使用しています。最低でもPHP 5.3が必要です。
- Laravelは[FileInfoライブラリー](http://php.net/manual/ja/book.fileinfo.php) をファイルのmimeタイプを判断するために使用しています。これはデフォルトでPHP5.3に含まれています。しかしながら、WindowsユーザーはFileinfoモジュールを有効にするために、php.iniに一行書き加える必要があります。もっと詳しく知るために、次のリンクを参照してください。[PHP.net：インストール／設定の詳細](http://php.net/manual/ja/fileinfo.installation.php)
-  Laravelは[Mcryptライブラリー](http://php.net/manual/ja/book.mcrypt.php)を暗号とハッシュの生成に使用しています。 Mcryptは通常プリインストールされています。もしphpinfo()の出力にMcryptが見つからない時には、あなたのLAMPインストールのベンダーサイトを参照するか、[PHP.net：インストール／設定の詳細](http://php.net/manual/ja/book.mcrypt.php)を御覧ください。

<a name="installation"></a>
## インストール

1. [Laravelをダウンロード](http://laravel.com/download)する
2. Laravel圧縮ファイルを解凍し、コンテンツをWebサーバーにアップロードする
3. **config/application.php**ファイルの**key**オプションに、でたらめな３２文字の値をセットする
4. ブラウザでアプリケーションにアクセスする

全てを上手くやれば、Laravelの可愛いスプラッシュページが表示されるでしょう。準備をしてください。まだまだ多くのことを学ばなくてはなりません。

### 追加の機能

Laravelの利便性を完全に利用するために、以下の機能もインストールすることができます。しかし、必要ではありません。

- SQLite、MySQL、PostgreSQL、もしくはSQLサーバーPDOドライバー
- MemcachedかAPC

### 問題ですか？

もし、何か問題があれば、以下を試してください。

- **public**ディレクトリーがWebサーバーのドキュメントルートになっているのを確認する
- mod_rewriteを使用しているなら、**applicaton/config/application.php**にある**index**オプションに空文字列を指定する

<a name="basic-configuration"></a>
## 基本設定

提供されている設定ファイルは全てapplicationの下のconfigディレクトリに設置されています。どんなオプションが使用できるのか、基本的に理解するため、設定ファイルに目を通しておくことをお勧めします。applicatoin/config/application.phpファイルに基本的なアプリケーションに対するオプションが集まっているため、特に注目してください。

**非常に**重要なのは、サイトを公開する前に**application key**オプションを変更することです。このキーはフレームワーク全体を通じて暗号化やハッシュ、その他に利用されます。これは**config/application.php**ファイルの中にあり、でたらめな３２文字の文字列を指定してください。 標準準拠のアプリケーションキーはArtisanコマンドラインユーティリティーを使用し、自動的に生成できます。詳細は[Artisanコマンドインデックス](/docs/artisan/commands)を御覧ください。

> mod_rewriteを使用している場合は、indexオプションに空文字列をセットしてください。

<a name="environments"></a>
## 環境

ほとんどの場合、ローカル環境で指定するオプションと、実働サーバーで設定するオプションは異なっているでしょう。 LaravelはURLベースでデフォルトの環境を決めるメカニズムになっています。Lravelをインストールしたルートにある、"paths.php"を開いてください。次のような配列が存在しています。

	$environments = array(

		'local' => array('http://localhost*', '*.dev'),

	);

コードが示しているのは、Laravelは"locahost"で始まるURL、もしくは".dev"で終わるURLであるならば、「ローカル」環境であると考えるということです。

次に、application/coinfig/localディレクトリーを作成してください。このディレクトリーに置かれたファイルと、その中のオプションは、ベースとなる**application/coinfig**ディレクトリーの中のオプションを置き換えます。例えば、**application.php**ファイルを新しい**local**設定ディレクトリーに作成することができます。

	return array(

		'url' => 'http://localhost/laravel/public',

	);

この例では、ローカルな**URL**オプションは**application/config/application.php**の**URL**オプションを置き換えます。

簡単ですよね？もちろん、お望みの環境を自由に作ることができますよ。

<a name="cleaner-urls"></a>
## クリーンURL

ほとんどの場合、アプリケーションのURLに"index.php"が含まれるのは、避けたいことでしょう。HTTPリライトルールを使用すれば、取り除けます。あなたがApacheをアプリケーションのサーバーとして利用しているのであれば、mod_rewriteを有効にし、**.htaccess**をあなたの**public**ディレクトリーに確実に設置してください。

	<IfModule mod_rewrite.c>
	     RewriteEngine on

	     RewriteCond %{REQUEST_FILENAME} !-f
	     RewriteCond %{REQUEST_FILENAME} !-d

	     RewriteRule ^(.*)$ index.php/$1 [L]
	</IfModule>

上の.htaccessファイルが上手く動作しない？では、次を試してください。

	Options +FollowSymリンク
	RewriteEngine on

	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteCond %{REQUEST_FILENAME} !-d

	RewriteRule . index.php [L]

HTTPリライトの設定を済ましたら、**application/config/application.php**のなかにある、**index**設定オプションに空文字列をセットしてください。

> **注意：**それぞれのWebサーバーはHTTPリライトに異なった方法を使っています。それにより、.htaccessファイルに多少異なった指定を剃る必要があるでしょう。