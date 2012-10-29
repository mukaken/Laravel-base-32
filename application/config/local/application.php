<?php

return array(
    /*
      |--------------------------------------------------------------------------
      | Application Key
      |--------------------------------------------------------------------------
      |
      | This key is used by the encryption and cookie classes to generate secure
      | encrypted strings and hashes. It is extremely important that this key
      | remain secret and should not be shared with anyone. Make it about 32
      | characters of random gibberish.
      |
     */

	// 32文字のでたらめな文字列。数字と英字で構成すること。

    'key' => 'IEi9fXkid038lsf093kfgd092329d9jg',
    /*
      |--------------------------------------------------------------------------
      | Profiler Toolbar
      |--------------------------------------------------------------------------
      |
      | Laravel includes a beautiful profiler toolbar that gives you a heads
      | up display of the queries and logs performed by your application.
      | This is wonderful for development, but, of course, you should
      | disable the toolbar for production applications..
      |
     */

	// プロファイラの表示。開発環境であるため表示する。
	// これをtrueにすることで、ログはファイルに保存されず、
	// プロファイラに表示されるようになる。

    'profiler' => true,
);
