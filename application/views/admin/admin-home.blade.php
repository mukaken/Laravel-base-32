@layout('template')

@section('title')
{{ __('page.admin-home') }}
@endsection

@section('content')
<h1>{{ __('page.admin-home') }}</h1>
<h2>{{ __('page.admin-home-welcome', array('user' => Auth::user()->username)) }}</h2>
{{ __('page.admin-home-content') }}
@endsection