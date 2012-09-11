<?php

// バンドル（拡張機能）のform base modelを使用

class Form_Command extends FormBaseModel\Base {

    public static $rules = array(
        'command' => 'required',
    );
}