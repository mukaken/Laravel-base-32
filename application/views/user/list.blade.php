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
			<td>{{ $user->id }}</td>
			<td>{{ $user->username }}</td>
			<td>{{ $user->password }}</td>
			<td>{{ $user->email }} </td>
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