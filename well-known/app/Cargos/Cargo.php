<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

class Cargo{
    public static function addCargo($ncargo, $examen, $documentaria){
        
        if($documentaria != null){
                if(sizeof($documentaria) == 2 ){
                    DB::table('cargo_postular')->insert([
            			'name' => $ncargo,
            			'examen_adicional' => $examen,
            			$documentaria[0] => 1,
            			$documentaria[1] => 1,
            		]);
                }elseif(sizeof($documentaria) == 1){
                    DB::table('cargo_postular')->insert([
            			'name' => $ncargo,
            			'examen_adicional' => $examen,
            		     $documentaria[0] => 1,
            		]);
                }
        }
        elseif($documentaria == null){
               DB::table('cargo_postular')->insert([
    			'name' => $ncargo,
    			'examen_adicional' => $examen,

    		]);
        }
        

    }
    public static function deleteCargo($id){
        DB::table("cargo_postular")->where("id", "=", $id)->delete();
    }
}