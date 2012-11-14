@layout('template')
@section('content')
<h1>ユーザー一覧</h1>
<table border="1">
	<thead>
		<tr>
			<th>ID</th>
			<th>ユーザー名</th>
			<th>パスワード</th>
			<th>メールアドレス</th>
			<th>表示</th>
			<th>更新</th>
			<th>削除</th>
		</tr>
	</thead>
	@forelse($users->results as $user)
	<tbody>
		<tr>
			{{-- HTMLクラスやFormクラスで出力される内容は --}}
			{{-- 自動でe()を通されるが、直接出力する場合 --}}
			{{-- e()を使用し、出力を全部エンティティ変換する --}}
			<td>{{ e($user->id) }}</td>
			<td>{{ e($user->username) }}</td>
			<td>{{ e($user->password) }}</td>
			<td>{{ e($user->email) }} </td>
			<td>{{ HTML::link_to_route('showUser', '見', array($user->id)) }}</td>
			<td>{{ HTML::link_to_route('updateUser', '改', array($user->id)) }}</td>
			@if ( $user->id != Auth::user()->id )
			<td>{{ HTML::link_to_route('removeUser', '消', array($user->id)) }}</td>
			@else
			<td>ー</td>
			@endif
		</tr>
	</tbody>
	@empty
	<td>データが存在しません</td>
	@endforelse
</table>
{{ $users->links() }}
@endsection