<?php 

include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

class ComentarioTelefonica{
    public static function addComentarios($id, $comment){
        DB::table('comentarios_entrevista_telefonica')->insert([
            'id_entrevista' => $id,
            'comentario' => $comment
        ]);

    }
}
