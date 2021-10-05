<?php 

include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

class StatusTelefonica{
    public static function addComentarios($id, $comment){
        DB::table('status_entrevista_telefonica')->insert([
            'id_entrevista' => $id
        ]);
        
        $s = DB::table('status_entrevista_telefonica')->get();
        $array = json_decode(json_encode($s), True);
        
        foreach($array as $row){
            $id_s = $row['id'];
        }

        
         DB::table('comentarios_entrevista_telefonica')->insert([
            'id_entrevista' => $id_s,
            'comentario' => $comment
        ]);
    }
}
