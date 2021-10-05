<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

/**
 * 
 */
class Vinculacion
{
	
	public static function addVinculacion($id_vehiculo,$id_postulante)
	{
	    $fecha = date('Y-m-d');
		DB::table('vinculacion')->insert([
			'id_vehiculo' => $id_vehiculo,
			'id_postulante' => $id_postulante,
			'fecha' => $fecha
		]);
	}
	
	public static function editVinculacion($id_vehiculo,$id_postulante,$id)
	{
	    $date = date('Y-m-d');
		DB::table('vinculacion')->where('id','=',$id)->update([
			'id_vehiculo' => $id_vehiculo,
			'id_postulante' => $id_postulante,
			'fecha' => $date
		]);
	}
	
	public static function deleteVinculacion($id)
	{
		DB::table('vinculacion')->where('id','=',$id)->delete();
	}

}