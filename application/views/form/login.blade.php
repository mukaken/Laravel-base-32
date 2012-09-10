@layout('template')

@section('title')
{{ __('page.login') }}
@endsection

@section('content')
<h1>{{ __('page.login') }}</h1>
{{ Form::open() }}
<p>
    {{ Form::label('username', __('validation.attributes.username')) }}
    {{ Form::text('username', Form_Login::old('username')) }}
    {{ $errors->has( 'username' ) ? $errors->first( 'username' ) : '' }}
</p>
<p>
    {{ Form::label('password', __('validation.attributes.password')) }}
    {{ Form::text('password', Form_Login::old('password')) }}
    {{ $errors->has( 'password' ) ? $errors->first( 'password' ) : '' }}
</p>
    {{ Form::submit(__('validation.attributes.submit')) }}
    {{ Form::token() }}
{{ Form::close() }}
@endsection