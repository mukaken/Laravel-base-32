<!DOCTYPE HTML>
<html lang="en-GB">
    <head>
        <meta charset="UTF-8">
        <title>@yield('title')</title>
    </head>
    <body>
        <div style="color:red;">
            @if (Session::has('warning'))
                <p>{{ Session::get('warning') }}</p>
            @endif
        </div>
        <div style="color:orangered;">
            @if (Session::has('notice'))
                <p>{{ Session::get('notice') }}</p>
            @endif
        </div>
        <div style="color:blue;">
            @if (Session::has('message'))
                <p>{{ Session::get('message') }}</p>
            @endif
        </div>
　       @yield('content')
    </body>
</html>