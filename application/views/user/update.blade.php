@layout('template')
@section('content')
{{ Form::open() }}
<p>
{{ Form::label('id', 'ID：') }}
{{ $data['id'] }}
{{ Form::hidden('id', $data['id']) }}
</p>
<p>
{{ Form::label('username', 'ユーザー名：') }}
{{ Form::text('username', $data['username']) }}
{{ $errors->has('username') ? $errors->first('username') : '' }}
</p>
<p>
{{ Form::label('old_password', '旧パスワード：') }}
{{ Form::password('old_password') }}
{{ $errors->has('old_password') ? $errors->first('old_password') : '' }}
</p>
<p>
{{ Form::label('password', '新パスワード：') }}
{{ Form::password('password') }}
{{ $errors->has('password') ? $errors->first('password') : '' }}
</p>
<p>
{{ Form::label('password_confirmation', 'パスワード確認：') }}
{{ Form::password('password_confirmation') }}
{{ $errors->has('password_confirmation') ? $errors->first('password_confirmation') : '' }}
</p>
<p>
{{ Form::label('email', 'メールアドレス：') }}
{{ Form::text('email', $data['email']) }}
{{ $errors->has('email') ? $errors->first('email') : '' }}
</p>
{{ Form::token() }}
{{ Form::submit('ユーザー情報更新') }}
{{ Form::close() }}
@endsection