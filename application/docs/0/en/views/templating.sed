s+Your application probably uses a common layout across most of its pages\. +多分、あなたのアプリケーションでもほとんどのページに渡って、共通のレイアウトを使用していることでしょう。+

s+Manually creating this layout within every controller action can be a pain\. +このレイアウトを手動で、全てのコントローラーアクションに生成するのは、辛いですよね。+

s+Specifying a controller layout will make your development much more enjoyable. +コントローラーにレイアウトが指定出来れば、開発はもっと楽しくなります。+

s+Here's how to get started:+では、これを行なってみましょう。+

s+Specify a "layout" property on your controller:+コントローラーに"layout"プロパティを指定する+

s+Access the layout from the controllers' action:+コントローラーのアクションからレイアウトにアクセスする+

s+\*\*Note:\*\* When using layouts, actions do not need to return anything\.+**注目：**レイアウトを使う場合、アクションは何もリターンしません。+


s+View sections provide a simple way to inject content into layouts from nested views\. +ビューのセクションはネストしたビューからレイアウトにコンテンツを挿入するシンプルな方法を提供します。+

s+For example, perhaps you want to inject a nested view's needed JavaScript into the header of your layout\. +例えば、多分あなたはレイアウトのヘッダーの中にネストビューが必要としているJavascriptを挿入したいとします。+

s+Let's dig in:+これを掘り下げてみましょう。+

s+Creating a section within a view:+ビューの中にセクションを生成する+

s+Rendering the contents of a section:+セクションの内容をレンダリングする+

s+Using Blade short-cuts to work with sections:+Bladeのショートカットを使いセクション操作する+


s+Blade makes writing your views pure bliss\. +Bladeはビューを書くことを至高の喜びにしてくれます。+

s+To create a blade view, simply name your view file with a "\.blade\.php" extension\. +Bladeビューを作成するには、ファイルの拡張子を".blade.php"にするだけです。+

s+Blade allows you to use beautiful, unobtrusive syntax for writing PHP control structures and echoing data\. +Bladeにより、美しく控えめなシンタックスで、PHPコントロール構文やデーターのエコーを書くことができるようになります。+

s+Here's an example:+例をご覧ください。+

s+Echoing a variable using Blade:+Bladeを使い、変数をエコーする+

s+Echoing function results using Blade:+Bladeを使い、関数の結果をエコーする+

s+Rendering a view:+ビューをレンダリングする+

s+\*\*Note:\*\* When using the \*\*@include\*\* Blade expression, the view will automatically inherit all of the current view data\.+**注目：**Bladeの記述で**@include**を使用する場合、現在のビューのデーターは全て自動的に継承されます。+

s+Creating loops using Blade:+ブレードでループを作成する+

s+Other Blade control structures:+他のBladeコントロール構文+

s+The "for-else" control structure:+"for-else"コントロール構文+

s+The "unless" control structure:+"unless"コントロール構文+

s+Blade comments:+Bladeコメント+

s+This is a comment+これがコメントです+

s+\*\*Note:\*\* Unlike HTML comments, Blade comments are not visible in the HTML source\.+**注目：**Bladeのコメントは、HTMLコメントとは異なり、HTMLソースには出力されません。+


s+Not only does Blade provide clean, elegant syntax for common PHP control structures, it also gives you a beautiful method of using layouts for your views\. +BladeはきれいでエレガントなシンタックスをPHPの一般的なコントロール構文に提供しているだけでなく、ビューのレイアウトに使用できる、美しい手法も用意しています。+

s+For example, perhaps your application uses a "master" view to provide a common look and feel for your application\. +例えば、あなたのアプリケーションでは、共通のルック・アンド・フィールを提供するために、「マスター」ビューを使っているでしょう。+

s+It may look something like this:+それは多分、こんな感じだと思います：+

s+Notice the "content" section being yielded\. +"content"セクションが生成されることに注目してください。+

s+We need to fill this section with some text, so let's make another view that uses this layout:+このセクションに何かテキストを埋めるなくてはなりません。では、このレイアウトを使用する、別のビューを作成しましょう。+

s+Great! +素晴らしい！+

s+Now, we can simply return the "profile" view from our route:+これで、ルートからシンプルに"profile"ビューをリターンできます。+

s+The profile view will automatically use the "master" template thanks to Blade's \*\*@layout\*\* expression\.+porfileビューはありがたいことに、**@layout**文により、Laravelは"master"テンプレートを自動的に使用してくれます。+

s+Sometimes you may want to only append to a section of a layout rather than overwrite it\. +場合により、セクションのレイアウトを置き換えてしまうよりは、追加したいこともあります。+

s+For example, consider the navigation list in our "master" layout\. +例えば、"master"レイアウトのナビゲーションリストを考えてください。+

s+Let's assume we just want to append a new list item\. +ここに、新しいアイテムを追加してみましょう。+

s+Here's how to do it:+こんな風になります：+

s+Notice the \*\*@parent\*\* Blade construct? +**@parent**Blade構文に気が付きましたか？+

s+It will be replaced with the contents of the layout's navigation section, providing you with a beautiful and powerful method of performing layout extension and inheritance\.+これはlayoutのnavigationセクションの内容に置き換わります。これはレイアウトの拡張と継承を実現する美しくてパワフルな手法を提供しています。+


s+Render a view:+ビューをレンダーする+

s+You can use \*\*@include\*\* to render a view into another view. +**@include**を使用し、他のビューの中にビューをレンダーすることができます。+

s+The rendered view will automatically inherit all of the data from the current view.+レンダーされるビューは自動的に、現在のビューの全てのデーターを継承します。+

s+Similarly, you can use \*\*@render\*\*, which behaves the same as \*\*@include\*\* except the rendered view will \*\*not\*\* inherit the data from the current view.+同様に、**@include**と同じような働きをする**@render**も使用できます。違いはレンダー時に、現在のビューのデーターを継承**しない**ことです。+


s+\*\*Important:\*\* The \*\*@layout\*\* call must always be on the very first line of the file, with no leading whitespaces or newline breaks.+**重要：** **@layout**はファイルの最初の一行で呼び出す必要があり、先頭にホワイトスペースをつけたり、途中で改行してはいけません。+

s+Appending with @parent+@parentで追加する+

s+\*\*@parent\*\* will be replaced with the contents of the layout's \*navigation\* section, providing you with a beautiful and powerful method of performing layout extension and inheritance.+**@parent**はレイアウトの*navigation*セクションの内容と置き換わります。これはレイアウトの拡張と継承を実現する美しくてパワフルな手法を提供しています。+

s+The comment body is+コメントの内容は+
s+I have comments!+コメントがあります！+
s+I have no comments!+コメントがありません！+
s+I am still looping!+まだループ中です！+
s+There are not posts in the array!+配列中にはポストはありません！+
s+Equivalent to+同じ内容+
s+Welcome to the profile page!+profileページへようこそ！+

s+This is a+これは+
s+multi-line+複数行に渡る+
s+comment\.+コメント例です。+

s+I'm displaying the message!+メッセージを出力中！+
s+It was a success!+成功した！+
s+An error occurred.+エラーが起きた。+
s+Did it work?+ここに来るのかな？+