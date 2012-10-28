s+Auto-loading allows you to lazily load class files when they are needed without explicitly \*requiring\* or \*including\* them\. +オートローディングであなたはクラスの読み込みで明確に*require*したり*include*したりする必要がなくなり、のんびりできます。+

s+So, only the classes you actually need are loaded for any given request to your application, and you can just jump right in and start using any class without loading it's related file\.+アプリケーションにリクエストがあり、クラスが本当に必要になった時のみ読込されますから、あなたは関連するファイルを読み込むこと無く、どんなクラスでも直ぐに使用できます。+

s+By default, the \*\*models\*\* and \*\*libraries\*\* directories are registered with the auto-loader in the \*\*application\/start\.php\*\* file\. +デフォルトでは、**models**と**libraries**ディレクトリーが、**application/start.php**ファイルの中で、オートロードされるように登録されています。+

s+The loader uses a class to file name loading convention, where all file names are lower-cased\. +クラス名をすべて小文字にしたファイル名を使用する規約になっています。+

s+So for instance, a "User" class within the models directory should have a file name of "user\.php"\. +例えば、"User"クラスは、modelsディレクトリーの中に、"user.php"という名前のファイルで設置しなくてはなりません。+

s+You may also nest classes within sub-directories\. +また、クラスをサブディレクトリーに入れ、ネストすることもできます。+

s+Just namespace the classes to match the directory structure\. +名前空間をディレクトリー構造に合わせるだけです。+

s+So, a "Entities\\User" class would have a file name of "entities\/user\.php" within the models directory\.+ですから、"Entities\\User"クラスは、modelsディレクトリーの中に、"entities/user.php"という名前で設置します。+


s+As noted above, the models and libraries directories are registered with the auto-loader by default; however, you may register any directories you like to use the same class to file name loading conventions:+上で示した通り、modelsとlibrariesディレクトリーはデフォルトでオートロードされます。しかしながら、クラスと同じファイル名を付ける規約を使い、どのディレクトリーでも登録することができます。+

s+Registering directories with the auto-loader:+オートロードするディレクトリーを登録する+


s+Sometimes you may wish to manually map a class to its related file\. +時には、手動でクラスに関連するファイルをマッピングしたい時もあるでしょう。+

s+This is the most performant way of loading classes:+これは一番効率が良い、クラスのローディング方法です。+

s+Registering a class to file mapping with the auto-loader:+オートローダーにクラスとファイルのマップを登録する+


s+Many third-party libraries use the PSR-0 standard for their structure\. +多くのサードパーティライブラリーはPSR-0規約に従った構造をしています。+

s+PSR-0 states that class names should match their file names, and directory structure is indicated by namespaces\. +PSR-0では、クラス名はファイル名と一致しており、ディレクトリー構造が名前空間になります。+

s+If you are using a PSR-0 library, just register it's root namespace and directory with the auto-loader:+もし、PSR-0ライブラリーを使用するならば、ルートの名前空間とディレクトリーをオートローダーに登録してください。+

s+Registering a namespace with the auto-loader:+名前空間をオートローダーに登録する+


s+Before namespaces were available in PHP, many projects used underscores to indicate directory structure\. +PHPで名前空間が使えるようになる前は、多くのプロジェクトで下線(\\_)がディレクトリー構造を表していました。+

s+If you are using one of these legacy libraries, you can still easily register it with the auto-loader\. +もし、あなたがこのような古風なライブラリーを使っていても、オートローダーに登録するのは簡単です。+

s+For example, if you are using SwiftMailer, you may have noticed all classes begin with "Swift_"\. +例えば、SwiftMailerを使っているのでしたら、全てのクラスは"Swift\\_"で始まっていることに気がついているでしょう。+

s+So, we'll register "Swift" with the auto-loader as the root of an underscored project\.+では、下線を使っているプロジェクトをルートとして指定することで、"Swift"をオートローダーに登録してみましょう。+

s+Registering an "underscored" library with the auto-loader:+「下線」使用のライブラリーをオートローダーに登録する+



s/Entities/XXXentities/
