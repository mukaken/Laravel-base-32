# ファイルの使用

## 内容

- [ファイルの読み込み](#get)
- [ファイルの書き込み](#put)
- [ファイルのアップロード](#upload)
- [ファイル拡張子](#ext)
- [ファイルタイプを調べる](#is)
- [MIMEタイプを取得](#mime)
- [ディレクトリーのコピー](#cpdir)
- [ディレクトリーの削除](#rmdir)

<a name="get"></a>
## ファイルの読み込み

#### ファイルの内容を読み込む

	$contents = File::get('path/to/file');

<a name="put"></a>
## ファイルの書き込み

#### ファイルに書き込む

	File::put('path/to/file', 'file contents');

#### ファイルに追加する

	File::append('path/to/file', 'appended file content');

<a name="upload"></a>
## ファイルのアップロード

#### $_FILEを指定場所に移動

	Input::upload('picture', 'path/to/pictures', 'filename.ext');

> アップロードしたファイルは、[Validatorクラス](docs/validation)を使用して、簡単にバリデーションできます。

<a name="ext"></a>
## ファイル拡張子

#### ファイル名から拡張子を得る

	File::extension('picture.png');

<a name="is"></a>
## ファイルタイプを調べる

#### ファイルが与えられたタイプであるか調べる

	if (File::is('jpg', 'path/to/file.jpg'))
	{
		//
	}

**is**メソッドは、ただ拡張子をチェックするだけではありません。Fileinfo PHP拡張を使用し、そのファイルの本当のMIMEタイプを調べるために使用されます。

**注目：** **application/config/mimes.phpの中に定義されている拡張子を指定できます。
> **注目：**Fileinfo** PHP拡張がこの機能に必要です。情報は、[PHP Fileinfoページ](http://php.net/manual/en/book.fileinfo.php)をご覧ください。

<a name="mime"></a>
## MIMEタイプを取得

#### 拡張子と関連付けられたMIMEタイプを取得

	echo File::mime('gif');

> **注目：**このメソッドは**application/config/mimes.php**で定義されている、拡張子のMIMEタイプを返すだけです。

<a name="cpdir"></a>
## ディレクトリーのコピー

#### 指定された場所のディレクトリーを再帰的にコピー

	File::cpdir($directory, $destination);

<a name="rmdir"></a>
## ディレクトリーの削除

#### 再帰的なディレクトリーの削除

	File::rmdir($directory);