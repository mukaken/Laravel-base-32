# ペジネーション

## 内容

- [基本](#the-basics)
- [クエリービルダーを使用する](#using-the-query-builder)
- [ペジネーションリンクに追加する](#appending-to-pagination-links)
- [Paginatorsを手動で生成する](#creating-paginators-manually)
- [ペジネーションスタイル](#pagination-styling)

<a name="the-basics"></a>
## 基本

Laravelのペジネーションは、導入するためにコードが取っ散らかるのを減らせるように、設計されています。

<a name="using-the-query-builder"></a>
## クエリービルダーを使用する

[Fluentクエリービルダー](docs/database/fluent)を用い、完全な例を紹介しましょう。

#### クエリーの結果をページングする

	$orders = DB::table('orders')->paginate($per_page);

クエリーのテーブルカラムを選択するためにオプションで配列を渡し、指定することもできます。

	$orders = DB::table('orders')->paginate($per_page, array('id', 'name', 'created_at'));

#### ビューで結果を表示する

	<?php foreach ($orders->results as $order): ?>
		<?php echo $order->id; ?>
	<?php endforeach; ?>

#### ペジネーションリンクを生成する

	<?php echo $orders->links(); ?>

linksメソッドは、次のような賢いページのリンクを生成します。

	前 1 2 ... 24 25 26 27 28 29 30 ... 78 79 次

ペジネーションはどのページを表示しているかを自動的に決め、結果とリンクをそれに合わせて変更してくれます。

また、「次」、「前」のリンクを生成することも可能です。

#### シンプルに「前」と「次」のリンクだけを生成する

	<?php echo $orders->previous().' '.$orders->next(); ?>

*参照：*

- *[Fluentクエリービルダー](/docs/database/fluent)*

<a name="appending-to-pagination-links"></a>
## ペジネーションリンクに追加する

ペジネーションのリンクにソートしているカラム名などをクエリに含める必要があるかも知れません。

#### ペジネーションリンクにクエリを追加する

	<?php echo $orders->appends(array('sort' => 'votes'))->links();

これで次のようなURLが生成されます。

	http://example.com/something?page=2&sort=votes

<a name="creating-paginators-manually"></a>
## Paginatorsを手動で生成する

時にクエリビルダーを使用せず、Paginatorインスタンスを手動で作成する必要ができることもあるでしょう。こうしてください：

#### Paginatorインスタンスを手動で生成する

	$orders = Paginator::make($orders, $total, $per_page);

<a name="pagination-styling"></a>
## ペジネーションスタイル

全てのペジネーションリンク要素は、CSSクラスが使用できます。linksメソッドで生成されるHTML要素の一例をご覧ください：

	<div class="pagination">
		<ul>
			<li class="previous_page"><a href="foo">前</a></li>

			<li><a href="foo">1</a></li>
			<li><a href="foo">2</a></li>

			<li class="dots disabled"><a href="#">...</a></li>

			<li><a href="foo">11</a></li>
			<li><a href="foo">12</a></li>

			<li class="active"><a href="#">13</li>

			<li><a href="foo">14</a></li>
			<li><a href="foo">15</a></li>

			<li class="dots disabled"><a href="#">...</a></li>

			<li><a href="foo">25</a></li>
			<li><a href="foo">26</a></li>

			<li class="next_page"><a href="foo">次</a></li>
		</ul>
	</div>

結果の最初のページでは、「前」リンクは無効になります。同様に、「次」リンクは結果の最終ページでは、無効になります。生成されるHTMLはこのようになります。

	<li class="disabled previous_page"><a href="#">前</a></li>
