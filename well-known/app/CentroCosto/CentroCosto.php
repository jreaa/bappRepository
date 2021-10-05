<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;


class CentroCosto {
    public static function addCc($cc,$description){
        
        DB::table("centro_costo")->insert([
            "cc" => $cc,
            "description" => $description,

           
        ]);
    
    }
    public static function updateCc($cc,$description,$id){
        DB::table("centro_costo")->where("id", "=", $id)->update([
            "cc" => $cc,
            "description" => $description,
           
        ]);    
    }

    public static function deleteCc($id){
        DB::table("centro_costo")->where("id", "=", $id)->delete();
    }
    
    
    
    public static function addVinculacionCc($id_postulante,$id_cc){
        DB::table("cc_vinculacion")->insert([
            "id_postulante" => $id_postulante,
            "id_cc" => $id_cc,
        ]);
    }

}
