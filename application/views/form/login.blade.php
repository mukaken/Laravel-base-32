@layout('template')

@section('title')
{{ __('page.login') }}
@endsection

@section('content')
<h1>{{ __('page.login') }}</h1>
{{ Form::open( NULL, NULL, array('class'=>'well') ) }}
    {{ Form::label('username', __('validation.attributes.username')) }}
    @if ($errors->has('username'))
        <p class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $errors->first('username') }}
        </p>
    @endif
    {{ Form::text('username', Form_Login::old('username')) }}
    {{ Form::label('password', __('validation.attributes.password')) }}
    @if ($errors->has('password'))
        <p class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $errors->first('password') }}
</p>
    @endif
    {{ Form::text('password', Form_Login::old('password')) }}
    {{ Form::token() }}
<p>
    {{ Form::button(__('validation.attributes.submit'), array('type'=>'submit', 'class'=>'btn btn-primary')) }}
</p>
{{ Form::close() }}
@endsection