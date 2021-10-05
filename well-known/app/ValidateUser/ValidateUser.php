<?php

require_once('../../vendor/autoload.php');
require_once('../Database/Database.php');


use Illuminate\Database\Capsule\Manager as DB;


Class ValidateUser{

	public static function UserValidate($name, $password){
        $user =  json_decode(json_encode(DB::table('user')->where("name", "=", $name)->get()),True);
        foreach($user as $row){
			$pass = $row['password'];
		}
	
		$chekpassword = password_verify($password,$pass);
		
        if($chekpassword){
            echo '1';
        }else{
            echo '0';
        }
	}
}