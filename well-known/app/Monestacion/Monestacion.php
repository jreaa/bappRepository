<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

Class Monestacion{
	public static function addMonestacion($postulante,$formato,$mensaje){
		DB::table('monestacion')->insert([
			'id_postulante' => $postulante,
			'formato' => $formato,
			'mensaje' => $mensaje,
			'fecha' => date("Y-m-d"),
			'hora' => date("G"),
			'leido' => 'No leido'
		]);
	}
	public static function deleteMonestacion($id){
		DB::table('monestacion')->where("id","=",$id)->delete();
	}
}