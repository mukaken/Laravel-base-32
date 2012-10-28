s+Contributing to Laravel using TortoiseGit+TortoiseGitでLaravelに貢献する+

# Copy from command-line.sed


s+This tutorial explains the basics of contributing to a project on \[GitHub\](https://github.com/) via the command-line. +このチュートリアルはコマンドラインを使用し、[GitHub](https://github.com/)のプロジェクトに貢献する基礎を説明しています。+

s+The workflow can apply to most projects on GitHub, but in this case, we will be focused on the \[Laravel\](https://github.com/laravel/laravel) project. +ワークフローはGitHub上のほとんどのプロジェクトに対して適用できますが、今回は特に[Laravel](https://github.com/laravel/laravel)プロジェクトに焦点をあわせていきます。+

s+This tutorial is applicable to OSX, Linux and Windows.+このチュートリアルはOSX、Linux、Windowsに適用しています。+

s+This tutorial assumes you have installed \[Git\](http://git-scm.com/) and you have created a \[GitHub account\](https://github.com/signup/free). +このチュートリアルの前提は[Git](http://git-scm.com/)がインストール済みで、[GitHub account](https://github.com/signup/free)にアカウントを作成していることです。+

s+If you haven't already, look at the \[Laravel on GitHub\](/docs/contrib/github) documentation in order to familiarize yourself with Laravel's repositories and branches.+もし、まだご覧になっていなければ、[GitHubのLaravel](/docs/contrib/github)ドキュメントをご覧になり、Laravelのリポジトリーとブランチを理解しておいてください。+



s+Login to GitHub and visit the \[Laravel Repository\](https://github.com/laravel/laravel). +GitHubにログインし、[Laravelリポジトリー](https://github.com/laravel/laravel)を訪れてください。+

s+Click on the \*\*Fork\*\* button. +**Fork**ボタンをクリックします。+

s+This will create your own fork of Laravel in your own GitHub account. +これにより、あなた自身のGitHubアカウントにLaravelのフォーク（プロジェクトの分岐）が作成されます。+

s+Your Laravel fork will be located at \*\*https://github.com/username/laravel\*\* (your GitHub username will be used in place of \*username\*).+あなたのLaravelフォークは**https://github.com/username/laravel**に置かれます。（*username*はあなたのGitHubユーザー名に置き換えてください。）+


s+Open up the command-line or terminal and make a new directory where you can make development changes to Laravel:+コマンドラインか端末を開き、Laravelの開発修正を行う新しいディレクトリーを作成します。+

s+Next, clone the Laravel repository (not your fork you made):+次に、Laravelリポジトリーをクローンします。（あなたの作成したフォークではありません。）+

s+\*\*Note\*\*: The reason you are cloning the original Laravel repository (and not the fork you made) is so you can always pull down the most recent changes from the Laravel repository to your local repository.+**注目：**（あなたの作成したフォークではなく）Laravelのオリジナルリポジトリーをクローンした理由は、あなたのローカルリポジトリーにLaravelのリポジトリーから最新の変更をいつでも取り込める(pull)ようにするためです。+



s+Next, it's time to add the fork you made as a \*\*remote repository\*\*:+次に、あなたの作成したフォークを**リモートリポジトリ**として追加します。+

s+Remember to replace \*username\*\* with your GitHub username. +**username**をあなたのGitHubユーザー名に置き換えるのを忘れないでください。+
s+\*This is case-sensitive\*. +*大文字・小文字も間違えないように。*+
s+You can verify that your fork was added by typing:+追加したあなたのフォークを確認するには：+


s+Now you have a pristine clone of the Laravel repository along with your fork as a remote repository. +これで、Laravelリポジトリーの真新しいクローンしたのに加え、あなたのフォークをリモートリポジトリにできました。+
s+You are ready to begin branching for new features or fixing bugs.+新しい機能を付け加えたり、バグを修正する用意ができました。+



s+First, make sure you are working in the \*\*develop\*\* branch\. +最初に、**develop**ブランチで作業していることを確認してください。+
s+If you submit changes to the \*\*master\*\* branch, it is unlikely they will be pulled in anytime in the near future\. +もし**master**ブランチに変更を送信してしまうと、残念なことに、近い将来取り除かれてしまいます。+
s+For more information on this, read the documentation for \[Laravel on GitHub\](/docs/contrib/github)\. +この理由については[GitHubのLaravel](/docs/contrib/github)をお読みください。+
s+To switch to the develop branch:+developブランチに切り替えるには：+


s+Next, you want to make sure you are up-to-date with the latest Laravel repository\. +次に、最新のLaravelリポジトリにアップデートしてください。+
s+If any new features or bug fixes have been added to the Laravel project since you cloned it, this will ensure that your local repository has all of those changes\. +もし新しい機能やバグの修正をあなたのクローンしたLaravelプロジェクトに付け加えるのでしたら、それらの変更を確実にローカルリポジトリに全て含めてください。+
s+This important step is the reason we originally cloned the Laravel repository instead of your own fork\.+これが重要なステップなのは、あなたのフォークの代わりに、オリジナルのLaravelリポジトリーからクローンしているからです。+


s+Now you are ready to create a new branch for your new feature or bug-fix\. +では、新しい機能かバグ修正のために、新しいブランチを作成し、準備をしましょう。+
s+When you create a new branch, use a self-descriptive naming convention\. +新しいブランチを作成するときは、便利ですからわかりやすい名前をつけてください。+
s+For example, if you are going to fix a bug in Eloquent, name your branch \*bug/eloquent\*:+例えば、Eloquentのバグを修正するのでしたら、*bug/eloquent*と名づけましょう。+



s+Or if there is a new feature to add or change to the documentation that you want to make, for example, the localization documentation:+もしくは、例えばローカライズのためのドキュメントのように、作成するものに対する新しいドキュメントを付け加えたり、変更をしたいのでしたら：+


s+\*\*Note:\*\* Create one new branch for every new feature or bug-fix\. +**注意：**新しい機能やバグフィックス毎に、新しいブランチを作成してください。+
s+This will encourage organization, limit interdependency between new features/fixes and will make it easy for the Laravel team to merge your changes into the Laravel core.+これは組織に協力することです。機能／修正が限定的で独立していれば、Laravelチームはコアに変更を取り込みやすくなります。+


s+Now that you have created your own branch and have switched to it, it's time to make your changes to the code\. +これで、自分のブランチを作成し、それに切り替えました。では、コアの変更にとりかかりましょう。+
s+Add your new feature or fix that bug\.+新しい変更を付け加えるか、バグを修正してください。+



s+Now that you have finished coding and testing your changes, it's time to commit them to your local repository\. +コーディングと変更に対するテストが終了したら、次にローカルリポジトリにコミットしましょう。+
s+First, add the files that you changed/added:+最初に、追加／修正したファイルをaddします。+


s+Next, commit the changes to the repository:+次に、リポジトリーに変更をコミットします。+


s+\*\*-s\*\* means that you are signing-off on your commit with your name\. +**-s**はあなたの名前でコミットを承認することを意味します。+
s+This tells the Laravel team know that you personally agree to your code being added to the Laravel core\.+これはLaravelチームにLaravelコアにあなたのコードを付け加えることに、あなたが個人的に同意していると、伝えることになります。+

s+\*\*-m\*\* is the message that goes with your commit\. +***-m*はコミットする内容のメッセージです。+
s+Provide a brief explanation of what you added or changed\.+何を付け加えたのか、修正したのかを簡単に説明します。+


s+Now that your local repository has your committed changes, it's time to push (or sync) your new branch to your fork that is hosted in GitHub:+これであなたのローカルリポジトリーに変更がコミットされました。次に、GitHubのあなたのフォークに対し、新しいブランチをpush（もしくはsync）します。+


s+Your branch has been successfully pushed to your fork on GitHub.+これでGitHubのあなたのフォークにブランチがpushされました。+



s+The final step is to submit a pull request to the Laravel repository\. +最後のステップはLaravelリポジトリにプルリクエストを送ることです。+
s+This means that you are requesting that the Laravel team pull and merge your changes to the Laravel core\. +これはLaravelチームに対し、あなたのLaravelコアの修正をpull、mergeするようにリクエストすることを意味します。+
s+In your browser, visit your Laravel fork at \[https://github.com/username/laravel\](https://github.com/username/laravel)\. +ブラウザであなたのフォーク、[https://github.com/username/laravel](https://github.com/username/laravel)を訪れてください。+
s+Click on \*\*Pull Request\*\*. +**Pull Request**をクリックしてください。+
s+Next, make sure you choose the proper base and head repositories and branches:+次は、慎重にリポジトリのベースとヘッド、ブランチを選択します。+

s+Use the form to write a more detailed description of the changes you made and why you made them\. +なぜあなたがこの変更を作成したのか、更に細かい説明をフォームに書き入れてください。+
s+Finally, click \*\*Send pull request\*\*. That's it! The changes you made have been submitted to the Laravel team.+最後に、**Send pull request**をクリックします。これでおしまいです！変更はLaravelチームに送られました。+

s+Do you have another feature you want to add or another bug you need to fix? +付け加えたい新しい機能か修正したいバグが、他にもありますか？+
s+First, make sure you always base your new branch off of the develop branch:+最初に、いつもあなたの新しいブランチのbaseはdevelopブランチから確実に初めます。+

s+Then, pull down the latest changes from Laravel's repository:+それから、Laravelのリポジトリから最新の変更をpullしましょう。+

s+Now you are ready to create a new branch and start coding again!+これで、新しいブランチをさくせし、再度コーディングをスタートする用意ができました！+

s+\[Jason Lewis\](http://jasonlewis.me/)'s blog post \[Contributing to a GitHub Project\](http://jasonlewis.me/blog/2012/06/how-to-contributing-to-a-github-project) was the primary inspiration for this tutorial\.+[Jason Lewis](http://jasonlewis.me/)のブログポスト、[Contributing to a GitHub Project](http://jasonlewis.me/blog/2012/06/how-to-contributing-to-a-github-project)がこの記事の主要なヒントとなりました。+

# End copy from command-line.sed

s+This tutorial explains the basics of contributing to a project on \[GitHub\](https://github.com/) using \[TortoiseGit\](http://code.google.com/p/tortoisegit/) for Windows. +このチュートリアルは[GitHub](https://github.com/)上のプロジェクトにWindowsの[TortoiseGit\](http://code.google.com/p/tortoisegit/)を用い貢献する方法を説明しています。+
s+The workflow can apply to most projects on GitHub, but in this case, we will be focused on the \[Laravel\](https://github.com/laravel/laravel) project.+ワークフローはGitHub上のほとんどのプロジェクトに対して適用できますが、今回は特に[Laravel](https://github.com/laravel/laravel)プロジェクトに焦点をあわせていきます。+

s+This tutorial assumes you have installed TortoiseGit for Windows and you have created a GitHub account.+このチュートリアルの前提はTortoiseGit for Windowsがインストール済みで、[GitHub account](https://github.com/signup/free)にアカウントを作成していることです。（翻訳注：以降のTortoiseGitの説明は公式サイトで配布されている日本語言語ファイルインストーラーを適用し、言語表示を日本語に設定している前提で翻訳しています。）+

s+Open up Windows Explorer and create a new directory where you can make development changes to Laravel.+Windowsのエクスプローラーを開き、Laravelへの変更を開発するための、新しいディレクトリーを作成してください。+

s+Right-click the Laravel directory to bring up the context menu. Click on \*\*Git Clone\.\.\.\*\*+Laravelのディレクトリーを右クリックし、コンテキストメニューを開きます。**Gitクローン…**をクリックします。+
s+\*\*Directory:\*\* the directory that you just created in the previous step+**ディレクトリ:**直前のステップで作成したディレクトリー+
s+Click \*\*OK\*\*+**OK**をクリック+

s+After the cloning process is complete, it's time to add the fork you made as a \*\*remote repository\*\*.+クローンが終了したら、あなたのフォーク（プロジェクトの分岐）を**リモートリポジトリー**として追加しましょう。+

s+Right-click the Laravel directory and goto \*\*TortoiseGit > Settings\*\*+Laravelディレクトリーを右クリックし、**TortoinseGit → 設定**を選んでください。+
s+Goto the \*\*Git/Remote\*\* section. +**Git/リモート**セクションを選びます。+
s+\*\*Remote\*\*: fork+**リモート**: fork+
s+Click \*\*Add New/Save\*\*+**新規に追加／保存**をクリック+
s+Click \*\*OK\*\*+**OK**をクリック+

s+Remember to replace \*username\* with your GitHub username\. +**username**を自分のGitHubユーザー名に置き換えるのをお忘れなく+
s+\*This is case-sensitive\*\.+大文字小文字は区別されます。+



s+For example, if you are going to fix a bug in Eloquent, name your branch \*bug/eloquent\*\. +例えば、Eloquentのバグを修正するのでしたら、*bug/eloquent*と名づけましょう。+

s+Or if you were going to make changes to the localization documentation, name your branch \*feature/localization-docs\*. +もしくは、例えばローカライズのためのドキュメントを変更をしたいのでしたら、*feature/localization-docs*と名付けます。+

s+A good naming convention will encourage organization and help others understand the purpose of your branch.+良いネーミング規則は組織と強調し、あなたのブランチの目的を他の人が理解するのを助けます。+


s+Right-click the Laravel directory and goto \*\*TortoiseGit > Create Branch\*\*+Laravelディレクトリーを右クリックし、TortoiseGit → ブランチを作成を選んでください。+

s+\*\*Branch:\*\* feature/localization-docs+**ブランチ:** feature/localization-docs+
s+\*\*Base On Branch:\*\* remotes/origin/develop+**基点 → ブランチ：** remotes/origin/develop+
s+\*\*Check\*\* \*Track\*+**チェック** *追跡*+
s+\*\*Check\*\* \*Switch to new branch\*+**チェック** *新しいブランチに切り替える*+

s+This will create your new \*feature/localization-docs\* branch and switch you to it.+これで新しい*feature/localization-docs*ブランチが作成され、これに切り替えられます。+

s+Now that you have finished coding and testing your changes, it's time to commit them to your local repository+変更部分のコーディングとテストを終えたら、次はローカルリポジトリーにコミットします。+

s+Right-click the Laravel directory and goto \*\*Git Commit -> "feature/localization-docs"...\*\*+Laravelディレクトリーを右クリックし、**Gitコミット -> "feature/localization-docs"...**を選びます。+

s+Committing+コミット+
s+Commit+コミット+
s+\*\*Message:\*\* Provide a brief explaination of what you added or changed+**メッセージ：**付け加えたもの、変更したものの簡単な説明+
s+Click \*\*Sign\*\* - This tells the Laravel team know that you personally agree to your code being added to the Laravel core+**Signed-off-byを追加**をクリック - これにより、Laravelコアに追加しようとしているあなたのコードに対し、あなた自身が追加に賛成していることを、Laravelチームに知らせます。+
s+\*\*Changes made:\*\* Check all changed/added files+**変更した項目：** すべての追加／変更ファイルをチェックする+


s+Right-click the Laravel directory and goto \*\*Git Sync...\*\*+Laravelディレクトリーを右クリックし、**Git同期…**を選びます。+
s+Git Syncronization+Git同期+
s+\*\*Local Branch:\*\* feature/localization-docs+**ローカルブランチ** feature/localization-docs+
s+\*\*Remote Branch:\*\* leave this blank+**リモートブランチ** 空白にする+
s+\*\*Remote URL:\*\* fork+**リモート** fork+
s+Click \*\*Push\*\*+**プッシュ**をクリック+
s+When asked for "username:" enter your GitHub \*case-sensitive\* username+"username:"を尋ねられたら、Githubのユーザー名を*大文字小文字そのまま*で入力します。+
s+When asked for "password:" enter your GitHub \*case-sensitive\* account+"password:"を尋ねられたら、Githubのパスワードを*大文字小文字そのまま*で入力します。+

s+Just follow the same instructions as before in the \[Creating Branches\](#creating-branches) section\. +前の[ブランチを作成する](#creating-branches)セクションの指示と同じことを行なってください。+
s+Just remember to always create a new branch for every new feature/fix and don't forget to always base your new branches off of the \*remotes/origin/develop\* branch\.+全ての機能追加や修正ごとに新しいブランチを作成すること、そしていつでも新しいブランチは*remotes/origin/develop*ブランチから作成することを覚えておいてください。+