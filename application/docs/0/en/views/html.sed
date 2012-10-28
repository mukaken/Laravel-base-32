s+When displaying user input in your Views, it is important to convert all characters which have significance in HTML to their "entity" representation.+ユーザーのインプットをビューに表示するときには、HTML中の重要なすべての文字をHTMLエンティティ表現に変換することは重要です。+

s+For example, the < symbol should be converted to its entity representation\. +例えば、<シンボルは必ずエンティティ表現に変換します。+

s+Converting HTML characters to their entity representation helps protect your application from cross-site scripting:+HTMLキャラクターをエンティティ表現にコンバートすることは、クロスサイトスクリプティングより、あなたのアプリケーションを守る手助けになります。+

s+Converting a string to its entity representation:+文字列をHTMLエンティティ表現にコンバートする+

s+Using the "e" global helper:+グローバルヘルパーの"e"を使う+


s+Generating a reference to a JavaScript file:+Javascriptファイルへの参照を生成する+

s+Generating a reference to a CSS file:+CSSファイルへの参照を生成する+

s+Generating a reference to a CSS file using a given media type:+メディアタイプを指定し、CSSファイルへの参照を生成する+

s+Generating a link from a URI:+URIからリンクを生成する+

s+Generating a link that should use HTTPS:+HTTPSを使用し、リンクを生成する+

s+Generating a link and specifying extra HTML attributes:+追加のHTML属性を指定し、リンクを生成する+


s+Generating a link to a named route:+名前付きルートへリンクを生成する+

s+Generating a link to a named route with wildcard values:+ワイルドカード値と共に、名前付きルートへリンクを生成する+

s+Generating a link to a controller action:+コントローラーアクションへリンクを生成する+

s+Generating a link to a controller action with wildcard values:+ワイルドカード値と共に、コントローラーアクションへリンクを生成する+


s+The "mailto" method on the HTML class obfuscates the given e-mail address so it is not sniffed by bots\.+ボットをあしらうために、HTMLクラスの"mailto"メソッドは与えられたメールアドレスを分かりづらくします。+

s+Creating a mail-to link:+Mailtoリンクを生成する+

s+Creating a mail-to link using the e-mail address as the link text:+メールアドレスをリンクテキストとして生成する+

s+Generating an HTML image tag:+HTMLイメージタグを生成する+

s+Generating an HTML image tag with extra HTML attributes:+追加のHTML属性と共に、HTMLイメージタグを生成する+


s+Creating lists from an array of items:+配列のアイテムからリストを生成する+


s+It's easy to define your own custom HTML class helpers called "macros"\. +HTMLクラスヘルパー、"macros"を使い、簡単に自分自身のカスタムマクロを定義できます。+

s+Here's how it works\. +実例をどうぞ。+

s+First, simply register the macro with a given name and a Closure:+最初に名前と無名関数でマクロを登録します。+

s+Registering a HTML macro:+HTMLマクロを登録する+

s+Now you can call your macro using its name:+次に、名前でマクロを呼び出します。+

s+Calling a custom HTML macro:+カスタムHTMLマクロを呼び出す+
