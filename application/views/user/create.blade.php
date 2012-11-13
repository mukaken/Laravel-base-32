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
<!--
　パスワードはセキュリティー上、ブラウザに再送信しないほうが
　良いため、Form::passwordには初期値（デフォルト値）の指定ができない。
　いつも空欄で表示される。他のメソッドより引数が少ないため、
　もし、間違えて初期値を設定してしまうと、配列が必要なところに文字列を
　指定しているとエラーになる。
　うっかり、ミスした時のため、どんなエラーになるのか
　一度経験しておくことはおすすめ。けっこうはまる。
-->
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
{{ Form::text('email', Input::old('email', '')) }}
{{ $errors->has('email') ? $errors->first('email') : '' }}
</p>
{{ Form::token() }}
{{ Form::submit('ユーザー作成') }}
{{ Form::close() }}
@endsection