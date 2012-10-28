
s+Models are the heart of your application\. +モデルはあなたのアプリケーションの心臓です。+

s+Your application logic (controllers \/ routes) and views (html) are just the mediums with which users interact with your models\. +アプリケーションロジック（コントローラー／ルート）とビュー（HTML）はユーザーとモデルとを関係付ける媒体にすぎません。+

s+The most typical type of logic contained within a model is \[Business Logic\](http:\/\/en\.wikipedia\.org\/wiki\/Business_logic)\.+モデルの中に組み込む、一番典型的なロジックは[ビジネスロジック](http://ja.wikipedia.org/wiki/%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9%E3%83%AD%E3%82%B8%E3%83%83%E3%82%AF)でしょう。+

s+\*Some examples of functionality that would exist within a model are:\*+*モデルに入れ込む機能の例をご覧下さい。*+


s+Database Interactions+データベースI/O+

s+File I\/O+ファイルI/O+

s+Interactions with Web Services+Webサービスとのやり取り+

s+For instance, perhaps you are writing a blog\. +例えば、あなたがブログをプログラムしているとします。+

s+You will likely want to have a "Post" model\. +あなたは多分"Post"モデルを作りたがるでしょう。+

s+Users may want to comment on posts so you'd also have a "Comment" model\. +ユーザーはポストにコメントしたがるでしょうから、"Comment"モデルも作ることでしょう。+

s+If users are going to be commenting then we'll also need a "User" model\. +もしユーザーにコメントさせるのでしたら、"User"モデルも必要になるでしょう。+

s+Get the idea?+分かりましたか？+


s+Libraries are classes that perform tasks that aren't specific to your application\. +ライブラリーとは、あなたのアプリケーションのためだけに仕事をするわけではないクラスのことです。+

s+For instance, consider a PDF generation library that converts HTML\. +例えば、HTMLからコンバートしてくれるPDF生成ライブラリーを考えてください。+

s+That task, although complicated, is not specific to your application, so it is considered a "library"\. +それは複雑でしょうが、あなたのアプリケーションのためだけに役立つわけでありません。ですから、「ライブラリー」にすることを考えてください。+

s+Creating a library is as easy as creating a class and storing it in the libraries folder\. +ライブラリーを作成するのは、クラスを作ることと同じように簡単で、librariesフォルダーの中に保存します。+

s+In the following example, we will create a simple library with a method that echos the text that is passed to it\. +次の例として、渡されたテキストをエコーするメソッドを持つ、シンプルなライブラリーを作成してみましょう。+

s+We create the \*\*printer\.php\*\* file in the libraries folder with the following code\.+librariesフォルダーの中の**printer.php**ファイルを作成し、次のコードを書いてください。+


s+You can now call Printer::write('this text is being echod from the write method!') from anywhere within your application\.  +これであなたはアプリケーションのどんな所からも、Printer::write('writeメソッドからこのテキストはエコーされている！')と呼び出せるようになりました。+


s+Libraries and Models are very easy to use thanks to the Laravel auto-loader\. To learn more about the auto-loader check out the documentation on \[Auto-Loading\](\/docs\/loading)\.+ライブラリーとモデルは、とても簡単に使用できるので、Laravelのオートローダーに感謝しています。オートローダーについてもっと知るためには[オートローダー](/docs/loading)をチェックしてください。+

s+We've all head the mantra: "controllers should be thin!" +私達の頭の中には「コントローラーは簡単に！」というマントラが流れています。+

s+But, how do we apply that in real life? +けど、どうやって実際の世界に適用すればいいのでしょうか？+

s+It's possible that part of the problem is the word "model"\. +これは「モデル」という言葉が含む、問題の一部分になります。+

s+What does it even mean? +一体何を意味しているのでしょう？+

s+Is it even a useful term? +ただの便利な言葉なのでしょうか？+

s+Many associate "model" with "database", which leads to having very bloated controllers, with light models that access the database\. +「データベース」に関連付けられた多くの「モデル」が発生させるのは、データーベースにアクセスするだけの軽いモデルと、でっぷり太ったコントローラーです。+

s+Let's explore some alternatives\.+別の手法を取ってみましょう+


s+What if we just totally scrapped the "models" directory? +"models"ディレクトリーが完全にスクラップになったからって、どうだって言うんですか？+

s+Let's name it something more useful\. +もっと便利な名前を付けましょう。+

s+In fact, let's just give it the same as our application\. +実際、アプリケーションと同じ名前をつけましょう。+

s+Perhaps are our satellite tracking site is named "Trackler", so let's create a "trackler" directory within the application folder\.+多分衛星トラッキングサイトでしたら、名前は"Trackler"になるでしょう。それならば、applicationフォルダーの下に"trackler"ディレクトリーを作りましょう。+


s+Great! +いいですね！+

s+Next, let's break our classes into "entities", "services", and "repositories"\. +次に、クラスを実体"entities"、サービス"services"、リポジトリー"repositories"に分割しましょう。+

s+So, we'll create each of those three directories within our  "trackler" folder\. +では、"trackler"フォルダーの下に、これら３つのディレクトリーを作成することにしましょう。+

s+Let's explore each one:+それぞれを見て行きましょう。+



s+Think of entities as the data containers of your application\. +entitiesはアプリケーションのデーターコンテナだと考えてください。+

s+They primarily just contain properties\. +主としてプロパティのみで構成されています。+

s+So, in our application, we may have a "Location" entity which has "latitude" and "longitude" properties\. +ですから、アプリケーションに"Location"（位置）実体があるならば、"latitude"（経度）と"longitude"（緯度）のプロパティを持ちます。+

s+It could look something like this:+このようなコードになるでしょう：+

s+Looking good\. +見た感じ、良いようです。+

s+Now that we have an entity, let's explore our other two folders\.+これで、実体がひとつ出来ました。他の２つのフォルダーを見て行きましょう。+

s+Services contain the \*processes\* of your application\. +servicesはアプリケーションの*処理*で構成されます。+

s+So, let's keep using our Trackler example\. +このまま、Tracklerサンプルを使って説明していきます。+

s+Our application might have a form on which a user may enter their GPS location\. +このアプリケーションでは、ユーザーがGPSロケーションを入力するフォームを持っているとします。+

s+However, we need to validate that the coordinates are correctly formatted\. +ですから、座標が正しいフォーマットであるかバリデーションする必要があります。+

s+We need to \*validate\* the \*location entity\*\. +*location実体*を*バリデーション*する必要があります。+

s+So, within our "services" directory, we could create a "validators" folder with the following class:+では、"services"ディレクトリーの中に、"validators"フォルダーを作成し、次のクラスを書いてください。+

s+Validate the location instance\.\.\.+locationインスタンスのバリデーション処理……+

s+Great! +素晴らしい！+

s+Now we have a great way to test our validation in isolation from our controllers and routes! +これでコントローラーとルートとは独立して、バリデーションをテストする素晴らしい方法が手に入りました！+

s+So, we've validated the location and we're ready to store it\. +locationのバリデーションは済みました。これで保存する準備ができました。+

s+What do we do now?+では、どう行いましょうか？+


s+Repositories are the data access layer of your application\. +repositoriesはアプリケーションのデーターアクセス層です。+

s+They are responsible for storing and retrieving the \*entities\* of your application\. +あなたのアプリケーションの*実体(entities)*を保存したり、入手することに責任を持ちます。+

s+So, let's continue using our \*location\* entity in this example\. +引き続いて、この例では*場所(location)*実体を使って行きましょう。+

s+We need a location repository that can store them\. +実体を保存する場所リポジトリーが必要です。+

s+We could store them using any mechanism we want, whether that is a relational database, Redis, or the next storage hotness\. +リレーショナルデータベースであろうと、Redisであろうと、次世代のホットなストレージだろうと、なんでも好きなメカニズムを使うことができます。+

s+Let's look at an example:+例を見てみましょう。+

s+Store the location for the given user ID\.\.\.+与えられたユーザーIDの場所を保存するコード……+

s+Now we have a clean separation of concerns between our application's entities, services, and repositories\. +これで、アプリケーションの実体、サービス、リポジトリー間の関係をきれいに分割できました。+

s+This means we can inject stub repositories into our services or controllers, and test those pieces of our application in isolation from the database\. +これが意味するのは、スタブリポジトリーをサービスやコントローラーに注入することで、こうしたアプリケーションの一部分をデータベースとは独立してテストできるということです。+

s+Also, we can entirely switch data store technologies without affecting our services, entities, or controllers\. +しかも、サービスや実体、コントローラーには影響をあたえること無く、保存テクノロジーを変更できるようになります。+

s+We've achieved a good \*separation of concerns\*\.+これで、良い*関係の分離*を達成できました。+


s+ Entities+ Entities（実体）+
s+ Services+ Services（サービス）+
s/ Repositories/ Repositories（リポジトリー）/
s+\[Entities+\[Entities（実体）+
s+\[Services+\[Services（サービス）+
s/\[Repositories/\[Repositories（リポジトリー）/




s/Entities/XXXentities/
