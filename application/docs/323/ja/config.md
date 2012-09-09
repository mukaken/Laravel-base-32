# 実行時の環境設定

## 内容

- [基本](#the-basics)
- [オプションを取得する](#retrieving-options)
- [オプションを設定する](#setting-options)

<a name="the-basics"></a>
## 基本

時々、実行時に設定オプションを取得したり、設定したりする必要があるでしょう。**Config**クラスが使用できます。Laravelの「ドット(.)」構文で、設定ファイルと項目にアクセスできます。

<a name="retrieving-options"></a>
##  オプションを取得する

#### 設定オプションを取得する

	$value = Config::get('application.url');

#### オプションが存在しない時、デフォルト値を返す

	$value = Config::get('application.timezone', 'UTC');

#### 設定配列全体を取得する

	$options = Config::get('database');

<a name="setting-options"></a>
## オプションを設定する

#### 設定オプションを設定する

	Config::set('cache.driver', 'apc');