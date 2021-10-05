<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');


use Illuminate\Database\Capsule\Manager as DB;

Class VincularPersonal{
	public static function addVP($postulante, $trato,$hora,$archivo_name,$fecha1, $fecha2){
		DB::table('vincular_personal')->insert([
			'id_postulante' => $postulante,
			'trato' => $trato,
			'hora' => $hora,
			'file' => $archivo_name,
			'status' => 'Pendiente',
			'fecha_incio' => $fecha1,
			'fecha_cierre' => $fecha2

		]);
		
	}
	public static function deleteVP($id){
		DB::table('vincular_personal')->where("id","=", $id)->delete();
		
	}
}