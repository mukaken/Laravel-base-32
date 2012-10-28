s+\*\*Note:\*\* All input data displayed in form elements is filtered through the HTML::entities method\.+**注意：**フォーム要素に表示されるすべての入力データーはHTML::entitiesメソッドを通してフィルタリングされます。+

s+Opening a form to POST to the current URL:+現在のURLへPOSTするフォームを開く+

s+Opening a form using a given URI and request method:+URIとリクエスト方法を指定し、フォームを開く+

s+Opening a Form that POSTS to a HTTPS URL:+HTTPSのURLへPOSTするフォームを開く+

s+Specifying extra HTML attributes on a form open tag:+フォームタグに追加のHTML属性を指定する+

s+Opening a form that accepts file uploads:+ファイルアップロードを受け付けるフォームを開く+

s+Opening a form that accepts file uploads and uses HTTPS:+HTTPSを使い、ファイルアップロードを受け付けるフォームを開く+

s+Closing a form:+フォームを閉じる+


s+Laravel provides an easy method of protecting your application from cross-site request forgeries\. +Lravelはクロスサイト・リクエスト・フォージェリからサイトを守る簡単な方法を提供しています。+

s+First, a random token is placed in your user's session\. +まず、ユーザーのセッションにランダムトークンを設置します。+

s+Don't sweat it, this is done automatically\. +これは自動的に行われますので、何もする必要はありません。+

s+Next, use the token method to generate a hidden form input field containing the random token on your form:+次に、フォームに隠し入力フィールドを生成し、ランダムトークンを埋め込みます。+

s+Generating a hidden field containing the session's CSRF token:+セッションのCSRFトークンを埋め込む隠しフィールドを生成する+

s+Attaching the CSRF filter to a route:+ルートにCSRFフィルターを追加する+

s+Retrieving the CSRF token string:+CSRFトークン文字列を取得する+

s+\*\*Note:\*\* You must specify a session driver before using the Laravel CSRF protection facilities\.+LaravelのCSRFプロテクション機能を使用する前に、セッションドライバーを指定する必要があります。+

s+\[Cross-Site Request Forgery\](http:\/\/en\.wikipedia\.org\/wiki\/Cross-site_request_forgery)+[クロスサイト・リクエスト・フォージェリ](http://ja.wikipedia.org/wiki/%E3%82%AF%E3%83%AD%E3%82%B9%E3%82%B5%E3%82%A4%E3%83%88%E3%83%AA%E3%82%AF%E3%82%A8%E3%82%B9%E3%83%88%E3%83%95%E3%82%A9%E3%83%BC%E3%82%B8%E3%82%A7%E3%83%AA)+

s+Generating a label element:+ラベル要素を生成する+

s+Specifying extra HTML attributes for a label:+ラベルに追加のHTML要素を指定する+

s+\*\*Note:\*\* After creating a label, any form element you create with a name matching the label name will automatically receive an ID matching the label name as well\.+ラベルを生成後に、ラベルと一致する名前で作られるHTML要素は、その名前と同じIDも生成されます。+

s+Generate a text input element:+テキスト入力要素の生成+

s+Specifying a default value for a text input element:+テキスト入力要素にデフォルト値を指定する+

s+\*\*Note:\*\* The \*hidden\* and \*textarea\* methods have the same signature as the \*text\* method\. You just learned three methods for the price of one!+**注目：** *hidden*と*textarea*メソッドは*text*メソッドと使い方は同じです。一つ覚えるだけで、３つまとめて学べます。+

s+Generating a password input element:+パスワード入力要素を生成する+

s+Generating a checkbox input element:+チェックボックス要素を生成する+

s+Generating a checkbox that is checked by default:+チェック状態をデフォルトにして生成する+


s+\*\*Note:\*\* The \*radio\* method has the same signature as the \*checkbox\* method\. Two for one!+**注目：** *radio*メソッドは*checkbox*と全く同じです。１つで２つ分ですね。+


s+Generating a drop-down list from an array of items:+配列の要素から、ドロップダウンリストを生成する+

s+Generating a drop-down list with an item selected by default:+一つのアイテムをデフォルトに指定し、ドロップダウンリストを生成する+


s+Generating a submit button element:+Submitボタン要素を生成する+

s+\*\*Note:\*\* Need to create a button element? Try the \*button\* method\. It has the same signature as \*submit\*\.+**注目：** ボタン要素を生成する必要がある？ならば、*button*メソッドをお試しください。*submit*と使い方は同じです。+


s+It's easy to define your own custom Form class helpers called "macros"\. +カスタムフォームクラスヘルパー、通称「マクロ」を簡単に定義できます。+

s+Here's how it works\. +実例を見て下さい。+

s+First, simply register the macro with a given name and a Closure:+最初に、マクロを名前と無名関数を指定して、登録します。+

s+Registering a Form macro:+フォームマクロを登録する+

s+Now you can call your macro using its name:+次に、名前でそのマクロを呼び出します。+

s+Calling a custom Form macro:+カスタムマクロを呼び出す。+
