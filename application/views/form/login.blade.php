@layout('template')

@section('title')
{{ __('page.login') }}
@endsection

@section('content')
<h1>{{ __('page.login') }}</h1>
{{ Form::open() }}
<div class="row">
	<div>
		{{ Form::label('username', __('validation.attributes.username')) }}
		{{ Form::text('username', Form_Login::old('username')) }}
		@if ( $errors->has('username') )
		<small class="error">{{ $errors->first( 'username' ) }}</small>
		@endif
	</div>
	<div>
		{{ Form::label('password', __('validation.attributes.password')) }}
		{{ Form::text('password', Form_Login::old('password')) }}
		@if ( $errors->has( 'password' ) )
		<small class="error">{{ $errors->first( 'password' ) }}</small>
		@endif
	</div>
    {{ Form::submit(__('validation.attributes.submit'), array('class' => 'button') ) }}
    {{ Form::token() }}
</div>
{{ Form::close() }}
@endsection