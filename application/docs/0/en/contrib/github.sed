s+Because Laravel's development and source control is done through GitHub, anyone is able to make contributions to it\. +Laravelの開発とソース管理はGitHubで行われているので、誰でも貢献することが可能です。+
s+Anyone can fix bugs, add features or improve the documentation\.+誰でもバグを修正し、機能を追加し、ドキュメントを改善できます。+

s+After submitting proposed changes to the project, the Laravel team will review the changes and make the decision to commit them to Laravel's core\.+プロジェクトに修正が提出されると、Laravelチームはその変更をレビューし、Laravelのコアに取り入れるか決定します。+

s+Laravel's home on GitHub is at \[github.com/laravel\](https://github.com/laravel)\. +LaravelのGitHubのホームは[github.com/laravel](https://github.com/laravel)です。+
s+Laravel has several repositories/. +Laravelはいくつかのリポジトリを持っています。+
s+For basic contributions, the only repository you need to pay attention to is the \*\*laravel\*\* repository, located at \[github.com/laravel/laravel\](https://github.com/laravel/laravel)\.+基本的に貢献するには、**laravel**リポジトリ、だけに注意を払っておけば十分です。+


s+The \*\*laravel\*\* repository has multiple branches, each serving a specific purpose:+**Laravel**リポジトリは複数のブランチを持っており、それぞれ別の目的を持っています。+

s+\*\*master\*\* - This is the Laravel release branch. +**master** - これはLaravelのリリースブランチです。+
s+Active development does not happen on this branch. +このブランチでは開発中のものを含みません。+
s+This branch is only for the most recent, stable Laravel core code. +このブランチには最新で、安定版のLaravelコアコードだけです。+
s+When you download Laravel from \[laravel.com\](http://laravel.com/), you are downloading directly from this master branch. +Laravelを[laravel.com](http://laravel.com/)からダウンロードする時、このマスターブランチから直接ダウンロードしているのです。+
s+\*Do not make pull requests to this branch.\*+*このブランチに対しては、プルリクエストをしてはいけません。*+

s+\*\*staging\*\* - I'm not sure what this is for... Last minute testing before pushing develop to master?+**staging** - これが何かはっきりわかりませんが…developをmasterにプッシュする直前の最終テスト版でしょうか？+

s+\*\*develop\*\* - This is the working development branch.+**develop** - これは開発作業用のブランチです。+
s+All proposed code changes and contributions by the community are pulled into this branch. +コードの変更やコミュニティによる貢献など全ての提案は、このブランチへpullします。+
s+*When you make a pull request to the Laravel project, this is the branch you want to pull-request into.*+Laravelプロジェクトへプルリクエストをするのでしたら、このブランチへ希望するプルリクエストを行なってください。+

s+Once certain milestones have been reached and/or Taylor Otwell and the Laravel team is happy with the stability and additional features of the current development branch, the changes in the \*\*develop\*\* branch are pulled into the \*\*master\*\* branch, thus creating and releasing the newest stable version of Laravel for the world to use\.+一度、明確なマイルストーンに到達する、そして／もしくはTaylor OtwellとLaravelチームが現在の開発ブランチの安定性と追加機能にハッピーと感じたら、**develop**ブランチを、**master**ブランチへプルし、最新の安定版Laravelを世界中で使ってもらうために、リリースします。+

s+\*Further Reading\*+*参照*+

s+\[Contributing to Laravel via Command-Line\](docs/contrib/command-line)+[コマンドラインでLaravelに貢献する](docs/contrib/command-line)+
s+\[Contributing to Laravel using TortoiseGit\](docs/contrib/tortoisegit)+[TortoiseGitを使用し、Laravelに貢献する](docs/contrib/tortoisegit)+


s+Pull Requests+プルリクエスト+

s+\[GitHub pull requests\](https://help.github.com/articles/using-pull-requests) are a great way for everyone in the community to contribute to the Laravel codebase\. +[GitHub プルリクエスト](https://help.github.com/articles/using-pull-requests)はLaravelのコミュニティの全員がLaravelのコードベースに貢献できる素晴らしい方法です。+

s+Found a bug? Just fix it in your fork and submit a pull request\. +バグを発見しましたか？あなたのフォークで修正し、プルリクエストを送ってください。+

s+This will then be reviewed, and, if found as good, merged into the main repository\.+これはレビューされ、良ければメインリポジトリーにマージされます。+


s+In order to keep the codebase clean, stable and at high quality, even with so many people contributing, some guidelines are necessary for high-quality pull requests:+多くの人々の貢献により、コードベースをきれいで安定したまま高品質に保つために、高品質なプルリクエストのガイドラインが必要とされます。+

s+\*\*Branch:\*\* Unless they are immediate documentation fixes relevant for old versions, pull requests should be sent to the `develop` branch only. +**ブランチ：**旧バージョンに関連した、急ぎのドキュメント修正でない限り、プルリクエストは`develop`ブランチだけに送ってください。+

s+Make sure to select that branch as target when creating the pull request (GitHub will not automatically select it\.)+プルリクエストを送るときは、このブランチがターゲットとして選ばれているか確認してください。（GitHubは自動的に選びません。）+

s+\*\*Documentation:\*\* If you are adding a new feature or changing the API in any relevant way, this should be documented\. +**ドキュメント：**新しい機能を追加する、またはAPIを適切に変更する場合は、ドキュメントも修正してください。+

s+The documentation files can be found directly in the core repository\.+ドキュメントのファイルはコアリポジトリに含まれています。+

s+\*\*Unit tests:\*\* To keep old bugs from re-appearing and generally hold quality at a high level, the Laravel core is thoroughly unit-tested. +**ユニットテスト：**古いバグが再現したり、全体的な品質を高く保つため、Laravelのコアはユニットテストを通しています。+

s+Thus, when you create a pull request, it is expected that you unit test any new code you add\. +ですから、プルリクエストを作成するときには、あなたの追加した新しいコードについてユニットテストが期待されています。+

s+For any bug you fix, you should also add regression tests to make sure the bug will never appear again\. +どんなバグ修正であっても、そのバグが再度発生しないことを確実にするために、リグレッションテストを追加してください。+

s+If you are unsure about how to write tests, the core team or other contributors will gladly help\.+どうテストを書いたら良いのかよくわからないときは、コアチームもしくは他のコントリビューターの皆さんが快くお手伝いします。+


s+Repositories+リポジトリー+
s+Branches+ブランチ+

s+Contributing to Laravel via Command-Line+コマンドラインでLaravelに貢献する+
s+Contributing to Laravel using TortoiseGit+TortoiseGitでLaravelに貢献する+