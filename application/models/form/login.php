<?php

class Form_Login extends FormBase_Model {

    public static $rules = array(
        'username' => 'required|min:4|max:32',
        'password' => 'required|min:4|max:32',
    );
}