@layout('template')

@section('title')
500 内部エラー
@endsection

@section('content')
<div class="row-fluid">
    <div class="span9">
		<h2>500 内部エラー発生</h2>
		<p>内部エラーが発生しました。</p>
		<p>通常はデータベースサーバーの不調で、しばらく時間が経つと復旧されます。</p>
		<p>時間を置いて、アクセスししてください。</p>
	</div>
</div>
@endsection