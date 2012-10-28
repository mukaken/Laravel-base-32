s/Welcome to the Laravel documentation./Laravelのドキュメントへようこそ。/

s/These documents were designed to function both as a getting-started guide and as a feature reference./このドキュメントはスタートガイドとして、さらに特徴の紹介としても役立つように書かれています。/

s/Even though you may jump into any section and start learning, we recommend reading the documentation in order as it allows us to progressively establish concepts that will be used in later documents. /どこから読んでも学習できますが、以前に学んだ概念をもとに、その後に続くドキュメントは書かれていますので、初めから順番に読むことをお勧めします。/


s/Laravel is a powerful framework that emphasizes flexibility and expressiveness./Laravelは柔軟性と読み書きしやすさを重視した、パワフルなフレームワークです。/

s/Users new to Laravel will enjoy the same ease of development that is found in the most popular and lightweight PHP frameworks./初めてLaravelに触れる方は、人気がある軽量なPHPフレームワークを使用して開発する時と同じ、安らぎを感じるでしょう。/

s/More experienced users will appreciate the opportunity to modularize their code in ways that are not possible with other frameworks./もうちょっと経験を積んだユーザーであれば、他のフレームワークではできない方法で、コードをモジュール化できることを評価するでしょう。/

s/Laravel's flexibility will allow your organization to update and mold the application over time as is needed and its expressiveness will allow you and your team to develop code that is both concise and easily read./Laravelの柔軟性は、要求に何度でも応じ、アプリケーションを修正しながら、形作ることを可能にし、表現性はあなたとあなたのチームが開発するコードをシンプルで読みやすくしてくれるでしょう。/


s/There are many ways in which Laravel differentiates itself from other frameworks./Laravelには他のフレームワークと違った特徴を数多く持っています。/

s/Here are a few examples that we think make good bullet points:/特に重要な点をいくつか紹介しましょう。/

s/\*\*Bundles\*\* are Laravel's modular packaging system./**バンドル**はLaravelのモジュールパッキングシステムです。/

s/The Laravel Bundle Repository/Laravelバンドルリポジトリー/

s/is already populated with quite a few features that can be easily added to your application./は、アプリケーションへ簡単に機能を付け加えられるように、予め用意されています。/

s/You can either download a bundle repository to your bundles directory or use the "Artisan" command-line tool to automatically install them./バンドルリポジトリーからbundlesディレクトリーにダウンロードしても良いですし、"Artisan"コマンドラインツールを使い、自動的にインストールすることもできます。/

s/\*\*The Eloquent ORM\*\* is the most advanced PHP ActiveRecord implementation available./**Eloquent ORM**は最も進化したPHPアクティブレコードを実装しています。/

s/With the capacity to easily apply constraints to both relationships and nested eager-loading you'll have complete control over your data with all of the conveniences of ActiveRecord. /リレーションシップとネストされたeagerローディングで簡単に制約を適用できる能力を使えば、自分のデーターを完全にコントロールでき、アクティブレコードの便利さを十分に体験できるでしょう。/

s/Eloquent natively supports all of the methods from Laravel's Fluent query-builder./EloquentはLaravelのクエリービルダーであるFluentのメソッドを完全にサポートしています。/

s/\*\*Application Logic\*\* can be implemented within your application either using controllers (which many web-developers are already familiar with) or directly into route declarations using syntax similar to the Sinatra framework./**アプリケーションロジック**を（多くのWeb開発者にはお馴染みの）コントローラーでアプリケーションに実装することもできますし、またSinatraフレームワークと似たようなシンタックスを使い、ルートの定義に直接記述することもできます。/

s/Laravel is designed with the philosophy of giving a developer the flexibility that they need to create everything from very small sites to massive enterprise applications./Laravelは小さなサイトから、巨大なエンタープライズアプリケーションまで、必要に応じて全て作成できるだけの柔軟性を開発者に提供する哲学で、設計されています。/

s/\*\*Reverse Routing\*\* allows you to create links to named routes./**リーバスルーティング**で名前付きのルートへリンクを作成できます。/

s/When creating links just use the route's name and Laravel will automatically insert the correct URI./リンクを作成するときにルートの名前を使えば、Laravelは自動的に正しいURIを挿入します。/

s/This allows you to change your routes at a later time and Laravel will update all of the relevant links site-wide./これを使うことにより、後ほどルートを変更しても、Laravelがサイト中のリンク全部を適切に更新します。/

s/\*\*Restful Controllers\*\* are an optional way to separate your GET and POST request logic./**Restコントローラー**はGETとPOSTのロジックを分ける一つの手法です。/

s/In a login example your controller's get_login() action would serve up the form and your controller's post_login() action would accept the posted form, validate, and either redirect to the login form with an error message or redirect your user to their dashboard./例えばログインにおいて、コントローラーのget_login()アクションでフォームを担当させ、コントローラーのpost_login()アクションで、送信されたフォームを受け取り、バリデーションし、エラーメッセージと一緒にログインフォームにリダイレクトさせたり、各ユーザーのダッシュボードにリダイレクトさせたりできます。/

s/\*\*Class Auto Loading\*\* keeps you from having to maintain an autoloader configuration and from loading unnecessary components when they won't be used./**クラスのオートロード**はオートロードの環境設定を保つ手間を省き、使用していない不必要なコンポーネントをロードしてしまうことを防げます。/
s/Want to use a library or model?/ライブラリーやモジュールを使いたいのですか？/
s/Don't bother loading it, just use it./ローディングに悩むことはありません。どうぞ使ってください。/
s/Laravel will handle the rest./後はLaravelが面倒を見ます。/

s/\*\*View Composers\*\* are blocks of code that can be run when a view is loaded./**ビューコンポーサー**はビューがロードされた時点で実行されるコードブロックです。/

s/A good example of this would be a blog side-navigation view that contains a list of random blog posts./良い例がブログのサイドナビに見られる、投稿をランダムにリスト表示するものです。/

s/Your composer would contain the logic to load the blog posts so that all you have to do i load the view and it's all ready for you./コンポーサーに、あなたの望みどおりにブログポストを読み込むロジックを書いておけば、ビューがロードされた時点で、準備は既に整っています。/

s/This keeps you from having to make sure that your controllers load the a bunch of data from your models for views that are unrelated to that method's page content./これにより、メソッドのページコンテンツに関連する、ビューのモジュールで使用するデータのロードを、全てのコントローラー側で確実に行わなくてはならない手間を省くことができます。/

s/\*\*The IoC container\*\* (Inversion of Control) gives you a method for generating new objects and optionally instantiating and referencing singletons./**IoCコンテナ**(Inversion of Control)は新しいオブジェクトを生成するメソッドを提供し、随意にインスタンスを生成したり、シングルトンでの使用をできるようにするものです。/

s/IoC means that you'll rarely ever need to bootstrap any external libraries./IoCにより、外部ライブラリーの使用準備を行う必要は滅多になくなります。/

s/It also means that you can access these objects from anywhere in your code without needing to deal with an inflexible monolithic structure./また、きっちりと決まった柔軟性のないファイル構造に係わる必要はなく、IoCを使用したオブジェクトにはコードのどこからでもアクセスできることも意味しています。。/
s/\*\*Migrations\*\* are version control for your database schemas and they are directly integrated into Laravel./**マイグレーション**はデータベーススキーマのバージョンコントロールで、Laravelに直接統合されています。/
s/You can both generate and run migrations using the "Artisan" command-line utility./生成も実行も"Artisan"コマンドラインユーティリティーを使用して行えます。/
s/Once another member makes schema changes you can update your local copy from the repository and run migrations./他のメンバーがスキーマを変更したら、リポジトリーからコピーをローカル環境に置き、マイグレーションを実行します。/
s/Now you're up to date, too!/すると、あなたのデータベースもアップデートされます！/

s/\*\*Unit-Testing\*\* is an important part of Laravel./**ユニットテスト**はLaravelの大切な一部です。/
s/Laravel itself sports hundreds of tests to help ensure that new changes don't unexpectedly break anything./Laravel自身も何百ものテストにより、新しい変更が予期せず他の部分を壊していないことを確認するために使っています。/

s/This is one of the reasons why Laravel is widely considered to have some of the most stable releases in the industry./これは、Laravelが業界で最も安定してるフレームワークであると考えられている理由の一つです。/

s/Laravel also makes it easy for you to write unit-tests for your own code./さらにLaravelは皆さんが自分のコードにユニットテストを書くのを簡単にしてくれます。/

s/You can then run tests with the "Artisan" command-line utility./その後で、"Artisan"コマンドユーティリティーを使いテストを実行できます。/

s/\*\*Automatic Pagination\*\* prevents your application logic from being cluttered up with a bunch of pagination configuration./**自動ペジネーション**はアプリケーションロジックがペジネーションの設定のためにごちゃごちゃになることを防ぎます。/

s+Instead of pulling in the current page, getting a count of db records, and selected your data using a limit\/offset just call 'paginate' and tell Laravel where to output the paging links in your view.+現在のページを得て、DBのレコード数を取得し、limit/offsetを使用してデーターをSELECTする代わりに、ただ"paginate"を呼び出し、ビューのどこにページリンクを出力するのかLaravelに教えて下さい。+

s/Laravel automatically does the rest. /Laravelは自動的に残りの面倒を見ます。/

s/Laravel's pagination system was designed to be easy to implement and easy to change./Laravelのペジネーションシステムは簡単に使用でき、簡単に変更できるように設計されています。/

s/It's also important to note that just because Laravel can handle these things automatically doesn't mean that you can't call and configure these systems manually if you prefer./強調しますが、Laravelがこれらを自動的に処理するからといっても、自分で呼び出したり、システムを設定できないわけではありません。そうしたければ、手動で行えます。/

s/These are just a few ways in which Laravel differentiates itself from other PHP frameworks. /これは他のPHPフレームワークとの違いを示す、わずかな例にすぎません。/

s/All of these features and many more are discussed thoroughly in this documentation./こうした特徴とその他すべて、このドキュメント全体を通して記述してあります。/


s/Laravel's directory structure is designed to be familiar to users of other popular PHP frameworks. /Laravelのディレクトリー構造は他の人気のあるPHPフレームワークと似せて設計されています。/

s/Web applications of any shape or size can easily be created using this structure similarly to the way that they would be created in other frameworks./他のフレームワークで採用されている方法と似ている構造を使うことで、どんなアプリケーションでも、どんなサイズのものでも簡単に作成できます。/


s/However due to Laravel's unique architecture, it is possible for developers to create their own infrastructure that is specifically designed for their application. /Laravelのアーキテクチャがユニークだからといっても、アプリケーションに合わせて、開発者が独自の構造を構築することも可能です。/

s/This may be most beneficial to large projects such as content-management-systems./これはコンテントマネージメントシステムのような大きなプロジェクトに有効でしょう。/

s/This kind of architectural flexibility is unique to Laravel./こうした柔軟な構造はLaravel独自なものです。/

s/Throughout the documentation we'll specify the default locations for declarations where appropriate./このドキュメントを通し、設置するのに最適なデフォルトの位置を指定していきたいと思います。/


s/Laravel is lucky to be supported by rapidly growing, friendly and enthusiastic community.//
s+The \[Laravel Forums\](http:\/\/forums.laravel.com) are a great place to find help, make a suggestion, or just see what other people are saying.+[Laravelフォーラム](http://forums.laravel.com)は手助けを得たり、手助けしたり、もしくは他の人が何を言っているかただ眺めたりできる素晴らしい場所です。+

s/Many of us hang out every day in the #laravel IRC channel on FreeNode./我々の多くは毎日FreeNodeの#laravel IRCチャンネルに接続しています。/

s+\[Here's a forum post explaining how you can join us.\]+[このフォーラム投稿に接続方法が説明されています。]+

s/Hanging out in the IRC channel is a really great way to learn more about web-development using Laravel./このIRCチャンネルにつなぎっぱなしにすることは、Laravelを使用するWeb開発について多くを学ぶ方法です。/

s/You're welcome to ask questions, answer other people's questions, or just hang out and learn from other people's questions being answered./どうぞ質問をし、他の人の質問に答え、もしくはつないだままにして、他の人の質問と答から学んでください。/

s/We love Laravel and would love to talk to you about it, so don't be a stranger!/私達はLaravelを愛していますし、Laravelについて話すのも大好きです。ですからよそ者にはならないでください！/

s+Laravel is open-sourced software licensed under the \[MIT License\](http:\/\/www.opensource.org\/licenses\/mit-license.php).+Laravelは[MITライセンス](http://www.opensource.org/licenses/mit-license.php)のもとにライセンスされているオープンソースのソフトウェアです。+

s/Laravel Documentation/Laravelドキュメント/g

s/The Basics/初めに/g
s/Who Will Enjoy Laravel?/Laravelを楽しめるのは誰？/g
s/What Makes Laravel Different?/Laravelはどこが違うの？/g
s/Application Structure/アプリケーション構造/g
s/Laravel's Community/Laravelのコミュニティー/g
s/License Information/ライセンス情報/g

