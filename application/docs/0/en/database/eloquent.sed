s+An ORM is an \[object-relational mapper\](http:\/\/en\.wikipedia\.org\/wiki\/Object-relational_mapping), and Laravel has one that you will absolutely love to use\. +ORMは[オブジェクトリレーショナルマッパー](http://ja.wikipedia.org/wiki/%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E9%96%A2%E4%BF%82%E3%83%9E%E3%83%83%E3%83%94%E3%83%B3%E3%82%B0)で、Laravelでは本当に使いやすくなっています。+

s+It is named "Eloquent" because it allows you to work with your database objects and relationships using an eloquent and expressive syntax\. +名前は"Eloquent（雄弁な）"です。なぜなら、データベースオブジェクトと関連性を扱うのに、雄弁で表現的な構文を使用するからです。+

s+In general, you will define one Eloquent model for each table in your database\. +一般的には、データベースのテーブルそれぞれをEloquentモデルとして定義します。+

s+To get started, let's define a simple model:+最初に、シンプルなモデルを定義しましょう。+


s+Nice! +ナイスですね！+

s+Notice that our model extends the \*\*Eloquent\*\* class\. +**Eloquent**クラスを拡張したモデルであることに注目してください。+

s+This class will provide all of the functionality you need to start working eloquently with your database\.+このクラスはデータベースを表情豊かに取り扱うために、必要な機能を全て提供しています。+

s+\*\*Note:\*\* Typically, Eloquent models live in the \*\*application\/models\*\* directory\.+**注目：**通常、Eloquentモデルは、**application/models**ディレクトリーに設置されます。+


s+Eloquent makes a few basic assumptions about your database structure:+Eloquentでは、データベース構造に関して、いくつかの基本的な規約があります。+

s+Each table should have a primary key named \*\*id\*\*\.+それぞれのテーブルは、**id**という名前のプライマリーキーを持つ。+

s+Each table name should be the plural form of its corresponding model name\.+それぞれのテーブル名は、対応するモデルの複数形の名前で無くてはならない。+

s+Sometimes you may wish to use a table name other than the plural form of your model\. +時には、モデルの複数形ではない名前をテーブル名に使用する必要がありますよね。+

s+No problem\. +大丈夫です。+

s+Just add a static \*\*table\*\* property your model:+モデルに、staticな**table**プロパティを追加してください。+



s+Retrieving models using Eloquent is refreshingly simple\. +Eloquentを使用して、モデルを取得するのは、心地よいほど簡単です。+

s+The most basic way to retrieve an Eloquent model is the static \*\*find\*\* method\. +最も基本的なEloquentモデルを取得する方法はstaticの**find**メソッドです。+

s+This method will return a single model by primary key with properties corresponding to each column on the table:+これはプライマリーキーを指定し、テーブルの各カラムに対応したプロパティを持つモデルをリターンするメソッドです。+


s+The find method will execute a query that looks something like this:+findメソッドは、次のようなクエリーを実行します。+

s+Need to retrieve an entire table? +テーブル全体を取得する必要がありますか？+

s+Just use the static \*\*all\*\* method:+staticの**all**メソッドを使ってください。+


s+Of course, retrieving an entire table isn't very helpful\. +もちろん、テーブル全部を取得できてもそれほど便利ではありません。+

s+Thankfully, \*\*every method that is available through the fluent query builder is available in Eloquent\*\*\. +ありがたいことに、**Fluentクエリービルダーの全てのメソッドは、Eloquentでも使用可能です。**+

s+Just begin querying your model with a static call to one of the \[query builder\](\/docs\/database\/fluent) methods, and execute the query using the \*\*get\*\* or \*\*first\*\* method\. +モデルを最初はstaticな[クエリービルダー](/docs/database/query)から始め、**get**か**first**メソッドでqueryを実行してください。+

s+The get method will return an array of models, while the first method will return a single model:+getメソッドはモデルの配列を返し、一方のfirstメソッドは、モデルをひとつだけ返します。+


s+\*\*Note:\*\* If no results are found, the \*\*first\*\* method will return NULL\. +**注目：**結果が見つからない場合、**first**モデルはNULLをリターンします。+

s+The \*\*all\*\* and \*\*get\*\* methods return an empty array\.+**all**メソッドと**get**メソッドは空の配列を返します。+


s+Need to get a \*\*MIN\*\*, \*\*MAX\*\*, \*\*AVG\*\*, \*\*SUM\*\*, or \*\*COUNT\*\* value? +**最小**、**最大**、**平均**、**合計**、**件数**が必要ですか？+

s+Just pass the column to the appropriate method:+適したメソッドにカラム名を渡すだけです。+


s+Of course, you may wish to limit the query using a WHERE clause first:+もちろん、初めにWHERE節を使い、クエリーの数を絞ることもできます。+


s+Inserting Eloquent models into your tables couldn't be easier\. +Eloquenモデルを挿入するのは、多少手間がかかります。+

s+First, instantiate a new model\. +最初は新しいモデルのインスタンスを作成します。+

s+Second, set its properties\. +次に、プロパティをセットします。+

s+Third, call the \*\*save\*\* method:+最後に**save**メソッドを実行します。+


s+Alternatively, you may use the \*\*create\*\* method, which will insert a new record into the database and return the model instance for the newly inserted record, or \*\*false\*\* if the insert failed\.+他の手法として、**create**メソッドは、新しいレコードをデータベースに挿入し、その新しいレコードのインスタンスを返します。挿入に失敗すると、**false**を返します。+


s+Updating models is just as simple\. +モデルの更新はとてもシンプルです。+

s+Instead of instantiating a new model, retrieve one from your database\. +新しいモデルのインスタンスを作成する代わりに、データベースから１つデータを獲得します。+

s+Then, set its properties and save:+それから、プロパティをセットし、saveします。+



s+Need to maintain creation and update timestamps on your database records? +データベースレコードの作成日時と更新日時のタイムスタンプをメンテする必要がある？+

s+With Eloquent, you don't have to worry about it\. +Eloquentを使うのでしたら、心配する必要はありません。+

s+Just add a static \*\*timestamps\*\* property to your model:+モデルに**timestamps**プロパティを付け加えてください。+


s+Next, add \*\*created_at\*\* and \*\*updated_at\*\* date columns to your table\. +次にテーブルへ**create_at**と**update_at**をdate型で付け加えてください。+

s+Now, whenever you save the model, the creation and update timestamps will be set automatically\. +これで、いつでもモデルを保存すれば、自動的に作成／更新タイプスタンプがセットされます。+

s+You're welcome\.+なになに、どういたしまして。+

s+\*\*Note:\*\* You can change the default timezone of your application in the \*\*application\/config\/application\.php\*\* file\.+**注目：**アプリケーションのデフォルトタイムゾーンは**application/config/application.php**ファイルで変更できます。+


s+Unless you're doing it wrong, your database tables are probably related to one another\. +下手なやり方をしない限り、データベーステーブルは他のテーブルと関連を持つでしょう。+

s+For instance, an order may belong to a user\. +例えば、注文はユーザーに所属しているものです。+

s+Or, a post may have many comments\. +また、ポストは多くのコメントを持ちます。+

s+Eloquent makes defining relationships and retrieving related models simple and intuitive\. +Eloquentは関連性を定義でき、関連するモデルをシンプルかつ直感的に取得できるようにします。+

s+Laravel supports three types of relationships:+Laravelは３タイプの関係をサポートしています。+

s+To define a relationship on an Eloquent model, you simply create a method that returns the result of either the \*\*has\\\_one\*\*, \*\*has\\\_many\*\*, \*\*belongs\\\_to\*\*, or \*\*has\\\_many\\\_and\\\_belongs\\\_to\*\* method\. +Eloquentモデルに関係を定義するためには、ただ**has_one**、**has_many**、**belongs_to**、**has_many_and_belongs_to**メソッドを結果としてリターンするメソッドを作成してください。+

s+Let's examine each one in detail\.+詳細を１つずつ、確かめて行きましょう。+


s+A one-to-one relationship is the most basic form of relationship\. +１対１の関係は、関係の中でも一番基本的な形です。+

s+For example, let's pretend a user has one phone\. +例えば、ユーザーが一つの電話を持っていることを表してみましょう。+

s+Simply describe this relationship to Eloquent:+Eloquentでは、この関係をシンプルに記述できます。+



s+Notice that the name of the related model is passed to the \*\*has\_one\*\* method\. +関係するモデル名を**has_one**メソッドに渡していることに注目してください。+

s+You can now retrieve the phone of a user through the \*\*phone\*\* method:+これで、ユーザーの電話を**phone**メソッドを通して、取得できるようになりました。+


s+Let's examine the SQL performed by this statement\. +この文で、どんなSQLが実行されるのか確認しましょう。+

s+Two queries will be performed: one to retrieve the user and one to retrieve the user's phone:+２つのクエリーが実行されます。一つはユーザーを取得し、もうひとつはユーザーの電話を取得します。+


s+Note that Eloquent assumes the foreign key of the relationship will be \*\*user\\\_id\*\*. +関連付けの外部キーとして、Eloquent は **user_id**を使用していることに気をつけてください。+

s+Most foreign keys will follow this \*\*model\\\_id\*\* convention; however, if you want to use a different column name as the foreign key, just pass it in the second parameter to the method:+ほとんどの外部キーが、この**モデル_id**規約に従っていることでしょう。しかしながら、他のカラム名を外部キーとして使っているのでしたら、メソッドの２番目の引数として渡してください。+


s+Want to just retrieve the user's phone without calling the first method? +ユーザーの電話をfirstメソッドを使用せず取得したいのですか？+

s+No problem\. +分かりました。+

s+Just use the \*\*dynamic phone property\*\*\. +**動的phoneプロパティ**を使ってください。+

s+Eloquent will automatically load the relationship for you, and is even smart enough to know whether to call the get (for one-to-many relationships) or first (for one-to-one relationships) method:+Eloquentは自動的に関係を読み取り、頭の良いことにget（１対多関係の場合）メソッドかfirst（１対１関係の場合）メソッドを呼び出します。+


s+What if you need to retrieve a phone's user? +電話のユーザーを取得する必要がある？+

s+Since the foreign key (\*\*user\\\_id\*\*) is on the phones table, we should describe this relationship using the \*\*belongs\\\_to\*\* method\. +phonesテーブルに外部キー(**user_id**)があるのですから、この関係を**belongs_to**（所属する）メソッドで表現する必要があります。+

s+It makes sense, right? +理屈に合っているでしょう？+

s+Phones belong to users\. +電話はユーザーに所属しています。+

s+When using the \*\*belongs\\\_to\*\* method, the name of the relationship method should correspond to the foreign key (sans the \*\*\\\_id\*\*)\. +**belongs_to**メソッドを使う場合、リレーションシップメソッドの名前は対応する外部キー（**_id**無し）にする必要があります。+

s+Since the foreign key is \*\*user\\\_id\*\*, your relationship method should be named \*\*user\*\*:+外部キーの名前が**user_id**ですから、リレーションシップメソッドの名前は**user**になります。+


s+Great! +素晴らしい！+

s+You can now access a User model through a Phone model using either your relationship method or dynamic property:+リレーションシップメソッドか動的プロパティーを使い、Phoneモデルを通してUserモデルにアクセスできるようになりました。+




s+Assume a blog post has many comments\. +ブログポストは多くのコメントを持っていると仮定できます。+

s+It's easy to define this relationship using the \*\*has_many\*\* method:+この関係は**has_many**メソッドを使用して、簡単に定義できます。+


s+Now, simply access the post comments through the relationship method or dynamic property:+では、リレーションシップメソッドか動的プロパティを利用し、ポストコメントにアクセスしてみましょう。+


s+Both of these statements will execute the following SQL:+この両方の命令は、次のようなSQLを実行するでしょう。+

s+Want to join on a different foreign key? +他の外部キーを結び付けたい？+

s+No problem\. +大丈夫です。+

s+Just pass it in the second parameter to the method:+メソッドの第２引数として、渡してください。+


s+You may be wondering: \_If the dynamic properties return the relationship and require less keystrokes, why would I ever use the relationship methods?\_ +多分、あなたは不思議に思っていることでしょう。_もし動的プロパティが関係を返し、キーストロークを節約してくれるのなら、どうしてリレーションシップメソッドを使う必要があるのだろう？_+

s+Actually, relationship methods are very powerful\. +実は、リレーションシップメソッドは、とてもパワフルなんです。+

s+They allow you to continue to chain query methods before retrieving the relationship\. +関連を取得する前に、クエリーメソッドをチェーンして続けることができるのです。+

s+Check this out:+確認してみましょう。+




s+Many-to-many relationships are the most complicated of the three relationships\. +多対多関係は、３つの中で一番込み入っています。+

s+But don't worry, you can do this\. +けれど心配しないでください。これを理解できますよ。+

s+For example, assume a User has many Roles, but a Role can also belong to many Users\. +例えば、ユーザー(User)は多くの役割(Roles)を持ち、役割(Role)も多くのユーザー(Users)に所属されます。+

s+Three database tables must be created to accomplish this relationship: a \*\*users\*\* table, a \*\*roles\*\* table, and a \*\*role_user\*\* table\. +この関係を実現するために３つのデータベーステーブルを作成する必要があります。**users**テーブル、**roles**テーブル、**role_user**テーブルです。+

s+The structure for each table looks like this:+それぞれのテーブルの構造は、次のようになるでしょう。+


s+Now you're ready to define the relationship on your models using the \*\*has\\\_many\\\_and\\\_belongs\\\_to\*\* method:+これで、**has_many_and_belongs_to**メソッドを用い、モデルの関係を定義できるようになりました。+

s+Great! +グレート！+

s+Now it's time to retrieve a user's roles:+それでは、ユーザーの役割を取得してみましょう。+

s+Or, as usual, you may retrieve the relationship through the dynamic roles property:+または、通常動的プロパティを通して、関係を取得するでしょうね。+


s+As you may have noticed, the default name of the intermediate table is the singular names of the two related models arranged alphabetically and concatenated by an underscore\. +既にお分かりのことと思いますが、中間テーブルのデフォルト名は、２つのモデルの単数形をアルファベット順に下線でつなげたものになります。+

s+However, you are free to specify your own table name\. +しかし、自分でテーブル名を指定することもできます。+

s+Simply pass the table name in the second parameter to the \*\*has\\\_and\\\_belongs\\\_to\\\_many\*\* method:+**has_and_belongs_to_many**メソッドの、第２引数としてテーブル名を渡してください。+




s+Let's assume you have a \*\*Post\*\* model that has many comments\. +**Post**モデルは多くのコメントを持つと想定してください。+

s+Often you may want to insert a new comment for a given post\. +与えられたポストに対して、新しいコメントをしばしば挿入する必要があります。+

s+Instead of manually setting the \*\*post_id\*\* foreign key on your model, you may insert the new comment from it's owning Post model\. +モデルの**post_id**外部キーを手動でセットする代わりに、新しいコメントを所有されているPostモデルから挿入することが可能です。+

s+Here's what it looks like:+次のようなコードになります。+


s+When inserting related models through their parent model, the foreign key will automatically be set\. +親のモデルを通して関連するモデルを挿入する場合、外部キーは自動的に設定されます。+

s+So, in this case, the "post_id" was automatically set to "1" on the newly inserted comment\.+ですからこの場合、新しく挿入されたコメントでしたら、"post_id"に"1"が自動的にセットされます。+


s+When working with `has_many` relationships, you may use the `save` method to insert \/ update related models:+"has_many"関係を取り扱っている場合、"save"メソッドを関連するモデルの挿入／更新に使用できます。+



s+This is even more helpful when working with many-to-many relationships\. +こうした機能は、多対多関係で、更に便利になります。+

s+For example, consider a \*\*User\*\* model that has many roles\. +例えば、**User**モデルは、多くの役割(roles)を持っていると考えてください。+

s+Likewise, the \*\*Role\*\* model may have many users\. +同様に、**Role**モデルは、多くのユーザーに所属しています。+

s+So, the intermediate table for this relationship has "user_id" and "role_id" columns\. +ですから、この関係の中間テーブルは、"user_id"と"role_id"カラムを持っています。+

s+Now, let's insert a new Role for a User:+では、ユーザーへ新しい役割を挿入してみましょう。+


s+Now, when the Role is inserted, not only is the Role inserted into the "roles" table, but a record in the intermediate table is also inserted for you\. +役割が挿入された時、"roles"テーブルにRoleが挿入されただけではなく、中間テーブルにもレコードが挿入されます。+

s+It couldn't be easier!+面倒ですからね！+

s+However, you may often only want to insert a new record into the intermediate table\. +しかしながら、しばしば新しいレコードを中間テーブルに挿入したくなるでしょう。+

s+For example, perhaps the role you wish to attach to the user already exists\. +多分、既に存在するユーザーに、役割を追加したい時などです。+

s+It's also possible to attach data for fields in the intermediate table (pivot table), to do this add a second array variable to the attach command containing the data you want to attach:+また、中間テーブル（ピボットテーブル）のフィールドにデーターを追加することも可能です。追加したいデータを含んだ追加コマンドを２つ目の変数配列として付け加えます。+

s+Just use the attach method:+attachメソッドを使用してください。+




s+Alternatively, you can use the `sync` method, which accepts an array of IDs to "sync" with the intermediate table\. +別の方法として、"sync"メソッドも使用できます。中間テーブルで同期(sync)させたいIDの配列を渡します。+

s+After this operation is complete, only the IDs in the array will be on the intermediate table\.+この操作が完了すると、配列の中のIDだけが中間テーブルに存在することになります。+



s+As your probably know, many-to-many relationships require the presence of an intermediate table\. +多分ご存知でしょうが、多対多関係は中間テーブルを必要としています。+

s+Eloquent makes it a breeze to maintain this table\. +Eloquentはこのテーブルの管理を簡単にしてくれています。+

s+For example, let's assume we have a \*\*User\*\* model that has many roles\. +例えば、**User**モデルが、多くの役割(roles)を持っていると考えてください。+

s+And, likewise, a \*\*Role\*\* model that has many users\. +そして同様に、**Role**モデルはたくさんのユーザーを持っています。+

s+So the intermediate table has "user_id" and "role_id" columns\. +ですから、中間テーブルは"user_id"と"role_id"カラムを持ちます。+

s+We can access the pivot table for the relationship like so:+この関係のピボットテーブルにアクセスできます。+



s+Once we have an instance of the pivot table, we can use it just like any other Eloquent model:+一度ピボットテーブルのインスタンスを作成してしまえば、他のEloquentモデルと同様に使用することができます。+

s+You may also access the specific intermediate table row associated with a given record\. +さらに、レコードを指定することで、特定の中間テーブルのレコードにアクセスすることもできます。+

s+For example:+例えば：+


s+Notice that each related \*\*Role\*\* model we retrieved is automatically assigned a \*\*pivot\*\* attribute\. +私達が取得した、個々の関係した**Role**モデルは、自動的に**pivot**属性を結びつけます。+

s+This attribute contains a model representing the intermediate table record associated with that related model\.+この属性は、関係するモデルに結びついた、中間テーブルのレコードを表すモデルで構成されています。+

s+Sometimes you may wish to remove all of the record from the intermediate table for a given model relationship\. +時々、指定したリレーションシップモデルの中間テーブルから全てのレコードを削除したい場合もあるでしょう。+

s+For instance, perhaps you want to remove all of the assigned roles from a user\. +例えば、あるユーザーに結びつけた役割を全て削除したい場合です。+

s+Here's how to do it:+どうやるか見てみましょう。+


s+Note that this does not delete the roles from the "roles" table, but only removes the records from the intermediate table which associated the roles with the given user\.+これは役割を"roles"テーブルから削除しないことに注意してください。ただ、指定したユーザーに結びついている役割のレコードを中間テーブルから削除しているだけです。+



s/Eager loading exists to alleviate the N + 1 query problem\. /EagerローディングはN+1クエリー問題を和らげるために存在しています。/

s+Exactly what is this problem? +具体的にはどんな問題でしょうか？+

s+Well, pretend each Book belongs to an Author\. +えー、それぞれの本は著者に所属するとしましょう。+


s+We would describe this relationship like so:+この関係を表すと、次のようになります。+


s+Now, examine the following code:+では、次のコードを試してみましょう。+



s+How many queries will be executed? +一体いくつのクエリーが実行されるのでしょうか？+

s+Well, one query will be executed to retrieve all of the books from the table\. +ええと、まず一つはテーブルのすべての本を取得するために実行されます。+

s+However, another query will be required for each book to retrieve the author\. +それから、著者を取得するため、それぞれの本についてクエリーが実行されます。+

s+To display the author name for 25 books would require \*\*26 queries\*\*. +２５冊の著者の名前を表示するために、**２６回のクエリー**が必要になります。+

s+See how the queries can add up fast?+合計でどのくらいの速度になると思いますか？+

s+Thankfully, you can eager load the author models using the \*\*with\*\* method\. +ありがたいことに、**with**メソッドを使えば、autherモデルをEagerロードできます。+

s+Simply mention the \*\*function name\*\* of the relationship you wish to eager load:+Eagerロードしたい関係の**関数名**を使ってください。+


s+In this example, \*\*only two queries will be executed\*\*!+この例でしたら、**たったの２クエリーだけが実行されます**+


s+Obviously, wise use of eager loading can dramatically increase the performance of your application\. +明らかに、Eagerロードを使えば、アプリケーションのパフォーマンスをドラマティックに改善してくれます。+

s+In the example above, eager loading cut the execution time in half\.+上の例でしたら、Eagerロードで実行時間は半分になります。+

s+Need to eager load more than one relationship? +２つ以上の関連でEagerロードを使用する必要がありますか？+

s+It's easy:+簡単です。+

s+\*\*Note:\*\* When eager loading, the call to the static \*\*with\*\* method must always be at the beginning of the query\.+**注目：**Eagerロードを使用する時は、いつもstaticの**with**メソッドでクエリーを開始してください。+

s+You may even eager load nested relationships\. +ネストした関係のEagerロードをしたい場合もあるでしょう。+

s+For example, let's assume our \*\*Author\*\* model has a "contacts" relationship\. +例えば、**Author**モデルが"contacts"関係を持っているとしましょう。+

s+We can eager load both of the relationships from our Book model like so:+Bookモデルから、両方の関係のEagerロードが可能です。+




s+Sometimes you may wish to eager load a relationship, but also specify a condition for the eager load\. +Eagerロードだけではなく、Eagerロードに条件を付けたい時もあるでしょう。+

s+It's simple\. +簡単です。+

s+Here's what it looks like:+このようになります。+


s+In this example, we're eager loading the posts for the users, but only if the post's "title" column contains the word "first"\.+この例ではユーザーのポストをEagerロードしていますが、ポストのタイトルに"first"がつかわれているものだけを選択しています。+




s+Setters allow you to handle attribute assignment with custom methods\.  +セッターはカスタムメソッドを使用し、属性を結びつけられるようにしてくれます。+

s+Define a setter by appending "set_" to the intended attribute's name\.+セッターは、属性の名前に"set_"を付けたもので定義してください。+

s+Call a setter method as a variable (without parenthesis) using the name of the method without the "set_" prefix\.+セッターは変数のように括弧無しで呼び出し、名前は"set_"プリフィックスを除いたメソッド名になります。+


s+Getters are very similar\. +ゲッターも似ています。+

s+They can be used to modify attributes before they're returned\. +属性がリターンされる前に更新するためにつかわれます。+

s+Define a getter by appending "get_" to the intended attribute's name\.+属性の名前の前に"get_"を付け、定義してください。+

s+Call the getter method as a variable (without parenthesis) using the name of the method without the "get_" prefix\.+ゲッターも変数のように括弧無しで呼び出し、"get_"無しのメソッド名になります。+



s+Mass-assignment is the practice of passing an associative array to a model method which then fills the model's attributes with the values from the array\. +複数代入は連想配列を渡し、モデルの属性にその配列の値を埋める方法です。+

s+Mass-assignment can be done by passing an array to the model's constructor:+複数代入はモデルのコンストラクターに配列を渡すことで行うことができます。+

s+Or, mass-assignment may be accomplished using the \*\*fill\*\* method\.+もしくは、**fill**メソッドを使うことでも複数代入が行えます。+

s+By default, all attribute key\/value pairs will be store during mass-assignment\. +複数代入のデフォルトでは、全ての属性のキー／値のペアが保存されます。+

s+However, it is possible to create a white-list of attributes that will be set\. +しかし、値をセットできる属性のホワイトリストを作成することも可能です。+

s+If the accessible attribute white-list is set then no attributes other than those specified will be set during mass-assignment\.+アクセスできる属性のホワイトリストがセットされると、指定されている属性だけが複数代入されます。+


s+You can specify accessible attributes by assigning the \*\*$accessible\*\* static array\. +アクセスできる属性を指定するには、staticの**accessible**配列に設定してください。+

s+Each element contains the name of a white-listed attribute\.+この配列は、複数代入可能な属性で構成されています。+



s+Alternatively, you may use the \*\*accessible\*\* method from your model:+もしくは**accessible**メソッドをモデルに対し使用してください。+

s+\*\*Note:\*\* Utmost caution should be taken when mass-assigning using user-input\. +**注目：**複数代入をユーザーの入力に対して使用する時は、最大限の注意を行なってください。+

s+Technical oversights could cause serious security vulnerabilities\.+技術の過信は、重大なセキュリティ脆弱性を生みます。+


s+When building JSON APIs, you will often need to convert your models to array so they can be easily serialized\. +JSON APIを作成している場合、頻繁にモデルを配列にコンバートするでしょう。そのために簡単にシリアライズできるようになっています。+

s+It's really simple\.+本当にシンプルです。+

s+Convert a model to an array:+モデルを配列に変換+


s+The `to_array` method will automatically grab all of the attributes on your model, as well as any loaded relationships\.+"to_arrya"メソッドはモデルの属性全てへ、自動的に用意されます。+

s+Sometimes you may wish to limit the attributes that are included in your model's array, such as passwords\. +場合により、例えばパスワードのようなモデルの配列に含みたくない属性もあるでしょう。+

s+To do this, add a `hidden` attribute definition to your model:+これを行うには、モデルに"hidden"属性を追加してください。+

s+Excluding attributes from the array:+配列で指定した属性を含めないようにする+


s+By default only certain fields from the pivot table will be returned (the two \*\*id\*\* fields, and the timestamps). +デフォルトでは、ピボットテーブルに確実に存在するフィールドがリターンされます。（２つの**id**フィールドとタイムスタンプ）+
s+If your pivot table contains additional columns, you can fetch them too by using the \*\*with()\*\* method :+もしあなたのピボットテーブルに他のカラムを追加しているのでしたら、それらを**with()**メソッドを用い取得することもできます。+


s+If you find yourself eager loading the same models often, you may want to use \*\*$includes\*\* in the model.+もし、同じモデルに対し頻繁にeagerローディングを使っているのに気づいたなら、**$includes**をモデル中で使いたくなるでしょう。+

s+\*\*$includes\*\* takes the same arguments that \*\*with\*\* takes. The following is now eagerly loaded.+**$includes**は**with**と同じ引数を取ります。これで、以下のコードでeagerロードされるようになります。+

s+\*\*Note:\*\* Using \*\*with\*\* will override a models \*\*$includes\*\*.+**注意：** **with**はモデルの**$includes**をオーバーライドします。+

s+Deleting Models+モデル削除+

s+Because Eloquent inherits all the features and methods of Fluent queries, deleting models is a snap:+EloquentはFluentクエリービルダーの全ての機能とメソッドを継承しているため、モデルもさっと削除できます。+

s+Note, however, than this won't delete any related models (e.g. all the author's Book models will still exist), unless you have set up \[foreign keys\](/docs/database/schema#foreign-keys) and cascading deletes.+しかしながら、注意してもらいたいのは、[外部キー](/docs/database/schema#foreign-keys)と連鎖削除(cascade delete)を指定していない限り、関連しているモデルは削除されないことです。（例えば、この著者の全てのBookモデルはまだ存在しています。）+

s+Getter & Setter Methods+ゲッターとセッターメソッド+

s+One-To-One+１対１+
s+One-To-Many+１対多+
s+Many-To-Many+多対多+

s+In some cases it may be useful to update the \*\*updated_at\*\* date column without actually modifying any data within the model\. +場合により、モデルのデータを実際には変更しないのだけれど、**updated_at**データカラムを更新できると便利です。+

s+Simply use the \*\*touch\*\* method, which will also automatically save the changes immediately:+こんな時は**touch**メソッドを使用してください。即時に変更し、自動的に更新します。+

s+You can also use the \*\*timestamp\*\* function to update the \*\*updated_at\*\* date column without saving the model immediately\. +また、**update_at**データカラムをアップデートしたいが、すぐにモデルを保存しない場合は**timestamp**関数を使用してください。+
s+Note that if you are actually modifying the model's data this is handled behind the scenes:+もし、実際にモデルのデータを変更するのでしたら、この作業は舞台裏で密かに行われることに注意してください。+

s/do something else here, but not modifying the \$comment model data/$commnetモデルのデータを変更しない、他のコードがここに入る/