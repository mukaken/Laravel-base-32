s+The \*\*Str\*\* class also provides three convenient methods for manipulating string capitalization: \*\*upper\*\*, \*\*lower\*\*, and \*\*title\*\*\. +**Str**クラスは文字変換を行う３つの便利なメソッド、**uppper**、**lower**、**title**を提供しています。+

s+These are more intelligent versions of the PHP \[strtoupper\](http:\/\/php\.net\/manual\/en\/function\.strtoupper\.php), \[strtolower\](http:\/\/php\.net\/manual\/en\/function\.strtolower\.php), and \[ucwords\](http:\/\/php\.net\/manual\/en\/function\.ucwords\.php) methods\. +これら３つはPHPの[strtoupper](http://php.net/manual/ja/function.strtoupper.php)、[strtolower](http://php.net/manual/ja/function.strtolower.php)、[ucwords](http://php.net/manual/ja/function.ucwords.php)メソッドをより賢くしたバージョンです。+

s+More intelligent because they can handle UTF-8 input if the \[multi-byte string\](http:\/\/php\.net\/manual\/en\/book\.mbstring\.php) PHP extension is installed on your web server\. +どこが賢いかといえば、[マルチバイト文字列](http://php.net/manual/ja/book.mbstring.php)PHP拡張があなたのWebサーバーにインストールされていれば、UTF-8を処理できるようになっています。+

s+To use them, just pass a string to the method:+使用方法は、単に文字列をメソッドに渡すだけです。+

s+Limiting the number of characters in a string:+文字列の文字数を制限+

s+Limiting the number of words in a string:+文字列の語数を制限+

s+Generating a random string of alpha-numeric characters:+英数字のランダム文字列を生成+

s+Generating a random string of alphabetic characters:+英文字のランダム文字列を生成+


s+The String class is capable of transforming your strings from singular to plural, and vice versa\.+Strクラスは単数形と複数形の変換もできます。+

s+Getting the plural form of a word:+複数形を取得+

s+Getting the singular form of a word:+単数形を取得+

s+Getting the plural form if given value is greater than one:+指定された数字が２以上であれば、複数形を返す+


s+Generating a URL friendly slug:+URLフレンドリーなスラグを生成+

s+Generating a URL friendly slug using a given separator:+与えられたセパレーターを使用し、URLフレンドリーなスラグを生成+
