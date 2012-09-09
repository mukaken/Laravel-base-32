# TortoiseGitでLaravelに貢献する

## 内容

- [始めよう](#getting-started)
- [LaravelをForkする](#forking-laravel)
- [Laravelをクローンする](#cloning-laravel)
- [Forkを追加する](#adding-your-fork)
- [ブランチを作成する](#creating-branches)
- [コミット](#committing)
- [プルリクエストを送る](#submitting-a-pull-request)
- [次は何？](#whats-next)

<a name="getting-started"></a>
## 始めよう

このチュートリアルは[GitHub](https://github.com/)上のプロジェクトにWindowsの[TortoiseGit](http://code.google.com/p/tortoisegit/)を用い貢献する方法を説明しています。ワークフローはGitHub上のほとんどのプロジェクトに対して適用できますが、今回は特に[Laravel](https://github.com/laravel/laravel)プロジェクトに焦点をあわせていきます。

このチュートリアルの前提はTortoiseGit for Windowsがインストール済みで、[GitHub account](https://github.com/signup/free)にアカウントを作成していることです。（翻訳注：以降のTortoiseGitの説明は公式サイトで配布されている日本語言語ファイルインストーラーを適用し、言語表示を日本語に設定している前提で翻訳しています。） もし、まだご覧になっていなければ、[GitHubのLaravel](/docs/contrib/github)ドキュメントをご覧になり、Laravelのリポジトリーとブランチを理解しておいてください。

<a name="forking-laravel"></a>
## LaravelをForkする

GitHubにログインし、[Laravelリポジトリー](https://github.com/laravel/laravel)を訪れてください。**Fork**ボタンをクリックします。これにより、あなた自身のGitHubアカウントにLaravelのフォーク（プロジェクトの分岐）が作成されます。あなたのLaravelフォークは**https://github.com/username/laravel**に置かれます。（*username*はあなたのGitHubユーザー名に置き換えてください。）

<a name="cloning-laravel"></a>
## Laravelをクローンする

Windowsのエクスプローラーを開き、Laravelへの変更を開発するための、新しいディレクトリーを作成してください。

 - Laravelのディレクトリーを右クリックし、コンテキストメニューを開きます。**Gitクローン…**をクリックします。
 - Git clone
  - **Url:** https://github.com/laravel/laravel.git
  - **ディレクトリ:**直前のステップで作成したディレクトリー
  - **OK**をクリック

> **注目：**（あなたの作成したフォークではなく）Laravelのオリジナルリポジトリーをクローンした理由は、あなたのローカルリポジトリーにLaravelのリポジトリーから最新の変更をいつでも取り込める(pull)ようにするためです。

<a name="adding-your-fork"></a>
## Forkを追加する

クローンが終了したら、あなたのフォーク（プロジェクトの分岐）を**リモートリポジトリー**として追加しましょう。

 - Laravelディレクトリーを右クリックし、**TortoinseGit → 設定**を選んでください。
 - **Git/リモート**セクションを選びます。Add a new remote:
  - **リモート**: fork
  - **URL**: https://github.com/username/laravel.git
  - **新規に追加／保存**をクリック
  - **OK**をクリック

**username**を自分のGitHubユーザー名に置き換えるのをお忘れなく大文字小文字は区別されます。

<a name="creating-branches"></a>
## ブランチを作成する

では、新しい機能かバグ修正のために、新しいブランチを作成し、準備をしましょう。新しいブランチを作成するときは、便利ですからわかりやすい名前をつけてください。例えば、Eloquentのバグを修正するのでしたら、*bug/eloquent*と名づけましょう。もしくは、例えばローカライズのためのドキュメントを変更をしたいのでしたら、*feature/localization-docs*と名付けます。良いネーミング規則は組織と強調し、あなたのブランチの目的を他の人が理解するのを助けます。

 - Laravelディレクトリーを右クリックし、TortoiseGit → ブランチを作成を選んでください。
  - **ブランチ:** feature/localization-docs
  - **基点 → ブランチ：** remotes/origin/develop
  - **チェック** *追跡*
  - **チェック** *新しいブランチに切り替える*
  - **OK**をクリック

これで新しい*feature/localization-docs*ブランチが作成され、これに切り替えられます。

> **注意：**新しい機能やバグフィックス毎に、新しいブランチを作成してください。これは組織に協力することです。機能／修正が限定的で独立していれば、Laravelチームはコアに変更を取り込みやすくなります。

これで、自分のブランチを作成し、それに切り替えました。では、コアの変更にとりかかりましょう。新しい変更を付け加えるか、バグを修正してください。

<a name="committing"></a>
##コミット

変更部分のコーディングとテストを終えたら、次はローカルリポジトリーにコミットします。:

 - Laravelディレクトリーを右クリックし、**Gitコミット -> "feature/localization-docs"...**を選びます。
 - コミット
  - **メッセージ：**付け加えたもの、変更したものの簡単な説明
  - **Signed-off-byを追加**をクリック - これにより、Laravelコアに追加しようとしているあなたのコードに対し、あなた自身が追加に賛成していることを、Laravelチームに知らせます。
  - **変更した項目：** すべての追加／変更ファイルをチェックする
  - **OK**をクリック

<a name="pushing-to-your-fork"></a>
## フォークにプッシュする

これであなたのローカルリポジトリーに変更がコミットされました。次に、GitHubのあなたのフォークに対し、新しいブランチをpush（もしくはsync）します。

- Laravelディレクトリーを右クリックし、**Git同期…**を選びます。
- Git同期
 - **ローカルブランチ** feature/localization-docs
 - **リモートブランチ** 空白にする
 - **リモート** fork
 - **プッシュ**をクリック
 - "username:"を尋ねられたら、Githubのユーザー名を*大文字小文字そのまま*で入力します。
 - "password:"を尋ねられたら、Githubのパスワードを*大文字小文字そのまま*で入力します。

これでGitHubのあなたのフォークにブランチがpushされました。

<a name="submitting-a-pull-request"></a>
## プルリクエストを送る

最後のステップはLaravelリポジトリにプルリクエストを送ることです。これはLaravelチームに対し、あなたのLaravelコアの修正をpull、mergeするようにリクエストすることを意味します。ブラウザであなたのフォーク、[https://github.com/username/laravel](https://github.com/username/laravel)を訪れてください。**Pull Request**をクリックしてください。次は、慎重にリポジトリのベースとヘッド、ブランチを選択します。

 - **base repo:** laravel/laravel
 - **base branch:** develop
 - **head repo:** username/laravel
 - **head branch:** feature/localization-docs

なぜあなたがこの変更を作成したのか、更に細かい説明をフォームに書き入れてください。最後に、**Send pull request**をクリックします。これでおしまいです！変更はLaravelチームに送られました。

<a name="whats-next"></a>
## 次は何？

付け加えたい新しい機能か修正したいバグが、他にもありますか？前の[ブランチを作成する](#creating-branches)セクションの指示と同じことを行なってください。全ての機能追加や修正ごとに新しいブランチを作成すること、そしていつでも新しいブランチは*remotes/origin/develop*ブランチから作成することを覚えておいてください。
