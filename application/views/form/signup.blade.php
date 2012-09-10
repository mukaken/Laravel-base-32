@layout('template')

@section('title')
{{ __('page.signup') }}
@endsection

@section('content')
<h1>{{ __('page.signup') }}</h1>
{{ Form::open() }}
<p>
    {{ Form::label('username', __('validation.attributes.username')) }}
    {{ Form::text('username', Form_Signup::old('username')) }}
    {{ $errors->has('username') ? $errors->first('username') : '' }}
</p>
<p>
    {{ Form::label('password', __('validation.attributes.password')) }}
    {{ Form::text('password', Form_Signup::old('password')) }}
    {{ $errors->has('password') ? $errors->first('password') : '' }}
</p>
<p>
    {{ Form::label('password_confirm', __('validation.attributes.password_confirm')) }}
    {{ Form::text('password_confirm', Form_Signup::old('password_confirm')) }}
    {{ $errors->has('password_confirm') ? $errors->first('password_confirm') : '' }}
</p>
<p>
    {{ Form::label('email', __('validation.attributes.email')) }}
    {{ Form::text('email', Form_Signup::old('email')) }}
    {{ $errors->has('email') ? $errors->first('email') : '' }}
</p>
    {{ Form::submit(__('validation.attributes.submit')) }}
    {{ Form::token() }}
{{ Form::close() }}
@endsection