s+Almost every interactive web application needs to validate data\. +ほとんどのインタラクティブなWebアプリケーションは、データーのバリデーションが必要です。+

s+For instance, a registration form probably requires the password to be confirmed\. +例えば、登録フォームでは、パスワードの再確認が必要でしょう。+

s+Maybe the e-mail address must be unique\. +多分、メールアドレスは重複していてはいけません。+

s+Validating data can be a cumbersome process\. +データーのバリデーションは堅苦しいプロセスです。+

s+Thankfully, it isn't in Laravel\. +ありがたいことに、Laravelでは、そうではありません。+

s+The Validator class provides as awesome array of validation helpers to make validating your data a breeze\. +Validatorクラスは、データーのバリデーションを簡単にしてくれる、ヘルパーの素晴らしいオンパレードです。+

s+Let's walk through an example:+一例を見てみましょう。+

s+Get an array of data you want to validate:+バリデーションしたいデーターを配列で獲得+

s+Define the validation rules for your data:+データーに対するバリデーションルールを定義+

s+Create a Validator instance and validate the data:+Validatorインスタンスを作成し、実行する+

s+With the \*errors\* property, you can access a simple message collector class that makes working with your error messages a piece of cake\. +*errors*プロパティは、エラーメッセージの取り扱いを簡単にしてくれる、シンプルなmessage collectorクラスです。+

s+Of course, default error messages have been setup for all validation rules\. +もちろん、デフォルトのエラーメッセージは全てのバリデーションルールに用意してあります。+

s+The default messages live at \*\*language\/en\/validation\.php\*\*\.+デフォルトのメッセージは**language/en/validation.php**にあります。+


s+Now you are familiar with the basic usage of the Validator class\. +これで、基本的なValidatorクラスの使い方に慣れました。+

s+You're ready to dig in and learn about the rules you can use to validate your data!+データーをバリデーションするのに使用するルールについて、掘り下げて学ぶ用意ができました。+


s+Validate that an attribute is present and is not an empty string:+存在し、空文字列ではないことをバリデートする属性です。+

s+Validate that an attribute consists solely of letters:+英文字だけで構成されていることをバリデートする属性です。+

s+Validate that an attribute consists of letters and numbers:+英文字と数字だけで構成されていることをバリデートする属性です。+

s+Validate that an attribute only contains letters, numbers, dashes, or underscores:+英数字とダッシュ、下線で構成されていることをバリデートする属性です。+

s+Validate that an attribute is a given length, or, if an attribute is numeric, is a given value:+与えられた文字数であること、もしくは数字項目の場合はその値であることをバリデートする属性です。+

s+Validate that an attribute size is within a given range:+サイズが与えられた範囲内であることをバリデートする属性です。+

s+\*\*Note:\*\* All minimum and maximum checks are inclusive\.+**注目：**最低値と最高値も含まれます。+

s+Validate that an attribute is at least a given size:+与えられたサイズ以上であることをバリデートする属性です。+

s+Validate that an attribute is no greater than a given size:+与えられたサイズ以下であることをバリデートする属性です。+

s+Validate that an attribute is numeric:+数字であることをバリデートする属性です。+

s+Validate that an attribute is an integer:+整数であることをバリデートする属性です。+


s+Validate that an attribute is contained in a list of values:+リストの値の中にあることをバリデートする属性です。+

s+Validate that an attribute is not contained in a list of values:+リストの値の中に無いことをバリデートする属性です。+

s+Confirmation+確認項目+

s+The \*confirmed\* rule validates that, for a given attribute, a matching \*attribute_confirmation\* attribute exists\.+*confirmed*ルールは*attribute_confirmation*項目が存在し、その値と一致していることをバリデートする属性です。+

s+Validate that an attribute is confirmed:+確認項目と一致していることをバリデート+

s+Given this example, the Validator will make sure that the \*password\* attribute matches the \*password_confirmation\* attribute in the array being validated\.+この例でValidatorは、*password*項目が、配列の中の*password_confirmation*項目と一致していることを、確認します。+


s+The \*accepted\* rule validates that an attribute is equal to \*yes\* or \*1\*\. +*accepted*ルールは項目が*yes*か*1*であることをバリデートします。+

s+This rule is helpful for validating checkbox form fields such as "terms of service"\.+このルールは「サービスの規約」のようなフォームのチェックボックスのバリデーションに役立ちます。+

s+Validate that an attribute is accepted:+その項目が受け入れられたかバリデートする+


s+Validate that an attribute matches another attribute:+項目値が、他のフィールドの値と同じ事をバリデートする+

s+Validate that two attributes have different values:+２つの項目の値が異なることをバリデートする+

s+Regular Expression Match+正規表現+

s+The \*match\* rule validates that an attribute matches a given regular expression\.+*match*ルールは与えられた正規表現と一致することをバリデートします。+

s+Validate that an attribute matches a regular expression:+正規表現と一致することをバリデートする+


s+Validate that an attribute is unique on a given database table:+値が与えられたデータベーステーブルで一意であることをバリデートする+


s+In the example above, the \*email\* attribute will be checked for uniqueness on the \*users\* table\. +上記の例では、*email*項目は*users*テーブルで、ユニークであるかチェックされます。+

s+Need to verify uniqueness on a column name other than the attribute name? +その項目名とカラム名が異なっている時にもユニークであることを確かめたいのですか？+

s+No problem:+問題ありません。+

s+Specify a custom column name for the unique rule:+uniqueルールでカスタムカラム名を指定する+

s+Many times, when updating a record, you want to use the unique rule, but exclude the row being updated\. +レコードを更新する場合、通常はuniqueルールを使用しても、更新するそのレコードに対しては適用を除外したいことはよくあります。+

s+For example, when updating a user's profile, you may allow them to change their e-mail address\. +例えば、ユーザープロフィールの更新では、メールアドレスの変更は許可されていることでしょう。+

s+But, when the \*unique\* rule runs, you want it to skip the given user since they may not have changed their address, thus causing the \*unique\* rule to fail\. It's easy:+しかし、*unique*ルールが効いていると、そのユーザーがメールアドレスを変更しなかった場合、*unique*ルールは失敗してしまいます。そのため、更新するユーザーに対しては、このルール適用を飛ばす必要があります。+

s+Forcing the unique rule to ignore a given ID:+IDを指定し、uniqueルールを無視するよう強制する+

s+Validate that an attribute exists on a given database table:+データベーステーブルに項目の値が存在していることをバリデートする+

s+Specify a custom column name for the exists rule:+existsルールにカスタムカラム名を指定する+



s+Validate that a date attribute is before a given date:+指定日付以前であることをバリデートする+

s+Validate that a date attribute is after a given date:+指定日付以降であることをバリデートする+

s+\*\*Note:\*\* The \*\*before\*\* and \*\*after\*\* validation rules use the \*\*strtotime\*\* PHP function to convert your date to something the rule can understand\.+**注目：** **before**と**after**バリデーションルールは日付の解析に、PHPの関数である**strtotime**を利用しています。+


s+Validate that an attribute is an e-mail address:+メールアドレスとして正しいかバリデートする+


s+\*\*Note:\*\* This rule uses the PHP built-in \*filter_var\* method\.+**注目：**このルールはPHP組み込み関数の*filter_var*メソッドを使用しています。+


s+Validate that an attribute is a URL:+有効なURLであるかバリデートする+

s+Validate that an attribute is an active URL:+アクティブなURLであるかバリデートする+

s+\*\*Note:\*\* The \*active_url\* rule uses \*checkdnsr\* to verify the URL is active\.+**注目：** *active_url*ルールはURLがアクティブであるか判断するために*checkdnsr*を使用しています。+

s+The \*mimes\* rule validates that an uploaded file has a given MIME type\. +*mimes*ルールはアップロードファイルが指定されたMIMEタイプであるかバリデートします。+

s+This rule uses the PHP Fileinfo extension to read the contents of the file and determine the actual MIME type\. +このルールは、そのファイルの内容を読み、実際のMIMEタイプを決めるために、PHP Fileinfo拡張を使用しています。+

s+Any extension defined in the \*config\/mimes\.php\* file may be passed to this rule as a parameter:+*config/mimes.php*の中で定義されている拡張子で、引数で指定されたものは、このルールを通されます+

s+Validate that a file is one of the given types:+指定されたタイプの一つであることをバリデートする+
s+\*\*Note:\*\* When validating files, be sure to use Input::file() or Input::all() to gather the input\.+**注目：**ファイルをバリデートする時は、Input::file()かInput::all()を入力項目収集に使用してください。+

s+Validate that a file is an image:+ファイルが画像であることをバリデートする+

s+Validate that a file is no more than a given size in kilobytes:+ファイルが指定キロバイトより小さいことをバリデートする+




s+Laravel makes working with your error messages a cinch using a simple error collector class\. +Laravelでは、シンプルなエラー収集クラスを使用し、手軽にエラーメッセージを取り扱えるようになっています+

s+After calling the \*passes\* or \*fails\* method on a Validator instance, you may access the errors via the \*errors\* property\. +Validatorのインスタンで*passes*か*fails*メソッドを呼び出した後に、*errors*プロパティーを利用してアクセスできます。+

s+The error collector has several simple functions for retrieving your messages:+メッセージを取得するためにいくつかの関数が用意されています。+

s+Determine if an attribute has an error message:+一項目にエラーメッセージがあるか確かめる+

s+The e-mail attribute has errors\.\.\.+e-mail項目にエラーがある……+

s+Retrieve the first error message for an attribute:+その項目の最初のエラーメッセージを取得する+

s+Sometimes you may need to format the error message by wrapping it in HTML\. +時には、HTML要素でラップしたエラーメッセージが必要なこともあるでしょう。+

s+No problem\. +大丈夫です。+

s+Along with the :message place-holder, pass the format as the second parameter to the method\.+２番目の引数に、:messageプレースホルダーを使い、フォーマットを指定してください。+

s+Format an error message:+エラーメッセージをフォーマットする+

s+Get all of the error messages for a given attribute:+指定された項目の、すべてのエラーメッセージを取得+

s+Format all of the error messages for an attribute:+指定された項目の、すべてのエラーメッセージをフォーマット+

s+Get all of the error messages for all attributes:+全ての項目の、全てのエラーメッセージを取得+

s+Format all of the error messages for all attributes:+全ての項目の、全てのエラーメッセージをフォーマット+



s+Once you have performed your validation, you need an easy way to get the errors back to the view\. +一度バリデーションを実行すれば、簡単にビューにそれを表示できます。+

s+Laravel makes it amazingly simple\. +Laravelでは、驚異的なシンプルさで行えます。+

s+Let's walk through a typical scenario\. +典型的なシナリオに沿って、行なってみましょう。+

s+We'll define two routes:+２つのルートを定義します。+


s+Great! +素晴らしいですね！+

s+So, we have two simple registration routes\. +２つのシンプルな登録のためのルートができました。+

s+One to handle displaying the form, and one to handle the posting of the form\. +一つはフォームを表示処理し、もうひとつはフォームの投稿を処理します。+

s+In the POST route, we run some validation over the input\. +POSTルートでは、入力に対してバリデーションを行なっています。+

s+If the validation fails, we redirect back to the registration form and flash the validation errors to the session so they will be available for us to display\.+バリデーションが失敗した場合、表示に使えるようにバリデーションエラーをセッションに退避(flash)させ、登録フォームへリダイレクトします。+

s+\*\*But, notice we are not explicitly binding the errors to the view in our GET route\*\*\. +**しかし、GETルートでerrorsとビューを明確に結びつけていないことに注目してください。**+

s+However, an errors variable (\$errors) will still be available in the view. +それでも、エラー変数($errors)はビューで使用できます。+

s+Laravel intelligently determines if errors exist in the session, and if they do, binds them to the view for you\. +賢明なことにLaravelは、errorsがセッションにあれば、あなたのため、ビューに渡してくれます。+

s+If no errors exist in the session, an empty message container will still be bound to the view\. +errorsがセッションに存在していなければ、からのメッセージコンテナがビューに渡されます。+

s+In your views, this allows you to always assume you have a message container available via the errors variable\. +あなたはビューの中で、errors編集を通して、いつもメッセージコンテナが存在すると思っていられます。+

s+We love making your life easier\.+私たちは、あなたの人生を楽にすることが大好きです。+

s+For example, if email address validation failed, we can look for 'email' within the $errors session var.+例えば、メールアドレスのバリデーションに失敗すれば、セッション変数の$errorsの中に'email'を見つけることができます。+

s+Using Blade, we can then conditionally add error messages to our view.+Bladeを使い、ビューにエラーメッセージを条件付きで付け加えることもできます。+

s+This will also work great when we need to conditionally add classes when using something like Twitter Bootstrap.+これは例えばTwitter Bootstrapのようなものを使用しているときに、条件付きでクラスを付け加えたい時に便利に使えます。+

s+For example, if the email address failed validation, we may want to add the "error" class from Bootstrap to our \*div class="control-group"\* statement.+例えば、メールアドレスのバリデーションに失敗したら、Bootstrapの"error"クラスを*div class="control-group"*文に付け加えたいことでしょう。+

s+When the validation fails, our rendered view will have the appended \*error\* class.+バリーションが失敗したら、ビューには*error*クラスが付け加え表示されるでしょう。+

s+Want to use an error message other than the default? +エラーメッセージをデフォルトから変更したいのですか？+

s+Maybe you even want to use a custom error message for a given attribute and rule\. +たぶん、項目名とルールを指定して、カスタムエラーメッセージを使いたい場合さえあるでしょう。+

s+Either way, the Validator class makes it easy\.+どちらにしても、Validatorクラスが簡単に実現してくれます。+

s+Create an array of custom messages for the Validator:+Validatorに渡すカスタムメッセージの配列を作成+


s+Great! +素晴らしい！+

s+Now our custom message will be used anytime a required validation check fails\. +これで、バリデーションのチェックしに失敗した時、いつでもカスタムメッセージが使用できます。+

s+But, what is this \*\*:attribute\*\* stuff in our message? +けど、**:attribute**なんたらは、メッセージの中でどうなるんでしょう？+

s+To make your life easier, the Validator class will replace the \*\*:attribute\*\* place-holder with the actual name of the attribute! +あなたが楽になるように、Validatorクラスは、**attribute**プレースホルダーを実際の項目の名前に置き換えてくれます！+

s+It will even remove underscores from the attribute name\.+項目名の下線も取り除いてくれます。+

s+You may also use the \*\*:other\*\*, \*\*:size\*\*, \*\*:min\*\*, \*\*:max\*\*, and \*\*:values\*\* place-holders when constructing your error messages:+エラーメッセージを作成するときには、他にも**:other**、**:size**、**:min**、**:max**、**:values**プレースホルダーも使用できます。+

s+Other validation message place-holders:+他のバリデーションプレースホルダー+


s+So, what if you need to specify a custom required message, but only for the email attribute? +でも、カスタムメッセージが使えると言っても、email項目に対してしか指定できないのでしょうか？+

s+No problem\. +そんなことありません。+

s+Just specify the message using an \*\*attribute_rule\*\* naming convention:+**項目_ルール**のネーミングルールを使い、メッセージを指定して下さい。+

s+Specifying a custom error message for a given attribute:+与えられた項目のカスタムメッセージを指定する+


s+In the example above, the custom required message will be used for the email attribute, while the default message will be used for all other attributes\.+上記の例のように、要求されたカスタムメッセージはemail項目に使用されますが、他のすべての項目にはデフォルトのメッセージが使用されます。+

s+However, if you are using many custom error messages, specifying inline may become cumbersome and messy\. +しかし、たくさんのカスタムエラーメッセージを使用するために、コードの中で指定すれば、扱いにくくめちゃくちゃになるでしょう。+

s+For that reason, you can specify your custom messages in the \*\*custom\*\* array within the validation language file:+ですから、バリデーション言語ファイルの中の**custom**配列で、カスタムメッセージを指定して下さい。+

s+Adding custom error messages to the validation language file:+バリデーション言語ファイルにカスタムエラーメッセージを追加する+



s+Laravel provides a number of powerful validation rules\. +Laravelは多くのパワフルなバリデーションルールを提供しています。+

s+However, it's very likely that you'll need to eventually create some of your own\. +しかし、結局自分用に作成する必要が起きるのは、よくあるでしょう。+

s+There are two simple methods for creating validation rules\. +バリデーションルールを作成するには２つのシンプルな方法が用意されています。+

s+Both are solid so use whichever you think best fits your project\.+両方共素晴らしいので、プロジェクトにあった方をお使いください。+

s+Registering a custom validation rule:+カスタムバリデーションルールを登録+


s+In this example we're registering a new validation rule with the validator\. +この例は、Validatorに新しいバリデーションルールを登録しています。+

s+The rule receives three arguments\. +ルールは３つの引数を取ります。+

s+The first is the name of the attribute being validated, the second is the value of the attribute being validated, and the third is an array of parameters that were specified for the rule\.+最初はバリデーションを行う項目名です。２つ目はバリデーションを行う値で、３つ目はルールに指定されるパラメーターです。+

s+Here is how your custom validation rule looks when called:+あなたのカスタムバリデーションルールを使うには次のように呼び出します。+

s+Of course, you will need to define an error message for your new rule\. +もちろん、新しいルールのエラーメッセージを定義する必要があります。+

s+You can do this either in an ad-hoc messages array:+これは、その場で直ぐに定義する方法と：+

s+Or by adding an entry for your rule in the \*\*language\/en\/validation\.php\*\* file:+もしくは、**language/en/validation.php**の中にあなたのルールに対するエントリーを付け加える方法があります。+


s+As mentioned above, you may even specify and receive a list of parameters in your custom rule:+前に述べたように、カスタムルールに引数のリストを指定し、受け取ることができます：+

s+When building your rules array\.\.\.+ルール配列を作成する時……+

s+In your custom rule\.\.\.+カスタムルールの中で……+

s+In this case, the parameters argument of your validation rule would receive an array containing one element: "yes"\.+この場合、バリデーションルールの引数は、要素が"yes"だけの配列を受け取ります。+

s+Another method for creating and storing custom validation rules is to extend the Validator class itself\. +バリデーションルールを作成し保存する、もうひとつの方法はValidatorクラス自身を拡張することです。+

s+By extending the class you create a new version of the validator that has all of the pre-existing functionality combined with your own custom additions\. +拡張して新しいバージョンのValidatorを作成すれば、既に存在する機能を全部使用しつつ、あなたのカスタム機能を追加できます。+

s+You can even choose to replace some of the default methods if you'd like\. +もし望むのでしたら、デフォルトのメソッドを置き換えることもできます。+

s+Let's look at an example:+例を見ていきましょう。+

s+First, create a class that extends \*\*Laravel\\Validator\*\* and place it in your \*\*application\/libraries\*\* directory:+最初に、**Laravel\\\Validator**を拡張し、**application/libraries**に設置します。+

s+Defining a custom validator class:+カスタムValidatorクラスを定義+


s+Next, remove the Validator alias from \*\*config\/application\.php\*\*\. +次に、**config/application.php**からValidatorの別名(alias)を削除します。+

s+This is necessary so that you don't end up with 2 classes named "Validator" which will certainly conflict with one another\.+これは必要です。そうしないと２つの"Validator"という名前がコンフリクトを起こしてしまいます。+

s+Next, let's take our "awesome" rule and define it in our new class:+次に、"awesome"ルールを新しいクラスに付け加えます。+

s+Adding a custom validation rule:+カスタムバリデーションルールを付け加える+



s+Notice that the method is named using the \*\*validate_rule\*\* naming convention\. +メソッドの名前に、**validate\\_ルール**命名規則を使っていることに注目してください。+

s+The rule is named "awesome" so the method must be named "validate_awesome"\. +"awesome"という名前のルールのメソッドは、"validate\\_awesome"にしなくてはなりません。+

s+This is one way in which registering your custom rules and extending the Validator class are different\. +これがカスタムルールを登録する時と、Validatorクラスを拡張する時の、違いの一つです。+

s+Validator classes simply need to return true or false\. +Validatorクラスはシンプルにtrueかfalseをリターンします。+

s+That's it!+これでおしまいです！+


s+Keep in mind that you'll still need to create a custom message for any validation rules that you create\.  +自分で作ったバリデーションルールのカスタムメッセージを作成する必要があることも、心に留めておいてください。+

s+The method for doing so is the same no matter how you define your rule!+そうしてもらえるのでしたら、どんなルールを定義してもらってもかまいません！+




s+The Validator class provides an awesome array of validation helpers to make validating your data a breeze.+Validatorクラスはデーターのバリデーションを簡単にしてくれる素晴らしいヘルパーを用意してくれています。+

s+Validate that an attribute is present, when another attribute is present:+あるフィールドが入力済みの場合、同時に入力されていることをバリデートする属性です。+



s+Uniqueness & Existence+一意と存在+
s+Inclusion & Exclusion+内包と除外+
s+Alpha, Alpha Numeric, & Alpha Dash+文字種指定+
s+E-Mail Addresses+メールアドレス+
s+Same & Different+他項目との比較+
s/Dates/日付/
s+URLs+URL+
s+Required+必須項目+
s+Size+サイズ+
s+Numeric+数字項目+
s+Acceptance+受け入れの確認+
s+Uploads+アップロードファイル+