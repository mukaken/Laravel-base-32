s+Getting the contents of a file:+ファイルの内容を読み込む+

s+Writing to a file:+ファイルに書き込む+

s+Appending to a file:+ファイルに追加する+

s+Deleting a single file:+ファイルを削除する+


s+Moving a $_FILE to a permanent location:+$_FILEを指定場所に移動+

s+\*\*Note:\*\* You can easily validate file uploads using the \[Validator class\](\/docs\/validation)\.+アップロードしたファイルは、[Validatorクラス](docs/validation)を使用して、簡単にバリデーションできます。+


s+Getting the extension from a filename:+ファイル名から拡張子を得る+

s+Determining if a file is given type:+ファイルが与えられたタイプであるか調べる+


s+The \*\*is\*\* method does not simply check the file extension\. +**is**メソッドは、ただ拡張子をチェックするだけではありません。+

s+The Fileinfo PHP extension will be used to read the content of the file and determine the actual MIME type\.+Fileinfo PHP拡張を使用し、そのファイルの本当のMIMEタイプを調べるために使用されます。+

s+\*\*Note:\*\* You may pass any of the extensions defined in the \*\*application\/config\/mimes\.php\*\* file to the \*\*is\*\* method\.+**注目：** **application/config/mimes.phpの中に定義されている拡張子を指定できます。+


s+\*\*Note:\*\* The Fileinfo PHP extension is required for this functionality\. +**注目：**Fileinfo** PHP拡張がこの機能に必要です。+

s+More information can be found on the \[PHP Fileinfo page\](http:\/\/php\.net\/manual\/en\/book\.fileinfo\.php)\.+情報は、[PHP Fileinfoページ](http://php.net/manual/en/book.fileinfo.php)をご覧ください。+



s+Getting the MIME type associated with an extension:+拡張子と関連付けられたMIMEタイプを取得+

s+\*\*Note:\*\* This method simply returns the MIME type defined for the extension in the \*\*application\/config\/mimes\.php\*\* file\.+**注目：**このメソッドは**application/config/mimes.php**で定義されている、拡張子のMIMEタイプを返すだけです。+


s+Recursively copy a directory to a given location:+指定された場所のディレクトリーを再帰的にコピー+

s+Recursively delete a directory:+再帰的なディレクトリーの削除+
