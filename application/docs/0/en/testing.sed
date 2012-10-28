s+Unit Testing allows you to test your code and verify that it is working correctly\. +ユニットテストはあなたのコードをテストし、正しく動作していることを確認します。+

s+In fact, many advocate that you should even write your tests before you write your code! +実際、多くの推奨者達はコードを書く前に、テストを書くことさえ行なっています。+

s+Laravel provides beautiful integration with the popular \[PHPUnit\](http:\/\/www\.phpunit\.de\/manual\/current\/en\/) testing library, making it easy to get started writing your tests\. +Laravelは人気のある[PHPUnit](http://www.phpunit.de/manual/current/ja/)テストライブラリーを美しく統合し、テストを書き始めることを簡単にしてくれています。+

s+In fact, the Laravel framework itself has hundreds of unit tests!+事実、Laravelフレームワーク自身も何百ものユニットテストが行われています。+


s+All of your application's tests live in the \*\*application\/tests\*\* directory\. +すべてのアプリケーションのテストは、**application/tests**ディレクトリーに置かれます。+

s+In this directory, you will find a basic \*\*example\.test\.php\*\* file\. +このディレクトリーに、基本的な**example.test.php**ファイルを見つけられることでしょう。+

s+Pop it open and look at the class it contains:+開いて、クラスの構成を見て下さい。+


s+Take special note of the \*\*\.test\.php\*\* file suffix\. +ファイルのサフィック、**.test.php**に特に気をつけてください。+

s+This tells Laravel that it should include this class as a test case when running your test\. +これはLaravelにテスト実行時に、このファイルはテストケースのクラスであると告げています。+

s+Any files in the test directory that are not named with this suffix will not be considered a test case\.+testディレクトリーにある、このサフィックスが付いていないファイルは全て、テストケースとして扱われません。+


s+If you are writing tests for a bundle, just place them in a \*\*tests\*\* directory within the bundle\. +もし、バンドルにテストを書くのでしたら、バンドルの中の**tests**ディレクトリーに置いてください+

s+Laravel will take care of the rest!+Laravelが残りの面倒を見ます！+

s+For more information regarding creating test cases, check out the \[PHPUnit documentation\](http:\/\/www\.phpunit\.de\/manual\/current\/en\/)\.+テストケース作成に関係する、残りの情報は[PHPUnitドキュメント](http://www.phpunit.de/manual/current/ja/)をご覧ください。+



s+To run your tests, you can use Laravel's Artisan command-line utility:+テストの実行には、Laravelのartisanコマンドラインユーティリティが使用できます。+

s+Running the application's tests via the Artisan CLI:+artisan CLIで、アプリケーションテストを実行する+

s+Running the unit tests for a bundle:+バンドルのユニットテストを実行+



s+Here's an example of how you can call your controllers from your tests:+テストからコントローラーをどうやって呼び出すかのサンプルです。+

s+Calling a controller from a test:+テストからコントローラーを呼び出す+


s+Resolving an instance of a controller from a test:+テストで、コントローラーのインスタンスを生成する+

s+\*\*Note:\*\* The controller's action filters will still run when using Controller::call to execute controller actions\.+**注目：**Controller::callを使用し、コントローラーアクションを実行する時、コントローラーのアクションフィルターは実行されます。+
