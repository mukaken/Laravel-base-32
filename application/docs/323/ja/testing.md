# ユニットテスト

## 内容

- [基本](#the-basics)
- [テストクラスを作成する](#creating-test-classes)
- [テストを実行する](#running-tests)
- [テストからコントローラーを呼び出す](#calling-controllers-from-tests)

<a name="the-basics"></a>
## 基本

ユニットテストはあなたのコードをテストし、正しく動作していることを確認します。実際、多くの推奨者達はコードを書く前に、テストを書くことさえ行なっています。Laravelは人気のある[PHPUnit](http://www.phpunit.de/manual/current/ja/)テストライブラリーを美しく統合し、テストを書き始めることを簡単にしてくれています。事実、Laravelフレームワーク自身も何百ものユニットテストが行われています。

<a name="creating-test-classes"></a>
## テストクラスを作成する

すべてのアプリケーションのテストは、**application/tests**ディレクトリーに置かれます。このディレクトリーに、基本的な**example.test.php**ファイルを見つけられることでしょう。開いて、クラスの構成を見て下さい。

	<?php

	class TestExample extends PHPUnit_Framework_TestCase {

		/**
		 * Test that a given condition is met.
		 *
		 * @return void
		 */
		public function testSomethingIsTrue()
		{
			$this->assertTrue(true);
		}

	}

ファイルのサフィック、**.test.php**に特に気をつけてください。これはLaravelにテスト実行時に、このファイルはテストケースのクラスであると告げています。testディレクトリーにある、このサフィックスが付いていないファイルは全て、テストケースとして扱われません。

If you are writing tests for a bundle, just place them in a **tests** directory within the bundle. Laravelが残りの面倒を見ます！

テストケース作成に関係する、残りの情報は[PHPUnitドキュメント](http://www.phpunit.de/manual/current/ja/)をご覧ください。

<a name="running-tests"></a>
## テストを実行する

テストの実行には、Laravelのartisanコマンドラインユーティリティが使用できます。

#### artisan CLIで、アプリケーションテストを実行する

	php artisan test

#### バンドルのユニットテストを実行

	php artisan test bundle-name

<a name="#calling-controllers-from-tests"></a>
## テストからコントローラーを呼び出す

テストからコントローラーをどうやって呼び出すかのサンプルです。

#### テストからコントローラーを呼び出す

	$response = Controller::call('home@index', $parameters);

#### テストで、コントローラーのインスタンスを生成する

	$controller = Controller::resolve('application', 'home@index');

> **注目：**Controller::callを使用し、コントローラーアクションを実行する時、コントローラーのアクションフィルターは実行されます。