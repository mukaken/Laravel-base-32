@layout('template')

@section('title')
Artisan実行
@endsection

@section('content')
<h1>Artisanコマンド実行</h1>
{{ Form::open( NULL, NULL, array('class'=>'well')) }}
    {{ Form::label('command', 'コマンド：php artisanの続きから入力') }}
    @if ($errors->has('command'))
        <p class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $errors->first('command') }}
        </p>
    @endif
    {{ Form::text('command', Form_Command::old('command'), array('class'=>'span9')) }}
	<p>bundle関係のタスクは、ファイル操作時のパーミッションの関連と無視するエラーメッセージレベルの設定が関連して、正しく動かすのが面倒です。そのため、bundleの操作はコマンドラインを使用するか、出来ない場合はファイルブラウザなどで保守したほうが、簡単です。</p>
	<p>bundle以外のコマンドでも、ファイル操作が絡むものは、パーミッションの設定をして置かないとエラーで停止するものが多いです。</p>
    {{ Form::token() }}
    <p>
    {{ Form::button('実行', array('type'=>'submit', 'class'=>'btn btn-primary')) }}
    </p>
{{ Form::close() }}
<hr>
{{ Form::open( 'command-selected', NULL, array('class' => 'well')) }}
{{ Form::select( 'commands', $commands, '0' ) }}
{{ Form::button('選択を実行', array('type'=>'submit', 'class'=>'btn btn-primary')) }}
@endsection