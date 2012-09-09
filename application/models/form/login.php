<?php

// バンドル（拡張機能）のform base modelを使用

class Form_Login extends FormBaseModel\Base {

    public static $rules = array(
        'username' => 'required|min:4|max:32',
        'password' => 'required|min:4|max:32',
    );
}