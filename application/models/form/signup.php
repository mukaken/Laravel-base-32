<?php

// バンドル（拡張機能）のform base modelを使用

class Form_Signup extends FormBaseModel\Base {

    public static $rules = array(
        'username' => 'required|min:4|max:32|unique:users',
        'password' => 'required|min:4|max:32',
        'password_confirm' => 'required|same:password',
        'email'    => 'required|max:320|email|unique:users',
    );
}