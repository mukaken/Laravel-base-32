# Laravelドキュメント

- [初めに](#the-basics)
- [Laravelを楽しめるのは誰？](#who-will-enjoy-laravel)
- [Laravelはどこが違うの？](#laravel-is-different)
- [アプリケーション構造](#application-structure)
- [Laravelのコミュニティー](#laravel-community)
- [ライセンス情報](#laravel-license)

<a name="the-basics"></a>
## 初めに

Laravelのドキュメントへようこそ。 このドキュメントはスタートガイドとして、さらに特徴の紹介としても役立つように書かれています。 どこから読んでも学習できますが、以前に学んだ概念をもとに、その後に続くドキュメントは書かれていますので、初めから順番に読むことをお勧めします。

<a name="who-will-enjoy-laravel"></a>
## Laravelを楽しめるのは誰？

Laravelは柔軟性と読み書きしやすさを重視した、パワフルなフレームワークです。 初めてLaravelに触れる方は、人気がある軽量なPHPフレームワークを使用して開発する時と同じ、安らぎを感じるでしょう。 もうちょっと経験を積んだユーザーであれば、他のフレームワークではできない方法で、コードをモジュール化できることを評価するでしょう。 Laravelの柔軟性は、要求に何度でも応じ、アプリケーションを修正しながら、形作ることを可能にし、表現性はあなたとあなたのチームが開発するコードをシンプルで読みやすくしてくれるでしょう。


<a name="laravel-is-different"></a>
## Laravelはどこが違うの？

Laravelには他のフレームワークと違った特徴を数多く持っています。 特に重要な点をいくつか紹介しましょう。

- **バンドル**はLaravelのモジュールパッキングシステムです。 [Laravelバンドルリポジトリー](http://bundles.laravel.com/) は、アプリケーションへ簡単に機能を付け加えられるように、予め用意されています。 バンドルリポジトリーからbundlesディレクトリーにダウンロードしても良いですし、"Artisan"コマンドラインツールを使い、自動的にインストールすることもできます。
- **Eloquent ORM**は最も進化したPHPアクティブレコードを実装しています。  リレーションシップとネストされたeagerローディングで簡単に制約を適用できる能力を使えば、自分のデーターを完全にコントロールでき、アクティブレコードの便利さを十分に体験できるでしょう。 EloquentはLaravelのクエリービルダーであるFluentのメソッドを完全にサポートしています。
- **アプリケーションロジック**を（多くのWeb開発者にはお馴染みの）コントローラーでアプリケーションに実装することもできますし、またSinatraフレームワークと似たようなシンタックスを使い、ルートの定義に直接記述することもできます。 Laravelは小さなサイトから、巨大なエンタープライズアプリケーションまで、必要に応じて全て作成できるだけの柔軟性を開発者に提供する哲学で、設計されています。
- **リーバスルーティング**で名前付きのルートへリンクを作成できます。 リンクを作成するときにルートの名前を使えば、Laravelは自動的に正しいURIを挿入します。  これを使うことにより、後ほどルートを変更しても、Laravelがサイト中のリンク全部を適切に更新します。
- **Restコントローラー**はGETとPOSTのロジックを分ける一つの手法です。 例えばログインにおいて、コントローラーのget_login()アクションでフォームを担当させ、コントローラーのpost_login()アクションで、送信されたフォームを受け取り、バリデーションし、エラーメッセージと一緒にログインフォームにリダイレクトさせたり、各ユーザーのダッシュボードにリダイレクトさせたりできます。
- **クラスのオートロード**はオートロードの環境設定を保つ手間を省き、使用していない不必要なコンポーネントをロードしてしまうことを防げます。 ライブラリーやモジュールを使いたいのですか？  ローディングに悩むことはありません。どうぞ使ってください。 後はLaravelが面倒を見ます。
- **ビューコンポーサー**はビューがロードされた時点で実行されるコードブロックです。 良い例がブログのサイドナビに見られる、投稿をランダムにリスト表示するものです。 コンポーサーに、あなたの望みどおりにブログポストを読み込むロジックを書いておけば、ビューがロードされた時点で、準備は既に整っています。 これにより、メソッドのページコンテンツに関連する、ビューのモジュールで使用するデータのロードを、全てのコントローラー側で確実に行わなくてはならない手間を省くことができます。
- **IoCコンテナ**(Inversion of Control)は新しいオブジェクトを生成するメソッドを提供し、随意にインスタンスを生成したり、シングルトンでの使用をできるようにするものです。 IoCにより、外部ライブラリーの使用準備を行う必要は滅多になくなります。 また、きっちりと決まった柔軟性のないファイル構造に係わる必要はなく、IoCを使用したオブジェクトにはコードのどこからでもアクセスできることも意味しています。。 
- **マイグレーション**はデータベーススキーマのバージョンコントロールで、Laravelに直接統合されています。 生成も実行も"Artisan"コマンドラインユーティリティーを使用して行えます。 他のメンバーがスキーマを変更したら、リポジトリーからコピーをローカル環境に置き、マイグレーションを実行します。 すると、あなたのデータベースもアップデートされます！
- **ユニットテスト**はLaravelの大切な一部です。 Laravel自身も何百ものテストにより、新しい変更が予期せず他の部分を壊していないことを確認するために使っています。 これは、Laravelが業界で最も安定してるフレームワークであると考えられている理由の一つです。  さらにLaravelは皆さんが自分のコードにユニットテストを書くのを簡単にしてくれます。  その後で、"Artisan"コマンドユーティリティーを使いテストを実行できます。
- **自動ペジネーション**はアプリケーションロジックがペジネーションの設定のためにごちゃごちゃになることを防ぎます。 現在のページを得て、DBのレコード数を取得し、limit/offsetを使用してデーターをSELECTする代わりに、ただ"paginate"を呼び出し、ビューのどこにページリンクを出力するのかLaravelに教えて下さい。 Laravelは自動的に残りの面倒を見ます。Laravelのペジネーションシステムは簡単に使用でき、簡単に変更できるように設計されています。 強調しますが、Laravelがこれらを自動的に処理するからといっても、自分で呼び出したり、システムを設定できないわけではありません。そうしたければ、手動で行えます。

これは他のPHPフレームワークとの違いを示す、わずかな例にすぎません。 こうした特徴とその他すべて、このドキュメント全体を通して記述してあります。

<a name="application-structure"></a>
## アプリケーション構造

Laravelのディレクトリー構造は他の人気のあるPHPフレームワークと似せて設計されています。他のフレームワークで採用されている方法と似ている構造を使うことで、どんなアプリケーションでも、どんなサイズのものでも簡単に作成できます。

Laravelのアーキテクチャがユニークだからといっても、アプリケーションに合わせて、開発者が独自の構造を構築することも可能です。これはコンテントマネージメントシステムのような大きなプロジェクトに有効でしょう。 こうした柔軟な構造はLaravel独自なものです。

このドキュメントを通し、設置するのに最適なデフォルトの位置を指定していきたいと思います。

<a name="laravel-community"></a>
## Laravelのコミュニティー

 [Laravelフォーラム](http://forums.laravel.com)は手助けを得たり、手助けしたり、もしくは他の人が何を言っているかただ眺めたりできる素晴らしい場所です。

我々の多くは毎日FreeNodeの#laravel IRCチャンネルに接続しています。 [このフォーラム投稿に接続方法が説明されています。](http://forums.laravel.com/viewtopic.php?id=671) このIRCチャンネルにつなぎっぱなしにすることは、Laravelを使用するWeb開発について多くを学ぶ方法です。 どうぞ質問をし、他の人の質問に答え、もしくはつないだままにして、他の人の質問と答から学んでください。 私達はLaravelを愛していますし、Laravelについて話すのも大好きです。ですからよそ者にはならないでください！

<a name="laravel-license"></a>
## ライセンス情報

Laravelは[MITライセンス](http://www.opensource.org/licenses/mit-license.php)のもとにライセンスされているオープンソースのソフトウェアです。