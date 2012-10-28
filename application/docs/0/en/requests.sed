s+Working With The URI+URI操作+

s+Getting the current URI for the request:+リクエストの現在のURIを取得+

s+Getting a specific segment from the URI:+URIの特定のセグメントを取得+

s+Returning a default value if the segment doesn't exist:+セグメントが存在しない場合、デフォルト値を返す+

s+Getting the full request URI, including query string:+クエリ文字列も含んだ、完全なURIを取得+

s+Sometimes you may need to determine if the current URI is a given string, or begins with a given string\. +時々、URIが与えられた文字列であるか、もしくは文字列で始まっているかを調べる必要が有ることでしょう。+

s+Here's an example of how you can use the is() method to accomplish this:+このために、is()メソッドをどうやって使用するかのサンプルです。+

s+Determine if the URI is "home":+URIが"home"であるか確かめる+

s+The current URI is "home"!+現在のURIは"home"だ！+

s+Determine if the current URI begins with "docs\/":+現在のURIが"docs/"で始まっているか確かめる+

s+The current URI begins with "docs\/"!+現在のURIは"docs/"で始まっている！+


s+Getting the current request method:+現在のリクエストのメソッドを得る+

s+Accessing the $_SERVER global array:+$_SERVERグローバル配列にアクセスする+

s+Retrieving the requester's IP address:+リクエスト場所のIPアドレスを取得する+

s+Determining if the current request is using HTTPS:+現在のリクエストがHTTPSを使っているか確かめる+

s+This request is over HTTPS!+このリクエストはHTTPSで送られてきた！+

s+Determing if the current request is an AJAX request:+現在のリクエストがAJAXリクエストか確かめる+

s+This request is using AJAX!+このリクエストはAJAXを使用している！+

s+Determining if the current requst is via the Artisan CLI:+現在のリクエストがartisan CLIを通しているか確かめる+

s+This request came from the CLI!+このリクエストは、CLIからだ！+

s+Determining if the current request is an AJAX request:+現在のリクエストがAJAXリクエストであるかチェックする+