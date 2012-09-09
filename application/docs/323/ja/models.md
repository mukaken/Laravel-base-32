# モデルとライブラリー

## 内容

- [モデル](#models)
- [ライブラリー](#libraries)
- [オートロード](#auto-loading)
- [ベストプラクティス](#best-practices)

<a name="models"></a>
## モデル

モデルはあなたのアプリケーションの心臓です。アプリケーションロジック（コントローラー／ルート）とビュー（HTML）はユーザーとモデルとを関係付ける媒体にすぎません。モデルの中に組み込む、一番典型的なロジックは[ビジネスロジック](http://ja.wikipedia.org/wiki/ビジネスロジック)でしょう。

*モデルに入れ込む機能の例をご覧下さい。*

- データベースI/O
- ファイルI/O
- Webサービスとのやり取り

例えば、あなたがブログをプログラムしているとします。あなたは多分"Post"モデルを作りたがるでしょう。ユーザーはポストにコメントしたがるでしょうから、"Comment"モデルも作ることでしょう。もしユーザーにコメントさせるのでしたら、"User"モデルも必要になるでしょう。分かりましたか？

<a name="libraries"></a>
## ライブラリー

ライブラリーとは、あなたのアプリケーションのためだけに仕事をするわけではないクラスのことです。例えば、HTMLからコンバートしてくれるPDF生成ライブラリーを考えてください。それは複雑でしょうが、あなたのアプリケーションのためだけに役立つわけでありません。ですから、「ライブラリー」にすることを考えてください。

ライブラリーを作成するのは、クラスを作ることと同じように簡単で、librariesフォルダーの中に保存します。次の例として、渡されたテキストをエコーするメソッドを持つ、シンプルなライブラリーを作成してみましょう。librariesフォルダーの中の**printer.php**ファイルを作成し、次のコードを書いてください。

	<?php

	class Printer {

		public static function write($text) {
			echo $text;
		}
	}

これであなたはアプリケーションのどんな所からも、Printer::write('writeメソッドからこのテキストはエコーされている！')と呼び出せるようになりました。

<a name="auto-loading"></a>
## オートロード

ライブラリーとモデルは、とても簡単に使用できるので、Laravelのオートローダーに感謝しています。オートローダーについてもっと知るためには[オートローダー](/docs/loading)をチェックしてください。

<a name="best-practices"></a>
## ベストプラクティス

私達の頭の中には「コントローラーは簡単に！」というマントラが流れています。けど、どうやって実際の世界に適用すればいいのでしょうか？これは「モデル」という言葉が含む、問題の一部分になります。一体何を意味しているのでしょう？ただの便利な言葉なのでしょうか？「データベース」に関連付けられた多くの「モデル」が発生させるのは、データーベースにアクセスするだけの軽いモデルと、でっぷり太ったコントローラーです。別の手法を取ってみましょう

"models"ディレクトリーが完全にスクラップになったからって、どうだって言うんですか？もっと便利な名前を付けましょう。実際、アプリケーションと同じ名前をつけましょう。多分衛星トラッキングサイトでしたら、名前は"Trackler"になるでしょう。それならば、applicationフォルダーの下に"trackler"ディレクトリーを作りましょう。

いいですね！次に、クラスを実体"entities"、サービス"services"、リポジトリー"repositories"に分割しましょう。では、"trackler"フォルダーの下に、これら３つのディレクトリーを作成することにしましょう。それぞれを見て行きましょう。

### Entities（実体）

entitiesはアプリケーションのデーターコンテナだと考えてください。主としてプロパティのみで構成されています。ですから、アプリケーションに"Location"（位置）実体があるならば、"latitude"（経度）と"longitude"（緯度）のプロパティを持ちます。このようなコードになるでしょう：

	<?php namespace Trackler\Entities;
	
	class Location {

		public $latitude;
		public $longitude;

		public function __construct($latitude, $longitude)
		{
			$this->latitude = $latitude;
			$this->longitude = $longitude;
		}

	}

見た感じ、良いようです。これで、実体がひとつ出来ました。他の２つのフォルダーを見て行きましょう。

### Services（サービス）

servicesはアプリケーションの*処理*で構成されます。このまま、Tracklerサンプルを使って説明していきます。このアプリケーションでは、ユーザーがGPSロケーションを入力するフォームを持っているとします。ですから、座標が正しいフォーマットであるかバリデーションする必要があります。*location実体*を*バリデーション*する必要があります。では、"services"ディレクトリーの中に、"validators"フォルダーを作成し、次のクラスを書いてください。

	<?php namespace Trackler\Services\Validators;

	use Trackler\Entities\Location;

	class Location_Validator {

		public static function validate(Location $location)
		{
			// locationインスタンスのバリデーション処理……
		}

	}

いいですね！これでコントローラーとルートとは独立して、バリデーションをテストする素晴らしい方法が手に入りました！locationのバリデーションは済みました。これで保存する準備ができました。では、どう行いましょうか？

### Repositories（リポジトリー）

repositoriesはアプリケーションのデーターアクセス層です。あなたのアプリケーションの*実体(entities)*を保存したり、入手することに責任を持ちます。引き続いて、この例では*場所(location)*実体を使って行きましょう。実体を保存する場所リポジトリーが必要です。リレーショナルデータベースであろうと、Redisであろうと、次世代のホットなストレージだろうと、なんでも好きなメカニズムを使うことができます。例を見てみましょう。

	<?php namespace Trackler\Repositories;

	use Trackler\Entities\Location;

	class Location_Repository {

		public function save(Location $location, $user_id)
		{
			// 与えられたユーザーIDの場所を保存するコード……
		}

	}

これで、アプリケーションの実体、サービス、リポジトリー間の関係をきれいに分割できました。これが意味するのは、**[スタブ](http://ja.wikipedia.org/wiki/スタブ)**レポジトリーをサービスやコントローラーに注入することで、こうしたアプリケーションの一部分をデータベースとは独立してテストできるということです。しかも、サービスや実体、コントローラーには影響をあたえること無く、保存テクノロジーを変更できるようになります。これで、良い*関係の分離*を達成できました。

*参照：*

- [IoCコンテナ](/docs/ioc)