
s+The \*\*Asset\*\* class provides a simple way to manage the CSS and JavaScript used by your application\. +**Asset**クラスはCSSとJavascriptをアプリケーションで使用する簡単な方法を提供します。+

s+To register an asset just call the \*\*add\*\* method on the \*\*Asset\*\* class:+アセットを登録するには、**Asset**クラスの**add**メソッドを呼び出すだけです。+

s+Registering an asset:+アセットを登録する+

s+The \*\*add\*\* method accepts three parameters\. +**add**メソッドは３つの引数を取ります。+

s+The first is the name of the asset, the second is the path to the asset relative to the \*\*public\*\* directory, and the third is a list of asset dependencies (more on that later)\. +最初はアセットの名前で、２つ目はそのアセットの**public**ディレクトリーからの相対パスです。３つ目はアセットの依存リストです。（詳細は後ほど）+

s+Notice that we did not tell the method if we were registering JavaScript or CSS\. +登録するのがJavascriptなのかcssなのかをメソッドに伝えていないことに注目してください。+

s+The \*\*add\*\* method will use the file extension to determine the type of file we are registering\.+**add**メソッドはファイルの拡張子から、登録するファイルのタイプを決定します。+


s+When you are ready to place the links to the registered assets on your view, you may use the \*\*styles\*\* or \*\*scripts\*\* methods:+登録済みアセットのリンクをビューに表示する準備が済んだら、**styles**と**scripts**メソッドが使用できます。+

s+Dumping assets into a view:+ビューの中にアセットをダンプする+


s+Sometimes you may need to specify that an asset has dependencies\. +時々、アセットは他のアセットに依存していることを指定する必要があるでしょう。+

s+This means that the asset requires other assets to be declared in your view before it can be declared\. +つまりビューの中で、あるアセットを宣言する前に、他のアセットを宣言しておく必要がある場合です。+

s+Managing asset dependencies couldn't be easier in Laravel\. +Laravelのアセット依存性管理は、これ以上簡単にできないほど簡単です。+

s+Remember the "names" you gave to your assets? +あなたがアセットに付けた「名前」を覚えていますか？+

s+You can pass them as the third parameter to the \*\*add\*\* method to declare dependencies:+**add**メソッドの第３引数に依存性の宣言を渡すことができます。+

s+Registering a bundle that has dependencies:+依存関係のあるアセットを登録する+


s+In this example, we are registering the \*\*jquery-ui\*\* asset, as well as specifying that it is dependent on the \*\*jquery\*\* asset\. +この例では、**jquery-ui**アセットを登録し、それと同時に**jquery**アセットに依存している指定を行なっています。+

s+Now, when you place the asset links on your views, the jQuery asset will always be declared before the jQuery UI asset\. +これで、ビューの中でアセットのリンクを置くときに、jQuery UIアセットの前にいつも、jQueryアセットが宣言されます。+

s+Need to declare more than one dependency? +依存しているアセットは二つ以上ある？+

s+No problem:+大丈夫です：+

s+Registering an asset that has multiple dependencies:+複数の依存関係があるアセットを登録する+


s+To increase response time, it is common to place JavaScript at the bottom of HTML documents\. +レスポンスを早くするために、JavascriptをHTMLドキュメントの最後に置くのは常識です。+

s+But, what if you also need to place some assets in the head of your document? +しかし、いくつかのアセットをドキュメントのheadに置く必要がある時はどうしましょう？+

s+No problem\. +問題ありません。+

s+The asset class provides a simple way to manage asset \*\*containers\*\*\. +Assetクラスはアセット**コンテナ**で簡単に管理できる方法を提供しています。+

s+Simply call the \*\*container\*\* method on the Asset class and mention the container name\. +Assetクラスの**container**メソッドを呼び出し、コンテナ名をつげてください。+

s+Once you have a container instance, you are free to add any assets you wish to the container using the same syntax you are used to:+一度コンテナのインタンスを作れば、今までと同じシンタックスを用いて、コンテナにアセットを自由に追加できます。+

s+Retrieving an instance of an asset container:+アセットコンテナを取得する+

s+Dumping that assets from a given container:+コンテナに与えられたアセットをダンプする+


s+Before learning how to conveniently add and dump bundle assets, you may wish to read the documentation on \[creating and publishing bundle assets\](\/docs\/bundles#bundle-assets)\.+バンドルアセットを便利に追加したり、ダンプする前に、[バンドルアセットを生成し、公開する](/docs/bundles#bundle-assets)ドキュメントを読みたいかも知れませんね。+

s+When registering assets, the paths are typically relative to the \*\*public\*\* directory\. +アセットを登録する時、通常パスは**public**ディレクトリーからの相対パスになります。+

s+However, this is inconvenient when dealing with bundle assets, since they live in the \*\*public\/bundles\*\* directory\. +しかしながら、これではバンドルアセットを取り扱うときに不便です。それらは**public/bundles**ディレクトリーの中にあるからです。+

s+But, remember, Laravel is here to make your life easier\. +でも、思い出してください。Laravelは人生をより簡単にするために存在していることを。+

s+So, it is simple to specify the bundle which the Asset container is managing\.+ですから、シンプルに管理しているアセットコンテナにバンドルを指定してください。+


s+Specifying the bundle the asset container is managing:+管理しているアセットコンテナにバンドルを指定する+


s+Now, when you add an asset, you can use paths relative to the bundle's public directory\. +これでアセットを追加すれば、バンドルのpublicディレクトリーへの相対パスで使用できます。+

s+Laravel will automatically generate the correct full paths\.+Laravelは自動的に正しいフルパスを生成します。+
