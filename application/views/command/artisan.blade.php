@layout('template')

@section('title')
Artisan実行
@endsection

@section('content')
<h1>Artisanコマンド実行</h1>
{{ Form::open( NULL, NULL, array('class'=>'well')) }}
    {{ Form::label('command', 'コマンド：php artisanの続きから入力') }}
    {{ Form::text('command', Form_Command::old('command')) }}
	{{ $errors->has('command') ? $errors->first('command') : '' }}
	<p>bundle関係のタスクは、ファイル操作時のパーミッションの関連と無視するエラーメッセージレベルの設定が関連して、正しく動かすのが面倒です。そのため、bundleの操作はコマンドラインを使用するか、出来ない場合はファイルブラウザなどで保守したほうが、簡単です。</p>
	<p>bundle以外のコマンドでも、ファイル操作が絡むものは、パーミッションの設定をして置かないとエラーで停止するものが多いです。</p>
    {{ Form::token() }}
    <p>
    {{ Form::submit('実行') }}
    </p>
{{ Form::close() }}
@endsection