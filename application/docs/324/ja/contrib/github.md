# GitHubのLaravel

## 内容

- [基本](#the-basics)
- [リポジトリー](#repositoriess)
- [ブランチ](#branches)

<a name="the-basics"></a>
## 基本

Laravelの開発とソース管理はGitHubで行われているので、誰でも貢献することが可能です。誰でもバグを修正し、機能を追加し、ドキュメントを改善できます。

プロジェクトに修正が提出されると、Laravelチームはその変更をレビューし、Laravelのコアに取り入れるか決定します。

<a name="repositories"></a>
## リポジトリー

LaravelのGitHubのホームは[github.com/laravel](https://github.com/laravel)です。Laravel has several repositories. 基本的に貢献するには、**laravel**リポジトリ、だけに注意を払っておけば十分です。

<a name="branches"></a>
## ブランチ

**Laravel**リポジトリは複数のブランチを持っており、それぞれ別の目的を持っています。

- **master** - これはLaravelのリリースブランチです。このブランチでは開発中のものを含みません。このブランチには最新で、安定版のLaravelコアコードだけです。Laravelを[laravel.com](http://laravel.com/)からダウンロードする時、このマスターブランチから直接ダウンロードしているのです。*このブランチに対しては、プルリクエストをしてはいけません。*
- **staging** - これが何かはっきりわかりませんが…developをmasterにプッシュする直前の最終テスト版でしょうか？
- **develop** - これは開発作業用のブランチです。 コードの変更やコミュニティによる貢献など全ての提案は、このブランチへpullします。Laravelプロジェクトへプルリクエストをするのでしたら、このブランチへ希望するプルリクエストを行なってください。

一度、明確なマイルストーンに到達する、そして／もしくはTaylor OtwellとLaravelチームが現在の開発ブランチの安定性と追加機能にハッピーと感じたら、**develop**ブランチを、**master**ブランチへプルし、最新の安定版Laravelを世界中で使ってもらうために、リリースします。

*参照*

 - [コマンドラインでLaravelに貢献する](docs/contrib/command-line)
 - [TortoiseGitを使用し、Laravelに貢献する](docs/contrib/tortoisegit)
