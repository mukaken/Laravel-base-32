@layout('template')

@section('title')
{{ __('page.signup') }}
@endsection

@section('content')
<h1>{{ __('page.signup') }}</h1>
{{ Form::open() }}
<div class="row">
	<div>
		{{ Form::label('username', __('validation.attributes.username')) }}
		{{ Form::text('username', Form_Signup::old('username')) }}
		@if ( $errors->has('username') )
		<small class="error">{{ $errors->first('username') }}</small>
		@endif
	</div>
	<div>
		{{ Form::label('password', __('validation.attributes.password')) }}
		{{ Form::text('password', Form_Signup::old('password')) }}
		@if ( $errors->has('password') )
		<small class="error">{{ $errors->first('password') }}</small>
		@endif
	</div>
	<div>
		{{ Form::label('password_confirm', __('validation.attributes.password_confirm')) }}
		{{ Form::text('password_confirm', Form_Signup::old('password_confirm')) }}
		@if ( $errors->has('password_confirm') )
		<small class="error">{{ $errors->first('password_confirm') }}</small>
		@endif
	</div>
	<div>
		{{ Form::label('email', __('validation.attributes.email')) }}
		{{ Form::text('email', Form_Signup::old('email')) }}
		@if ( $errors->has('email') )
		<small class="error">{{ $errors->first('email') }}</small>
		@endif
	</div>
    {{ Form::submit(__('validation.attributes.submit'), array('class' => 'button') ) }}
    {{ Form::token() }}
	{{ Form::close() }}
</div>
@endsection