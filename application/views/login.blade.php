@layout('template')
@section('content')
{{ Form::open() }}
<p>
{{ Form::label('username', 'ユーザー名：') }}
{{ Form::text('username', Input::old('username', '')) }}
{{ $errors->has('username') ? $errors->first('username') : '' }}
</p>
<p>
{{ Form::label('password', 'パスワード：') }}
{{ Form::password('password') }}
{{ $errors->has('password') ? $errors->first('password') : '' }}
</p>
{{ Form::token() }}
{{ Form::submit('ログイン') }}
{{ Form::close() }}
@endsection