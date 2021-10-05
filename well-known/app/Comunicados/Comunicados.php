<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');


use Illuminate\Database\Capsule\Manager as DB;

Class Comunicados{
	public static function addComunicado($id, $mensaje, $asunto){
		DB::table('comunicados')->insert([
			'id_postulante' => $id,
			'mensaje' => $mensaje,
			'asunto' => $asunto,
			'fecha' => date("Y-m-d"),
			'hora' => date("G"),
			'leido' => 'No leido',
			'firmado' => 'No firmado'
		]);
		
	}
	public static function deleteComunicado($id){
		DB::table('comunicados')->where("id","=",$id)->delete();
		
	}
}