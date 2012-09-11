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

    {{ Form::token() }}
    <p>
    {{ Form::button('実行', array('type'=>'submit', 'class'=>'btn btn-primary')) }}
    </p>
{{ Form::close() }}
@endsection