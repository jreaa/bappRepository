<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

class Examen{
    public static function addExamen($titulo,$description,$fecha_inicio,$fecha_cierre,$namefile){

        DB::table("examenes")->insert([
            "title" => $titulo,
            "description"=> $description,
            "fecha_inicio"=> $fecha_inicio,
            "fecha_cierre"=> $fecha_cierre,
            "img" => $namefile
        ]);
    }
        public static function deleteExamen($id){
        DB::table("examenes")->where("id", "=", $id)->delete();
    }
}