s+Laravel's \*\*Crypter\*\* class provides a simple interface for handling secure, two-way encryption\. +Laravelの**Crypter**クラスは、セキュアな復元可能暗号化を扱うシンプルなインターフェイスを提供します。+

s+By default, the Crypter class provides strong AES-256 encryption and decryption out of the box via the Mcrypt PHP extension\.+デフォルトでCrypterクラスは、強固なAES-256暗号化と復元をMcrypt PHP拡張を通して提供しています。+

s+\*\*Note:\*\* Don't forget to install the Mcrypt PHP extension on your server\.+**注目：**サーバーにMcrypt PHP拡張をインストールするのを忘れないでください。+

s+Encrypting a given string:+与えら得た文字列を暗号化する+

s+Decrypting a string:+文字列を復元する+

s+\*\*Note:\*\* It's incredibly important to point out that the decrypt method will only decrypt strings that were encrypted using \*\*your\*\* application key\.+とても重要なのは、暗号化メソッドは、文字列の暗号化と復元に、**あなたの**アプリケーションキーを使用していると言うことです。+
