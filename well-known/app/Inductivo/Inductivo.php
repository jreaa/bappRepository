<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

/**
 * 
 */
class Inductivo
{
	
	public static function create($id_postulante, $fecha_inductivo, $hora_inductivo,$comentario,$archivo_name)
	{
	    
		DB::table('inductivo')->insert([
			'fecha' => $fecha_inductivo,
			'hora' => $hora_inductivo,
			'id_usuario_inductivo' => $id_postulante,
			'comentario' => $comentario,
			'archivo'  => $archivo_name
		]);
	}
	
	public static function edit($id_postulante, $fecha_inductivo, $hora_inductivo,$id)
	{
		DB::table('inductivo')->where('id','=',$id)->update([
			'id_usuario_inductivo' => $id_postulante,
			'hora' => $hora_inductivo,
			'fecha' => $fecha_inductivo
		]);
	}
	
	public static function delete($id)
	{
		DB::table('inductivo')->where('id','=',$id)->delete();
	}

}