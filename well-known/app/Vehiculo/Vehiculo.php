<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

/**
 * 
 */
class Vehiculo
{
	
	public static function addVehiculo($nvehiculo,$nplaca, $modelo,$marca,$color,$anio)
	{
		DB::table('vehiculo')->insert([
			'nvehiculo' => $nvehiculo,
			'nplaca' => $nplaca,
			'marca' => $marca,
			'modelo' => $modelo,
			'color'  => $color,
			'año'   => $anio
		]);
	}
	
	public static function editVehiculo($nvehiculo,$nplaca,$id, $anio, $marca,$modelo,$color)
	{
		DB::table('vehiculo')->where('id','=',$id)->update([
		    'nvehiculo' => $nvehiculo,
			'nplaca' => $nplaca,
			'marca' => $marca,
			'modelo' => $modelo,
			'color'  => $color,
			'año'   => $anio
		]);
	}
	
	public static function deleteVehiculo($id)
	{
		DB::table('vehiculo')->where('id','=',$id)->delete();
	}

}