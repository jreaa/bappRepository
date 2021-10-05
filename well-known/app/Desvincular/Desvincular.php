<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

class Desvincular{
	public static function addDesvinculacion($postulante,$fecha,$motivo){
		DB::table('desvincular')->insert([
			'id_postulante' => $postulante,
			'fecha_culminacion' => $fecha,
			'motivo' => $motivo,
			'notificar_trabajador' => 'Realizado',
			'finiquito' => 'No Realizado',
			'firma_notario' => 'No Realizado',
			'documento' => ''
		]);

	}
	public static function finiquitoDesvinculacion($documento,$id){
		DB::table('desvincular')->where('id','=',$id)->update([
			'finiquito' => 'Realizado',
			'documento' => $documento
		]);

	}

	public static function finiquitoUpdateDesvinculacion($documento,$id,$id_postulante){
		DB::table('desvincular')->where('id','=',$id)->update([
			'firma_notario' => 'Realizado',
			'documento' => $documento
		]);

		DB::table('postulante')->where('id', '=',$id_postulante)->update([
			'disponible' => 'Inactivo'
		]);
		$postulante = json_decode(json_encode(DB::table('postulante')->where('id', '=',$id_postulante)->get()),True);

		foreach ($postulante as $row) {
			$name = $row['name'];
		}
		if(isset(DB::table('user')->where('name', '=',$name)->get())){
			DB::table('user')->where('name', '=',$name)->delete();
		}
	}
}