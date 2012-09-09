# 文字列の使用

## 内容

- [大文字小文字変換など](#capitalization)
- [文字数と語数](#limits)
- [ランダム文字列の生成](#random)
- [単数形と複数形](#singular-and-plural)
- [スラグ](#slugs)

<a name="capitalization"></a>
## 大文字小文字変換など

**Str**クラスは文字変換を行う３つの便利なメソッド、**uppper**、**lower**、**title**を提供しています。これら３つはPHPの[strtoupper](http://php.net/manual/ja/function.strtoupper.php)、[strtolower](http://php.net/manual/ja/function.strtolower.php)、[ucwords](http://php.net/manual/ja/function.ucwords.php)メソッドをより賢くしたバージョンです。どこが賢いかといえば、[マルチバイト文字列](http://php.net/manual/ja/book.mbstring.php)PHP拡張があなたのWebサーバーにインストールされていれば、UTF-8を処理できるようになっています。使用方法は、単に文字列をメソッドに渡すだけです。

	echo Str::lower('I am a string.');

	echo Str::upper('I am a string.');

	echo Str::title('I am a string.');

<a name="limits"></a>
## 文字数と語数

#### 文字列の文字数を制限

	echo Str::limit($string, 10);
	echo Str::limit_exact($string, 10);

#### 文字列の語数を制限

	echo Str::words($string, 10);

<a name="random"></a>
## ランダム文字列の生成

#### 英数字のランダム文字列を生成

	echo Str::random(32);

#### 英文字のランダム文字列を生成

	echo Str::random(32, 'alpha');

<a name="singular-and-plural"></a>
## 単数形と複数形

Strクラスは単数形と複数形の変換もできます。

#### 複数形を取得

	echo Str::plural('user');

#### 単数形を取得

	echo Str::singular('users');

#### 指定された数字が２以上であれば、複数形を返す

	echo Str::plural('comment', count($comments));

<a name="slugs"></a>
## スラグ

#### URLフレンドリーなスラグを生成

	return Str::slug('My First Blog Post!');

#### 与えられたセパレーターを使用し、URLフレンドリーなスラグを生成

	return Str::slug('My First Blog Post!', '_');

