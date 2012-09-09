# コマンドラインでLaravelに貢献する

## 内容
 - [始めよう](#getting-started)
 - [LaravelをForkする](#forking-laravel)
 - [Laravelをクローンする](#cloning-laravel)
 - [Forkを追加する](#adding-your-fork)
 - [ブランチを作成する](#creating-branches)
 - [コミットする](#committing)
 - [プルリクエストを送る](#submitting-a-pull-request)
 - [次は何？](#whats-next)

<a name='getting-started'></a>
## 始めよう

このチュートリアルはコマンドラインを使用し、[GitHub](https://github.com/)のプロジェクトに貢献する基礎を説明しています。ワークフローはGitHub上のほとんどのプロジェクトに対して適用できますが、今回は特に[Laravel](https://github.com/laravel/laravel)プロジェクトに焦点をあわせていきます。このチュートリアルはOSX、Linux、Windowsに適用しています。

このチュートリアルの前提は[Git](http://git-scm.com/)がインストール済みで、[GitHub](https://github.com/signup/free)にアカウントを作成していることです。もし、まだご覧になっていなければ、[GitHubのLaravel](/docs/contrib/github)ドキュメントをご覧になり、Laravelのリポジトリーとブランチを理解しておいてください。

<a name='forking-laravel'></a>
## LaravelをForkする

GitHubにログインし、[Laravelリポジトリー](https://github.com/laravel/laravel)を訪れてください。**Fork**ボタンをクリックします。これにより、あなた自身のGitHubアカウントにLaravelのフォーク（プロジェクトの分岐）が作成されます。あなたのLaravelフォークは**https://github.com/username/laravel**に置かれます。（*username*はあなたのGitHubユーザー名に置き換えてください。）

<a name='cloning-laravel'></a>
## Laravelをクローンする

コマンドラインか端末を開き、Laravelの開発修正を行う新しいディレクトリーを作成します。

	# mkdir laravel-develop
	# cd laravel-develop

次に、Laravelリポジトリーをクローンします。（あなたの作成したフォークではありません。）

	# git clone https://github.com/laravel/laravel.git .

> **注目：**（あなたの作成したフォークではなく）Laravelのオリジナルリポジトリーをクローンした理由は、あなたのローカルリポジトリーにLaravelのリポジトリーから最新の変更をいつでも取り込める(pull)ようにするためです。

<a name='adding-your-fork'></a>
## Forkを追加する

次に、あなたの作成したフォークを**リモートリポジトリ**として追加します。

	# git remote add fork git@github.com:username/laravel.git

**username**をあなたのGitHubユーザー名に置き換えるのを忘れないでください。*大文字・小文字も間違えないように。*追加したあなたのフォークを確認するには：

	# git remote

これで、Laravelリポジトリーの真新しいクローンしたのに加え、あなたのフォークをリモートリポジトリにできました。新しい機能を付け加えたり、バグを修正する用意ができました。

<a name='creating-branches'></a>
## ブランチを作成する

最初に、**develop**ブランチで作業していることを確認してください。もし**master**ブランチに変更を送信してしまうと、残念なことに、近い将来取り除かれてしまいます。この理由については[GitHubのLaravel](/docs/contrib/github)をお読みください。developブランチに切り替えるには：

	# git checkout develop

次に、最新のLaravelリポジトリにアップデートしてください。もし新しい機能やバグの修正をあなたのクローンしたLaravelプロジェクトに付け加えるのでしたら、それらの変更を確実にローカルリポジトリに全て含めてください。これが重要なステップなのは、あなたのフォークの代わりに、オリジナルのLaravelリポジトリーからクローンしているからです。

	# git pull origin develop

では、新しい機能かバグ修正のために、新しいブランチを作成し、準備をしましょう。新しいブランチを作成するときは、便利ですからわかりやすい名前をつけてください。例えば、Eloquentのバグを修正するのでしたら、*bug/eloquent*と名づけましょう。

	# git branch bug/eloquent
	# git checkout bug/eloquent
	Switched to branch 'bug/eloquent'

もしくは、例えばローカライズのためのドキュメントのように、作成するものに対する新しいドキュメントを付け加えたり、変更をしたいのでしたら：

	# git branch feature/localization-docs
	# git checkout feature/localization-docs
	Switched to branch 'feature/localization-docs'

> **注意：**新しい機能やバグフィックス毎に、新しいブランチを作成してください。これは組織に協力することです。機能／修正が限定的で独立していれば、Laravelチームはコアに変更を取り込みやすくなります。

これで、自分のブランチを作成し、それに切り替えました。では、コアの変更にとりかかりましょう。新しい変更を付け加えるか、バグを修正してください。

<a name='committing'></a>
## コミットする

コーディングと変更に対するテストが終了したら、次にローカルリポジトリにコミットしましょう。最初に、追加／修正したファイルをaddします。

	# git add laravel/documentation/localization.md

次に、リポジトリーに変更をコミットします。

	# git commit -s -m "I added some more stuff to the Localization documentation."

 - **-s**はあなたの名前でコミットを承認することを意味します。これはLaravelチームにLaravelコアにあなたのコードを付け加えることに、あなたが個人的に同意していると、伝えることになります。
 - ***-m*はコミットする内容のメッセージです。何を付け加えたのか、修正したのかを簡単に説明します。

<a name='pushing-to-your-fork'></a>
## フォークにプッシュする

これであなたのローカルリポジトリーに変更がコミットされました。次に、GitHubのあなたのフォークに対し、新しいブランチをpush（もしくはsync）します。

	# git push fork feature/localization-docs

これでGitHubのあなたのフォークにブランチがpushされました。

<a name='submitting-a-pull-request'></a>
## プルリクエストを送る

最後のステップはLaravelリポジトリにプルリクエストを送ることです。これはLaravelチームに対し、あなたのLaravelコアの修正をpull、mergeするようにリクエストすることを意味します。ブラウザであなたのフォーク、[https://github.com/username/laravel](https://github.com/username/laravel)を訪れてください。**Pull Request**をクリックしてください。次は、慎重にリポジトリのベースとヘッド、ブランチを選択します。

 - **base repo:** laravel/laravel
 - **base branch:** develop
 - **head repo:** username/laravel
 - **head branch:** feature/localization-docs

なぜあなたがこの変更を作成したのか、更に細かい説明をフォームに書き入れてください。最後に、**Send pull request**をクリックします。これでおしまいです！変更はLaravelチームに送られました。

<a name='whats-next'></a>
## 次は何？

付け加えたい新しい機能か修正したいバグが、他にもありますか？最初に、いつもあなたの新しいブランチのbaseはdevelopブランチから確実に初めます。

	# git checkout develop

それから、Laravelのリポジトリから最新の変更をpullしましょう。

	# git pull origin develop

これで、新しいブランチを作成し、再度コーディングをスタートする用意ができました！

> [Jason Lewis](http://jasonlewis.me/)のブログポスト、[GitHubプロジェクトに貢献する](http://jasonlewis.me/blog/2012/06/how-to-contributing-to-a-github-project)がこの記事の主要なヒントとなりました。
