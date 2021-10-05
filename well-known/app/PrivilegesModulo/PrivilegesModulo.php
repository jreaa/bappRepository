<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;


class PrivilegesModulo {
    public static function addPrivileges($mod1,$mod2,$mod3,$mod4,$mod5,$mod6,$mod7){
        
        $json = json_decode(json_encode(DB::table('privileges')->select()->get()),True);
    
        foreach($json as $row){
            $id = $row['id'];
        }
                
        
        DB::table("privileges_modulos")->insert([
            "1" => $mod1,
            "2" => $mod2,
            "3" => $mod3,
            "4" => $mod4,
            "5" => $mod5,
            "6" => $mod6,
            "7" => $mod7,
           "id_user" => $id
           
        ]);
    
    }
        public static function updatePrivileges($mod1,$mod2,$mod3,$mod4,$mod5,$mod6,$mod7,$id){
    
         $p = json_decode(json_encode(DB::table("privileges_modulos")->where("id_user","=",$id)->get()),True);
         
         if(!empty($p)){
            DB::table("privileges_modulos")->where("id_user","=",$id)->update([
                "1" => $mod1,
                "2" => $mod2,
                "3" => $mod3,
                "4" => $mod4,
                "5" => $mod5,
                "6" => $mod6,
                "7" => $mod7,
               "id_user" => $id
               
            ]);
         }else{
            DB::table("privileges_modulos")->insert([
                "1" => $mod1,
                "2" => $mod2,
                "3" => $mod3,
                "4" => $mod4,
                "5" => $mod5,
                "6" => $mod6,
                "7" => $mod7,
               "id_user" => $id
               
            ]);
        
         }

    
    }
}