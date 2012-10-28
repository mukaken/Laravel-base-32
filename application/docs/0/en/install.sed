
s/Apache, nginx, or another compatible web server./Apacheかnginx、もしくは他の互換性のあるWebサーバー/

s/Laravel takes advantage of the powerful features that have become available in PHP 5.3. Consequently, PHP 5.3 is a requirement./LaravelはPHP 5.3で導入されたパワフルで有益な機能を使用しています。最低でもPHP 5.3が必要です。/

s/Laravel uses the \[FileInfo library\]/Laravelは[FileInfoライブラリー]/

s+(http:\/\/php.net\/manual\/en\/book\.fileinfo\.php)+(http://php.net/manual/ja/book.fileinfo.php)+
s+(http:\/\/php.net\/manual\/en\/fileinfo\.installation\.php)\.+(http://php.net/manual/ja/fileinfo.installation.php)+

s/to detect files' mime-types. /をファイルのmimeタイプを判断するために使用しています。/

s/This is included by default with PHP 5.3. /これはデフォルトでPHP5.3に含まれています。/

s/However, Windows users may need to add a line to their php.ini file before the Fileinfo module is enabled. /しかしながら、WindowsユーザーはFileinfoモジュールを有効にするために、php.iniに一行書き加える必要があります。/

s+For more information check out the \[installation \/ configuration details on PHP\.net\]+もっと詳しく知るために、次のリンクを参照してください。[PHP.net：インストール／設定の詳細]+


s+Laravel uses the \[Mcrypt library\](http:\/\/php\.net\/manual\/en\/book\.mcrypt\.php) for encryption and hash generation\.+ Laravelは[Mcryptライブラリー](http://php.net/manual/ja/book.mcrypt.php)を暗号とハッシュの生成に使用しています。+

s/Mcrypt typically comes pre-installed. /Mcryptは通常プリインストールされています。/

s+If you can't find Mcrypt in the output of phpinfo() then check the vendor site of your LAMP installation or check out the \[installation \/ configuration details on PHP\.net\](http\:\/\/php\.net\/manual\/en\/book\.mcrypt\.php).+もしphpinfo()の出力にMcryptが見つからない時には、あなたのLAMPインストールのベンダーサイトを参照するか、[PHP.net：インストール／設定の詳細](http://php.net/manual/ja/book.mcrypt.php)を御覧ください。+


s+\[Download Laravel\](http:\/\/laravel\.com\/download)+[Laravelをダウンロード](http://laravel.com/download)する+
s/Extract the Laravel archive and upload the contents to your web server./Laravel圧縮ファイルを解凍し、コンテンツをWebサーバーにアップロードする/
s+Set the value of the \*\*key\*\* option in the \*\*config\/application\.php\*\* file to a random, 32 character string.+**config/application.php**ファイルの**key**オプションに、でたらめな３２文字の値をセットする+
s+Verify that the `storage/views` directory is writable.+"storage/views"ディレクトリーが書き込み可能になっていることを確認する+
s/Navigate to your application in a web browser./ブラウザでアプリケーションにアクセスする/

s/If all is well, you should see a pretty Laravel splash page. /全てを上手くやれば、Laravelの可愛いスプラッシュページが表示されるでしょう。/
s/Get ready, there is lots more to learn!/準備をしてください。まだまだ多くのことを学ばなくてはなりません。/

s/Extra Goodies/追加の機能/

s/Installing the following goodies will help you take full advantage of Laravel, but they are not required:/Laravelの利便性を完全に利用するために、以下の機能もインストールすることができます。しかし、必要ではありません。/

s/SQLite, MySQL, PostgreSQL, or SQL Server PDO drivers./SQLite、MySQL、PostgreSQL、もしくはSQLサーバーPDOドライバー/
s/Memcached or APC./MemcachedかAPC/

s/Problems?/問題ですか？/

s/If you are having problems installing, try the following:/もし、何か問題があれば、以下を試してください。/

s+Make sure the \*\*public\*\* directory is the document root of your web server.+**public**ディレクトリーがWebサーバーのドキュメントルートになっているのを確認する+
s+(see: Server Configuration below)+（次のサーバー設定を参照してください）+

s+If you are using mod_rewrite, set the \*\*index\*\* option in \*\*application\/config\/application\.php\*\* to an empty string.+mod_rewriteを使用しているなら、**applicaton/config/application.php**にある**index**オプションに空文字列を指定する+

s+Verify that your storage folder and the folders within are writable by your web server.+Webサーバー上のstorageフォルダーとその中のサブフォルダーが書き込み可能になっていることを確認してください。+

s+All of the configuration provided are located in your applications config\/ directory. +提供されている設定ファイルは全てapplicationの下のconfigディレクトリに設置されています。+

s/We recommend that you read through these files just to get a basic understanding of the options available to you. /どんなオプションが使用できるのか、基本的に理解するため、設定ファイルに目を通しておくことをお勧めします。/

s+Pay special attention to the \*\*application\/config\/application.php\*\* file as it contains the basic configuration options for your application.+applicatoin/config/application.phpファイルに基本的なアプリケーションに対するオプションが集まっているため、特に注目してください。+

s/It's \*\*extremely\*\* important that you change the \*\*application key\*\* option before working on your site. /**非常に**重要なのは、サイトを公開する前に**application key**オプションを変更することです。/

s/This key is used throughout the framework for encryption, hashing, etc. /このキーはフレームワーク全体を通じて暗号化やハッシュ、その他に利用されます。/

s+It lives in the \*\*config\/application.php\*\* file and should be set to a random, 32 character string.+これは**config/application.php**ファイルの中にあり、でたらめな３２文字の文字列を指定してください。+

s/A standards-compliant application key can be automatically generated using the Artisan command-line utility.  /標準準拠のアプリケーションキーはArtisanコマンドラインユーティリティーを使用し、自動的に生成できます。/

s+More information can be found in the \[Artisan command index\](\/docs\/artisan\/commands).+詳細は[Artisanコマンドインデックス](/docs/artisan/commands)を御覧ください。+

s/\*\*Note:\*\* If you are using mod_rewrite, you should set the index option to an empty string./mod_rewriteを使用している場合は、indexオプションに空文字列をセットしてください。/



s/Most likely, the configuration options you need for local development are not the same as the options you need on your production server./ほとんどの場合、ローカル環境で指定するオプションと、実働サーバーで設定するオプションは異なっているでしょう。/

s/Laravel's default environment handling mechanism is URL based, which will make setting up environments a breeze. /LaravelはURLベースでデフォルトの環境を決めるメカニズムになっています。/

s/Pop open the `paths.php` file in the root of your Laravel installation. /Lravelをインストールしたルートにある、"paths.php"を開いてください。/

s/You should see an array like this:/次のような配列が存在しています。/


s/This tells Laravel that any URLs beginning with "localhost" or ending with ".dev" should be considered part of the "local" environment./コードが示しているのは、Laravelは"locahost"で始まるURL、もしくは".dev"で終わるURLであるならば、「ローカル」環境であると考えるということです。/

s+Next, create an \*\*application\/config\/local\*\* directory. +次に、application/coinfig/localディレクトリーを作成してください。+

s+Any files and options you place in this directory will override the options in the base \*\*application\/config\*\* directory. +このディレクトリーに置かれたファイルと、その中のオプションは、ベースとなる**application/coinfig**ディレクトリーの中のオプションを置き換えます。+

s+For example, you may wish to create an \*\*application.php\*\* file within your new \*\*local\*\* configuration directory:+例えば、**application.php**ファイルを新しい**local**設定ディレクトリーに作成することができます。+

s+In this example, the local \*\*URL\*\* option will override the \*\*URL\*\* option in \*\*application\/config\/application\.php\*\*. Notice that you only need to specify the options you wish to override. +この例では、ローカルな**URL**オプションは**application/config/application.php**の**URL**オプションを置き換えます。+

s/Isn't it easy? Of course, you are free to create as many environments as you wish!/簡単ですよね？もちろん、お望みの環境を自由に作ることができますよ。/


s/Most likely, you do not want your application URLs to contain "index.php". /ほとんどの場合、アプリケーションのURLに"index.php"が含まれるのは、避けたいことでしょう。/
s/You can remove it using HTTP rewrite rules. /HTTPリライトルールを使用すれば、取り除けます。/

s+If you are using Apache to serve your application, make sure to enable mod_rewrite and create a \*\*\.htaccess\*\* file like this one in your \*\*public\*\* directory:+あなたがApacheをアプリケーションのサーバーとして利用しているのであれば、mod_rewriteを有効にし、**.htaccess**をあなたの**public**ディレクトリーに確実に設置してください。+



s/Is the .htaccess file above not working for you? Try this one:/上の.htaccessファイルが上手く動作しない？では、次を試してください。/



s+After setting up HTTP rewriting, you should set the \*\*index\*\* configuration option in \*\*application\/config\/application\.php\*\* to an empty string.+HTTPリライトの設定を済ましたら、**application/config/application.php**のなかにある、**index**設定オプションに空文字列をセットしてください。+

s+\*\*Note:\*\* Each web server has a different method of doing HTTP rewrites, and may require a slightly different .htaccess file.+**注意：**それぞれのWebサーバーはHTTPリライトに異なった方法を使っています。そのため、.htaccessファイルに多少違った方法を取る必要があるでしょう。+



s+Server Configuration+サーバー設定+

s+Like most web-development frameworks, Laravel is designed to protect your application code, bundles, and local storage by placing only files that are necessarily public in the web server's DocumentRoot. +多くのWeb開発フレームワークと同様に、LaravelはWebサーバーのドキュメントルートには公開する必要のあるファイルだけを設置することにより、あなたのアプリケーションコード、バンドル、ローカルストレージを保護するように設計されています。+

s+This prevents some types of server misconfiguration from making your code (including database passwords and other configuration data) accessible through the web server.+これはある種のサーバー設定のミスにより、Webを通じて（データーベースパスワードやその他の設定情報を含んでいる）あなたのコードにアクセスされることを防ぎます。+

s+It's best to be safe.+安全のためには良い方法です。+

s+In this example let's imagine that we installed Laravel to the directory \*\*/Users/JonSnow/Sites/MySite\*\*\.+この例でLaravelを**/Users/JonSnow/Sites/MySite**ディレクトリーへインストールしたと考えてください。+

s+A very basic example of an Apache VirtualHost configuration for MySite might look like this.+MySiteに対する最も基本的なApache仮想ホストの設定は、このようになるでしょう。+

s+Notice that while we installed to \*\*/Users/JonSnow/Sites/MySite\*\* our DocumentRoot points to \*\*/Users/JonSnow/Sites/MySite/public\*\*.+**/Users/JonSnow/Sites/MySite**へインストールされて、ドキュメントルートには**/Users/JonSnow/Sites/MySite/public**を指定していることに注目してください。+

s+While pointing the DocumentRoot to the public folder is a commonly used best-practice, it's possible that you may need to use Laravel on a host that does not allow you to update your DocumentRoot. +ドキュメントルートに公開(public)フォルダーを指定するのは、よく行われるベストプラクティスです。これにより、ドキュメントルートはアップデートせず、Laravelを使用することもできるようになります。+
s+A collection of algorithms to circumvent this need can be found \[on the Laravel forums.\](http://forums.laravel.com/viewtopic.php?id=1258)+ドキュメントルートに関する別の手法が必要であれば、[Laraveフォーラム](http://forums.laravel.com/viewtopic.php?id=1258)でも見つけることができます。+


s+In this example, the local \*\*URL\*\* option will override the \*\*URL\*\* option in \*\*application/config/application.php\*\*. +この例では、ローカルの**URL**オプションは**application/config/application.php**中の**URL**オプションをオーバーライドします。+

s+Notice that you only need to specify the options you wish to override.+オーバーライドしたいオプションのみを指定すれば良いことに注意してください。+


s/FollowSymLinks/XXXlinks/