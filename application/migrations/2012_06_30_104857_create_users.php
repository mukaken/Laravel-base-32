<?php

class Create_Users {

    /**
     * Make changes to the database.
     *
     * @return void
     */
    public function up() {

		// usersテーブルの作成

        Schema::create('users',
            function($table)
            {
                // 自動増分設定のid
                $table->increments('id');

                // varchar
                $table->string('username', 32);
                $table->string('email', 320);
                $table->string('password', 64);

                // created_atとupdatedをDATETIME型で作成
				// この2つのフィールドはLaravelが自動的に
				// 設定してくれる
                $table->timestamps();
            });
    }

    /**
     * Revert the changes to the database.
     *
     * @return void
     */
    public function down() {

		// usersテーブルの削除

        Schema::drop('users');
    }

}