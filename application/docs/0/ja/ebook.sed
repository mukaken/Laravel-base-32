# アンカーを削除
#/^<a name/ d
# 多分、awkで #anc は#file-name/ancに変換、 docs/file-name#ancは#file-name/ancに変換
# awkで作成し直す
# ドキュメント内部へのリンクを変換
#s+](/docs+](http://laravel.kore1server.com/docs+g
#s+](docs+](http://laravel.kore1server.com/docs+g

# ほとんどのmdの先頭のリンクを削除
/^## 内容/,/^## / {
#/^$/,/^$/ d
/^- / d
/^## 内容/ d
}

# /home.mdの最初のリンクを削除
2,/^## 初めに/ {
3, /^$/ d
}

# changes.mdの後半不要部分を削除
/^## Laravel 3.2$/,$ d

# validation.mdの各バリデーションへのリンクを削除
/^## バリデーションルール/,/^#/ {
/^- / d
}

# >(block quate)をA>(aside)に変換
s/^> /A> /

# <br>タグを削除
/<br>/ d

# <small></small>を削除
s+<small>++
s+</small>++

# Web版と電子書籍版の違いを変換
s+# Laravelドキュメント+# 概要+
s+このフォーラム投稿に接続方法が説明されています。+Laravelのフォーラム記事に接続方法が説明されています。+

# パス名がPDFではみ出すバグのため、行を分ける
s+\*\*/Users/JonSnow/Sites/MySite\*\*へインストールされて、ドキュメントルートには\*\*/Users/JonSnow/Sites/MySite/public\*\*を指定していることに注目してください。+**/Users/JonSnow/Sites/MySite\*\*へインストールされて、ドキュメントルートには\
**/Users/JonSnow/Sites/MySite/public\*\*を指定していることに注目してください。+

# ヘッダーの英数字を全角に変換
/^#/ {
y/ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789().'"/ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ０１２３４５６７８９（）．’”/
}

/\[（追加情報）\]/ {
y/ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ０１２３４５６７８９（）．’”/ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789().'"/
}

# テーブルの変換 縦棒を空白へ

# database/scheme.md

/Fluentテーブルビルダーのメソッドは、特定のベンダーのSQLを使用せず、カラムを追加できます。まずはメソッドです。見て行きましょう。/,/^#/ {
s/.\+|.\+/|&|/
}

/もし別の行でインデックスを定義するなら、もっと様々な指定ができます。インデックスメソッドの例をご覧ください。/,/^#/ {
s/.\+|.\+/|&|/
}

/インデックスしているカラムの名前、それからインデックスのタイプです。例をご覧ください。/,/^#/ {
s/.\+|.\+/|&|\
|------------- | -------------|/
}
s+|`$table->drop_fulltext ('profile_description_fulltext');`  |  "profile"テーブルから、フルテキストインデックスを削除|+|`$table->drop_fulltext `  |  "profile"テーブルから、|\
|`('profile_description_fulltext');`|フルテキストインデックスを削除|+

# artisan/commands.md

/^# Ａｒｔｉｓａｎコマンド/,$ {
s/.\+|.\+/|&|/
}

s+|セキュアーなアプリケーションキーを生成\*\*config/application.php\*\*のapplication keyが空文字列の場合、キーを生成する| `php artisan key:generate`|+|セキュアーなアプリケーションキーを生成| `php artisan key:generate`|\
|**config/application.php**のapplication keyが空文字列の場合、キーを生成する||+