<?php

// バンドル（拡張機能）のform base modelを使用

class Form_Command extends FormBaseModel\Base {

    public static $rules = array(
	// 一般に使用させるページではないので、
	// バリディーション無し
	// 単純にバリディーション出来ないので、
	// Validatorで行うと複雑になりすぎる
	//
    //    'command' => '',
    );
}