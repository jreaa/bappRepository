<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

/**
 * 
 */
class User
{
	
	public static function addUser($name,$email,$password)
	{
		$pass = password_hash($password, PASSWORD_DEFAULT, ['cost => 12']);
		DB::table('user')->insert([
			'name' => $name,
			'email' => $email,
			'password' => $pass
		]);
	}
}