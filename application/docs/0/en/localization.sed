s+Localization is the process of translating your application into different languages\. +ローカライズはアプリケーションを他の言語に翻訳する処理のことです。+

s+The \*\*Lang\*\* class provides a simple mechanism to help you organize and retrieve the text of your multilingual application\.+**Lang**クラスは多言語対応アプリケーションを構成し、テキストを入手するための、シンプルなメカニズムを提供しています。+

s+All of the language files for your application live under the \*\*application\/language\*\* directory\. +全ての言語ファイルは、**application/languge**ディレクトリー下に置かれます。+

s+Within the \*\*application\/language\*\* directory, you should create a directory for each language your application speaks\. +あなたのアプリケーションで扱うそれぞれの言語のディレクトリーを**application/language**ディレクトリー下に作成してください。+

s+So, for example, if your application speaks English and Spanish, you might create \*\*en\*\* and \*\*sp\*\* directories under the \*\*language\*\* directory\.+ですから例えば、英語とスペイン語をアプリケーションで取り扱うのでしたら、**language**ディレクトリーの下に、**en**と**sp**ディレクトリーを作成すれば良いのです。+


s+Each language directory may contain many different language files\. +それぞれの言語ディレクトリーは異なった言語ファイルで構成されています。+

s+Each language file is simply an array of string values in that language\. +それぞれの言語ファイルは、シンプルにその言語の文字列の配列です。+

s+In fact, language files are structured identically to configuration files\. +事実、言語ファイルの構造は、設定ファイルと同じです。+

s+For example, within the \*\*application\/language\/en\*\* directory, you could create a \*\*marketing\.php\*\* file that looks like this:+例えば、**application/language/en**ディレクトリーの中で、**marketing.php**ファイルを作成するならば、こんなふうになります。+


s+Creating a language file:+言語ファイルを作成+

s+Next, you should create a corresponding \*\*marketing\.php\*\* file within the \*\*application\/language\/sp\*\* directory\. +次に、対応する**marketing.php**ファイルを**application/language/sp**ディレクトリーに作成します。+

s+The file would look something like this:+このファイルは次のような形式になります。+


s+Nice! +ナイスですね！+

s+Now you know how to get started setting up your language files and directories\. +これで、どうやって言語ファイルとディレクトリーを用意すれば良いか、理解できたでしょう。+

s+Let's keep localizing!+続けて、ローカライズしましょう！+




s+Retrieving a language line:+ローカライズした文字列を取得+

s+Retrieving a language line using the "__" helper:+"\\\_\\\_"ヘルパーを使用し、ローカライズした文字列を取得+


s+Notice how a dot was used to separate "marketing" and "welcome"? +"marketing"と"welcome"を分けるピリオドをどう使用しているかに注目してください。+

s+The text before the dot corresponds to the language file, while the text after the dot corresponds to a specific string within that file\.+ピリオドの前の文字列は言語ファイルを表し、ピリオドの後に続く文字列は、そのファイルの中で指定されているキーを表します。+

s+Need to retrieve the line in a language other than your default? +デフォルトの言語以外の文字列を取得する必要があるのですか？+

s+Not a problem\. +問題ありません。+

s+Just mention the language to the \*\*get\*\* method:+**get**メソッドで言語を指定するだけです。+

s+Getting a language line in a given language:+指定された言語のローカライズ文字列を取得+



s+Now, let's work on our welcome message\. +では、もうちょっとウェルカムメッセージを続けましょう。+

s+"Welcome to our website!" is a pretty generic message\. +"Welcome to our website!"は余りにも一般的すぎるメッセージです。+

s+It would be helpful to be able to specify the name of the person we are welcoming\. +誰を歓迎しているのか、名前を指定できたら良くなります。+

s+But, creating a language line for each user of our application would be time-consuming and ridiculous\. +しかし、それぞれのユーザーごとに言語ファイル中に指定するのは、時間を浪費し、馬鹿馬鹿しいですよね。+

s+Thankfully, you don't have to\. +ありがたいことに、する必要はありません。+

s+You can specify "place-holders" within your language lines\. +言語ファイル中の翻訳テキスト中に「プレースホルダー」が使用できます。+

s+Place-holders are preceded by a colon:+プレースホルダーはコロン(:)で始まります。+


s+Creating a language line with place-holders:+プレースホルダーを使い、翻訳テキストを作成+

s+Retrieving a language line with replacements:+置換されたローカライズ文字列を取得+

s+Retrieving a language line with replacements using "__":+"\\\_\\\_"を使用し、置換されたローカライズ文字列を取得+
