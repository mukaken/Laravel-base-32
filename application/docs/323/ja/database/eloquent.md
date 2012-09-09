# Eloquent ORM

## 内容

- [基本](#the-basics)
- [規約](#conventions)
- [モデルの取得](#get)
- [集計](#aggregates)
- [モデルの挿入と更新](#save)
- [関係付け](#relationships)
- [関係したモデルを挿入](#inserting-related-models)
- [中間テーブルの操作](#intermediate-tables)
- [Eagerローディング](#eager)
- [Eagerローディンクを作成](#constraining-eager-loads)
- [セッター／ゲッターメソッド](#getter-and-setter-methods)
- [複数代入](#mass-assignment)
- [モデルを配列に変換](#to-array)

<a name="the-basics"></a>
## 基本

ORMは[オブジェクトリレーショナルマッパー](http://ja.wikipedia.org/wiki/%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E9%96%A2%E4%BF%82%E3%83%9E%E3%83%83%E3%83%94%E3%83%B3%E3%82%B0)で、Laravelでは本当に使いやすくなっています。名前は"Eloquent（雄弁な）"です。なぜなら、データベースオブジェクトと関連性を扱うのに、雄弁で表現的な構文を使用するからです。一般的には、データベースのテーブルそれぞれをEloquentモデルとして定義します。最初に、シンプルなモデルを定義しましょう。

	class User extends Eloquent {}

ナイスですね！**Eloquent**クラスを拡張したモデルであることに注目してください。このクラスはデータベースを表情豊かに取り扱うために、必要な機能を全て提供しています。

> **注目：**通常、Eloquentモデルは、**application/models**ディレクトリーに設置されます。

<a name="conventions"></a>
## 規約

Eloquentでは、データベース構造に関して、いくつかの基本的な規約があります。

- それぞれのテーブルは、**id**という名前のプライマリーキーを持つ。
- それぞれのテーブル名は、対応するモデルの複数形の名前で無くてはならない。

時には、モデルの複数形ではない名前をテーブル名に使用する必要がありますよね。大丈夫です。モデルに、staticな**table**プロパティを追加してください。

	class User extends Eloquent {

	     public static $table = 'my_users';

	}

<a name="get"></a>
## モデルの取得

Eloquentを使用して、モデルを取得するのは、心地よいほど簡単です。最も基本的なEloquentモデルを取得する方法はstaticの**find**メソッドです。これはプライマリーキーを指定し、、テーブルの各カラムに対応したプロパティを持つモデルをリターンするメソッドです。

	$user = User::find(1);

	echo $user->email;

findメソッドは、次のようなクエリーを実行します。

	SELECT * FROM "users" WHERE "id" = 1

テーブル全体を取得する必要がありますか？staticの**all**メソッドを使ってください。

	$users = User::all();

	foreach ($users as $user)
	{
	     echo $user->email;
	}

もちろん、テーブル全部を取得できてもそれほど便利ではありません。ありがたいことに、**Fluentクエリービルダーの全てのメソッドは、Eloquentでも使用可能です。**モデルを最初はstaticな[クエリービルダー](/docs/database/query)から始め、**get**か*first*メソッドでqueryを実行してください。getメソッドはモデルの配列を返し、一方のfirstメソッドは、１モデルを返します。

	$user = User::where('email', '=', $email)->first();

	$user = User::where_email($email)->first();

	$users = User::where_in('id', array(1, 2, 3))->or_where('email', '=', $email)->get();

	$users = User::order_by('votes', 'desc')->take(10)->get();

> **注目：**結果が見つからない場合、**first**モデルはNULLをリターンします。**all**メソッドと**get**メソッドは空の配列を返します。

<a name="aggregates"></a>
## 集計

**最小**、**最大**、**平均**、**合計**、**件数**が必要ですか？適したメソッドにカラム名を渡すだけです。

	$min = User::min('id');

	$max = User::max('id');

	$avg = User::avg('id');

	$sum = User::sum('id');

	$count = User::count();

もちろん、初めにWHERE節を使い、クエリーの数を絞ることもできます。

	$count = User::where('id', '>', 10)->count();

<a name="save"></a>
## モデルの挿入と更新

Eloquenモデルを挿入するのは、多少手間がかかります。最初は新しいモデルのインスタンスを作成します。次に、プロパティをセットします。最後に**save**メソッドを実行します。

	$user = new User;

	$user->email = 'example@gmail.com';
	$user->password = 'secret';

	$user->save();

他の手法として、**create**メソッドは、新しいレコードをデータベースに挿入し、その新しいレコードのインスタンスを返します。挿入に失敗すると、**false**を返します。

	$user = User::create(array('email' => 'example@gmail.com'));

モデルの更新はとてもシンプルです。新しいモデルのインスタンスを作成する代わりに、データベースから１つデータを獲得します。それから、プロパティをセットし、saveします。

	$user = User::find(1);

	$user->email = 'new_email@gmail.com';
	$user->password = 'new_secret';

	$user->save();

データベースレコードの作成日時と更新日時のタイムスタンプをメンテする必要がある？Eloquentを使うのでしたら、心配する必要はありません。モデルに**timestamps**プロパティを付け加えてください。

	class User extends Eloquent {

	     public static $timestamps = true;

	}

次にテーブルへ**create_at**とupdate_at**をdate型で付け加えてください。これで、いつでもモデルを保存すれば、自動的に作成／更新タイプスタンプがセットされます。なになに、どういたしまして。

> **注目：**アプリケーションのデフォルトタイムゾーンは**application/config/application.php**ファイルで変更できます。

<a name="relationships"></a>
## 関係付け

下手なやり方をしない限り、データベーステーブルは他のテーブルと関連を持つでしょう。例えば、注文はユーザーに所属しているものです。また、ポストは多くのコメントを持ちます。Eloquentは関連性を定義でき、関連するモデルをシンプルかつ直感的に取得できるようにします。Laravelは３タイプの関係をサポートしています。

- [１対１](#one-to-one)
- [１対多](#one-to-many)
- [多対多](#many-to-many)

Eloquentモデルに関係を定義するためには、ただ**has_one**、**has_many**、**belongs_to**、**has_many_and_belongs_to**メソッドを結果としてリターンするメソッドを作成してください。詳細を１つずつ、確かめて行きましょう。

<a name="one-to-one"></a>
### １対１

１対１の関係は、関係の中でも一番基本的な形です。例えば、ユーザーが一つの電話を持っていることを表してみましょう。Eloquentでは、この関係をシンプルに記述できます。

	class User extends Eloquent {

	     public function phone()
	     {
	          return $this->has_one('Phone');
	     }

	}

Notice that the name of the related model is passed to the **has_one** method. これで、ユーザーの電話を**phone**メソッドを通して、取得できるようになりました。

	$phone = User::find(1)->phone()->first();

この文で、どんなSQLが実行されるのか確認しましょう。２つのクエリーが実行されます。一つはユーザーを取得し、もうひとつはユーザーの電話を取得します。

	SELECT * FROM "users" WHERE "id" = 1

	SELECT * FROM "phones" WHERE "user_id" = 1

Note that Eloquent assumes the foreign key of the relationship will be **user\_id**. ほとんどの外部キーが、この**モデル_id**規約に従っていることでしょう。しかしながら、他のカラム名を外部キーとして使っているのでしたら、メソッドの２番目の引数として渡してください。

	return $this->has_one('Phone', 'my_foreign_key');

ユーザーの電話をfirstメソッドを使用せず取得したいのですか？大丈夫です。**動的phoneプロパティ**を使ってください。Eloquentは自動的に関係を読み取り、頭の良いことにget（１対多関係の場合）メソッドかfirst（１対１関係の場合）メソッドを呼び出します。

	$phone = User::find(1)->phone;

電話のユーザーを取得する必要がある？phonesテーブルに外部キー(**user_id)があるのですから、この関係を**belongs_to**（所属する）メソッドで表現する必要があります。理屈に合っているでしょう？電話はユーザーに所属しています。**belongs_to**メソッドを使う場合、リレーションシップメソッドの名前は対応する外部キー（**_id**無し）にする必要があります。外部キーの名前が**user_id**ですから、リレーションシップメソッドの名前は**user**になります。

	class Phone extends Eloquent {

	     public function user()
	     {
	          return $this->belongs_to('User');
	     }

	}

素晴らしい！リレーションシップメソッドか動的プロパティーを使い、Phoneモデルを通してUserモデルにアクセスできるようになりました。

	echo Phone::find(1)->user()->first()->email;

	echo Phone::find(1)->user->email;

<a name="one-to-many"></a>
### １対多

ブログポストは多くのコメントを持っていると仮定できます。この関係は**has_many**メソッドを使用して、簡単に定義できます。

	class Post extends Eloquent {

	     public function comments()
	     {
	          return $this->has_many('Comment');
	     }

	}

では、リレーションシップメソッドか動的プロパティを利用し、ポストコメントにアクセスしてみましょう。

	$comments = Post::find(1)->comments()->get();

	$comments = Post::find(1)->comments;

この両方の命令は、次のようなSQLを実行するでしょう。

	SELECT * FROM "posts" WHERE "id" = 1

	SELECT * FROM "comments" WHERE "post_id" = 1

他の外部キーを結び付けたい？大丈夫です。メソッドの第２引数として、渡してください。

	return $this->has_many('Comment', 'my_foreign_key');

多分、あなたは不思議に思っていることでしょう。_もし動的プロパティが関係を返し、キーストロークを節約してくれるのなら、どうしてリレーションシップメソッドを使う必要があるのだろう？_実は、リレーションシップメソッドは、とてもパワフルなんです。関連を取得する前に、クエリーメソッドをチェーンして続けることができるのです。確認してみましょう。

	echo Post::find(1)->comments()->order_by('votes', 'desc')->take(10)->get();

<a name="many-to-many"></a>
### 多対多

多対多関係は、３つの中で一番込み入っています。けれど心配しないでください。これを理解できますよ。例えば、ユーザー(User)は多くの役割(Roles)を持ち、役割(Role)も多くのユーザー(Users)に所属されます。この関係を実現するために３つのデータベーステーブルを作成する必要があります。**users**テーブル、**roles**テーブル、**role_user**テーブルです。それぞれのテーブルの構造は、次のようになるでしょう。

**Users:**

	id    - INTEGER
	email - VARCHAR

**Roles:**

	id   - INTEGER
	name - VARCHAR

**Roles_Users:**

	user_id - INTEGER
	role_id - INTEGER

これで、**has_many_and_belongs_to**メソッドを用い、モデルの関係を定義できるようになりました。

	class User extends Eloquent {

	     public function roles()
	     {
	          return $this->has_many_and_belongs_to('Role');
	     }

	}

素晴らしい！それでは、ユーザーの役割を取得してみましょう。

	$roles = User::find(1)->roles()->get();

または、通常動的プロパティを通して、関係を取得するでしょうね。

	$roles = User::find(1)->roles;

既にお分かりのことと思いますが、中間テーブルのデフォルト名は、２つのモデルの単数形をアルファベット順に下線でつなげたものになります。しかし、自分でテーブル名を指定することもできます。**has_and_belongs_to_many**メソッドの、第２引数としてテーブル名を渡してください。

	class User extends Eloquent {

	     public function roles()
	     {
	          return $this->has_many_and_belongs_to('Role', 'user_roles');
	     }

	}

<a name="inserting-related-models"></a>
## 関係したモデルを挿入

**Post**モデルは多くのコメントを持つと想定してください。与えられたポストに対して、新しいコメントをしばしば挿入する必要があります。モデルの**post_id**外部キーを手動でセットする代わりに、新しいコメントを所有されているPostモデルから挿入することが可能です。次のようなコードになります。

	$comment = new Comment(array('message' => 'A new comment.'));

	$post = Post::find(1);

	$post->comments()->insert($comment);

親のモデルを通して関連するモデルを挿入する場合、外部キーは自動的に設定されます。ですからこの場合、新しく挿入されたコメントでしたら、"post_id"に"1"が自動的にセットされます。

<a name="has-many-save"></a>
"has_many"関係を取り扱っている場合、"save"メソッドを関連するモデルの挿入／更新に使用できます。

	$comments = array(
		array('message' => 'A new comment.'),
		array('message' => 'A second comment.'),
	);

	$post = Post::find(1);

	$post->comments()->save($comments);

### 関係したモデルを挿入 (多対多)

こうした機能は、多対多関係で、更に便利になります。例えば、**User**モデルは、多くの役割(roles)を持っていると考えてください。同様に、**Role**モデルは、多くのユーザーに所属しています。ですから、この関係の中間テーブルは、"user_id"と"role_id"カラムを持っています。では、ユーザーへ新しい役割を挿入してみましょう。

	$role = new Role(array('title' => 'Admin'));

	$user = User::find(1);

	$user->roles()->insert($role);

役割が挿入された時、"roles"テーブルにRoleが挿入されただけではなく、中間テーブルにもレコードが挿入されます。面倒ですからね！

しかしながら、しばしば新しいレコードを中韓テーブルに挿入したくなるでしょう。多分、既に存在するユーザーに、役割を追加したい時などです。attachメソッドを使用してください。

	$user->roles()->attach($role_id);

<a name="sync-method"></a>
別の方法として、"sync"メソッドも使用できます。中間テーブルで同期(sync)させたいIDの配列を渡します。この操作が完了すると、配列の中のIDだけが中間テーブルに存在することになります。

	$user->roles()->sync(array(1, 2, 3));

<a name="intermediate-tables"></a>
## 中間テーブルの操作

多分ご存知でしょうが、多対多関係は中間テーブルを必要としています。Eloquentはこのテーブルの管理を簡単にしてくれています。例えば、**User**モデルが、多くの役割(roles)を持っていると考えてください。そして同様に、**Role**モデルはたくさんのユーザーを持っています。ですから、中間テーブルは"user_id"と"role_id"カラムを持ちます。この関係のピボットテーブルにアクセスできます。

	$user = User::find(1);

	$pivot = $user->roles()->pivot();

一度ピボットテーブルのインスタンスを作成してしまえば、他のEloquentモデルと同様に使用することができます。

	foreach ($user->roles()->pivot()->get() as $row)
	{
		//
	}

さらに、レコードを指定することで、特定の中間テーブルのレコードにアクセスすることもできます。例えば：

	$user = User::find(1);

	foreach ($user->roles as $role)
	{
		echo $role->pivot->created_at;
	}

私達が取得した、個々の関係した**Role**モデルは、自動的に**pivot**属性を結びつけます。この属性は、関係するモデルに結びついた、中間テーブルのレコードを表すモデルで構成されています。

時々、指定したリレーションシップモデルの中間テーブルから全てのレコードを削除したい場合もあるでしょう。例えば、あるユーザーに結びつけた役割を全て削除したい場合です。どうやるか見てみましょう。

	$user = User::find(1);

	$user->roles()->delete();

これは役割を"roles"テーブルるから削除しないことに注意してください。ただ、指定したユーザーに結びついている役割のレコードを中間テーブルから削除しているだけです。

<a name="eager"></a>
## Eagerローディング

EagerローディングはN+1クエリー問題を和らげるために存在しています。具体的にはどんな問題でしょうか？えー、それぞれの本は著者に所属するとしましょう。この関係を表すと、次のようになります。

	class Book extends Eloquent {

	     public function author()
	     {
	          return $this->belongs_to('Author');
	     }

	}

では、次のコードを試してみましょう。

	foreach (Book::all() as $book)
	{
	     echo $book->author->name;
	}

一体いくつのクエリーが実行されるのでしょうか？ええと、まず一つはテーブルのすべての本を取得するために実行されます。それから、著者を取得するため、それぞれの本についてクエリーが実行されます。To display the author name for 25 books would require **26 queries**. 合計でどのくらいの速度になると思いますか？

ありがたいことに、**with**メソッドを使えば、autherモデルをEagerロードできます。Eagerロードしたい関係の**関数名**を使ってください。

	foreach (Book::with('author')->get() as $book)
	{
	     echo $book->author->name;
	}

この例でしたら、**たったの２クエリーだけが実行されます**

	SELECT * FROM "books"

	SELECT * FROM "authors" WHERE "id" IN (1, 2, 3, 4, 5, ...)

明らかに、Eagerロードを使えば、アプリケーションのパフォーマンスをドラマティックに改善してくれます。上の例でしたら、Eagerロードで実行時間は半分になります。

２つ以上の関連でEagerロードを使用する必要がありますか？簡単です。

	$books = Book::with(array('author', 'publisher'))->get();

> **注目：**Eagerロードを使用する時は、いつもstaticの**with**メソッドでクエリーを開始してください。

ネストした関係のEagerロードをしたい場合もあるでしょう。例えば、**Author**モデルが"contacts"関係を持っているとしましょう。Bookモデルから、両方の関係のEagerロードが可能です。

	$books = Book::with(array('author', 'author.contacts'))->get();

<a name="constraining-eager-loads"></a>
## Eagerローディンクを作成

Eagerロードだけではなく、Eagerロードに条件を付けたい時もあるでしょう。簡単です。次のようなコードになります。

	$users = User::with(array('posts' => function($query)
	{
		$query->where('title', 'like', '%first%');

	}))->get();

この例ではユーザーのポストをEagerロードしていますが、ポストのタイトルに"first"がつかわれているものだけを選択しています。

<a name="getter-and-setter-methods"></a>
## Getter & Setter Methods

セッターはカスタムメソッドを使用し、属性を結びつけられるようにしてくれます。セッターは、属性の名前に"set_"を付けたもので定義してください。

	public function set_password($password)
	{
		$this->set_attribute('hashed_password', Hash::make($password));
	}

セッターは変数のように括弧無しで呼び出し、名前は"set_"プリフィックスを除いたメソッド名になります。

	$this->password = "my new password";

ゲッターも似ています。属性がリターンされる前に更新するためにつかわれます。属性の名前の前に"get_"を付け、定義してください。

	public function get_published_date()
	{
		return date('M j, Y', $this->get_attribute('published_at'));
	}

ゲッターも変数のように括弧無しで呼び出し、"get_"無しのメソッド名になります。

	echo $this->published_date;

<a name="mass-assignment"></a>
## 複数代入

複数代入は連想配列を渡し、モデルの属性にその配列の値を埋める方法です。複数代入はモデルのコンストラクターに配列を渡すことで行えます。

	$user = new User(array(
		'username' => 'first last',
		'password' => 'disgaea'
	));

	$user->save();

もしくは、**fill**メソッドを使うことでも複数代入が行えます。

	$user = new User;

	$user->fill(array(
		'username' => 'first last',
		'password' => 'disgaea'
	));

	$user->save();

複数代入のデフォルトでは、全ての属性のキー／値のペアが保存されます。しかし、値をセットできる属性のホワイトリストを作成することも可能です。アクセスできる属性のホワイトリストがセットされると、指定されている属性だけが複数代入されます。

アクセスできる属性を指定するには、staticの**accessible**配列に設定してください。この配列は、複数代入可能な属性で構成されています。

	public static $accessible = array('email', 'password', 'name');

もしくは**accessible**メソッドをモデルに対し使用してください。

	User::accessible(array('email', 'password', 'name'));

> **注目：**複数代入をユーザーの入力に対して使用する時は、最大限の注意を行なってください。技術の過信は、重大なセキュリティ脆弱性を生みます。

<a name="to-array"></a>
## モデルを配列に変換

JSON APIを作成している場合、頻繁にモデルを配列にコンバートするでしょう。そのために簡単にシリアライズできるようになっています。本当にシンプルです。

#### モデルを配列に変換

	return json_encode($user->to_array());

"to_arrya"メソッドはモデルの属性全てへ、自動的に用意されます。

場合により、例えばパスワードのようなモデルの配列に含みたくない属性もあるでしょう。これを行うには、モデルに"hidden"属性を追加してください。

#### 配列で指定した属性を含めないようにする

	class User extends Eloquent {

		public static $hidden = array('password');

	}