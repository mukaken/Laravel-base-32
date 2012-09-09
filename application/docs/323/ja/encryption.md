# 暗号化

## 内容

- [基本](#the-basics)
- [文字列の暗号化](#encrypt)
- [文字列の復元](#decrypt)

<a name="the-basics"></a>
## 基本

Laravelの**Crypter**クラスは、セキュアな復元可能暗号化を扱うシンプルなインターフェイスを提供します。デフォルトでCrypterクラスは、強固なAES-256暗号化と復元をMcrypt PHP拡張を通して提供しています。

> **注目：**サーバーにMcrypt PHP拡張をインストールするのを忘れないでください。

<a name="encrypt"></a>
## 文字列の暗号化

#### 与えら得た文字列を暗号化する

	$encrypted = Crypter::encrypt($value);

<a name="decrypt"></a>
## 文字列の復元

#### 文字列を復元する

	$decrypted = Crypter::decrypt($encrypted);

> とても重要なのは、暗号化メソッドは、文字列の暗号化と復元に、**あなたの**アプリケーションキーを使用していると言うことです。