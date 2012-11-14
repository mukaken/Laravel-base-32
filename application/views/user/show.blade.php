@layout('template')
@section('content')
<p>ID：{{ e($user->id) }}</p>
<p>ユーザー名：{{ e($user->username) }}</p>
<p>パスワード：{{ e($user->password) }}</p>
<p>メールアドレス：{{ e($user->email) }}</p>
@if( $user->id != Auth::user()->id )
{{ HTML::link_to_route('removeUser', '削除', array($user->id)) }}
@endif
{{ HTML::link_to_route('updateUser', '修正', array($user->id)) }}
@endsection