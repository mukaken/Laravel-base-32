@layout('template')

@section('title')
500 内部エラー
@endsection

@section('content')
<div class="row">
	<div class="twelve columns">
		<h3>404 ページが見つかりません</h3>
		<p>内部エラーが発生しました。</p>
		<p>通常はデータベースサーバーの不調で発生し、しばらく時間が経つと復旧されます。</p>
		<p>時間を置いて、アクセスししてください。</p>
	</div>
</div>
@endsection