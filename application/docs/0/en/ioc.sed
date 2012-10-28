s+An IoC container is simply a way of managing the creation of objects\. +IoCコンテナはオブジェクトの生成を管理するシンプルな方法です。+

s+You can use it to define the creation of complex objects, allowing you to resolve them throughout your application using a single line of code\. +複雑なオブジェクトの生成を定義しておき、プロジェクト全体のどこからでも、一行のコードで生成することができます。+

s+You may also use it to "inject" dependencies into your classes and controllers\.+更に、依存性の「注入」をクラスやコントローラーに導入することもできます。+

s+IoC containers help make your application more flexible and testable\. +IoCコンテナはあなたのアプリケーションを柔軟でテストしやすくするのに役立ちます。+

s+Since you may register alternate implementations of an interface with the container, you may isolate the code you are testing from external dependencies using \[stubs and mocks\](http:\/\/martinfowler\.com\/articles\/mocksArentStubs\.html)\.+コンテナでインターフェイスの実装の別バージョンを登録できますから、[スタブとモック](http://martinfowler.com/articles/mocksArentStubs.html)を使い、外部の依存からコードのテストを独立させることができます。+


s+Registering a resolver in the IoC container:+IoCコンテナで、リゾルバを登録する+



s+Great! +素晴らしい！+

s+Now we have registered a resolver for SwiftMailer in our container\. +これでコンテナにSwiftMailerのリゾルバを登録できました。+

s+But, what if we don't want the container to create a new mailer instance every time we need one? +しかし、必要になるたびに毎回メイラーのインスタンスをコンテナに生成させたくないですよね？+

s+Maybe we just want the container to return the same instance after the initial instance is created\. +多分、最初に生成したインスタンスと同じインスタンスがコンテナから返される方が良いですよね。+

s+Just tell the container the object should be a singleton:+その場合、ただコンテナに、そのオブジェクトはシングルトンであると伝えてください。+


s+Registering a singleton in the container:+コンテナにシングルトンを登録する+


s+You may also register an existing object instance as a singleton in the container\.+既に存在しているインスタンスをコンテナにシングルトンとして登録することもできます。+

s+Registering an existing instance in the container:+存在しているインスタンスをコンテナに登録する+



s+Now that we have SwiftMailer registered in the container, we can resolve it using the \*\*resolve\*\* method on the \*\*IoC\*\* class:+これでSwiftMailerはコンテナに登録されました。**IoC**クラスの**resolve**メソッドを使うことで、解決することができます。+

s+\*\*Note:\*\* You may also \[register controllers in the container\](\/docs\/controllers#dependency-injection)\.+**注目：**[コンテナにコントローラーを登録する](/docs/controllers#dependency-injection)こともできます。+
