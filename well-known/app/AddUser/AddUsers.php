<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

class AddUser{
    public static function addNewUser($name, $lastname, $position, $privileges,$usuario,$password){
        $pass = password_hash($password, PASSWORD_DEFAULT, ['cost => 12']);
        DB::table("privileges")->insert([
            "name" => $name,
            "lastname"=> $lastname,
            "position"=> $position,
            "privileges"=> $privileges,
            "usuario" => $usuario,
            "password" => $pass,
            "img" => "add3.png"
        ]);
    }
    public static function deleteUser($id){
        DB::table("privileges")->where("id", "=", $id)->delete();
    }
    public static function updateUser($id, $name,$lastname,$usuario,$position,$privileges){

        DB::table("privileges")->where("id","=",$id)->update([
            "name" => $name,
            "lastname"=> $lastname,
            "position"=> $position,
            "privileges"=> $privileges,
            "usuario" => $usuario,
        ]);
    }
   public static function updatePassword($id, $password){
        $pass = password_hash($password, PASSWORD_DEFAULT, ['cost => 12']);
        DB::table("privileges")->where("id","=",$id)->update([
            "password" => $pass
        ]);
    } 
}