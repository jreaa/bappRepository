<?php 

include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

class ComentarioPresencial{
    public static function addComentarios($id, $comment){
        DB::table('comentarios_entrevista')->insert([
            'id_status_entrevista' => $id,
            'comentario' => $comment
        ]);

    }
}
