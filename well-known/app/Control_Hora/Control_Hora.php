<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');


use Illuminate\Database\Capsule\Manager as DB;

Class Control_Hora{
	public static function AddControl($requerimiento,$date,$hours, $name,$rut,$id_postulante){

		DB::table('control_hora')->insert([
			'requerimiento' => $requerimiento,
			'date' => $date,
			'hours' => $hours,
			'name' => $name,
			'rut' => $rut,
			'id_postulante' => $id_postulante
		]);
		
	}
		public static function deleteControl($id){

		DB::table('control_hora')->where("id", "=", $id)->delete();
		
	}
}