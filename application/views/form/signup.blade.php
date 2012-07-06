@layout('template')

@section('title')
{{ __('page.signup') }}
@endsection

@section('content')
<h1>{{ __('page.signup') }}</h1>
{{ Form::open( NULL, NULL, array('class'=>'well') ) }}
    {{-- ユーザー名 --}}
    {{ Form::label('username', __('validation.attributes.username')) }}
    @if ($errors->has('username'))
        <p class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $errors->first('username') }}
        </p>
    @endif
    {{ Form::text('username', Form_Signup::old('username')) }}
    {{-- パスワード --}}
    {{ Form::label('password', __('validation.attributes.password')) }}
    @if ($errors->has('password'))
        <p class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $errors->first('password') }}
        </p>
    @endif
    {{ Form::text('password', Form_Signup::old('password')) }}
     {{-- パスワード確認 --}}
    {{ Form::label('password_confirm', __('validation.attributes.password_confirm')) }}
    @if ($errors->has('password_confirm'))
        <p class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $errors->first('password_confirm') }}
        </p>
    @endif
    {{ Form::text('password_confirm', Form_Signup::old('password_confirm')) }}
    {{-- メールアドレス --}}
    {{ Form::label('email', __('validation.attributes.email')) }}
    @if ($errors->has('email'))
        <p class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $errors->first('email') }}
        </p>
    @endif
    {{ Form::text('email', Form_Signup::old('email')) }}
    <p>
        {{ Form::button(__('validation.attributes.submit'), array('type'=>'submit', 'class'=>'btn btn-primary')) }}
    </p>
    {{ Form::token() }}
{{ Form::close() }}
@endsection