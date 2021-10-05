<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;


class Documentaria{
	public function uploadDoc($name,$examen){
		$postulante = DB::table('postulante')->where('name', '=', $name)->get();
		$array = json_decode(json_encode($postulante), True);

		foreach ($array as $row) {
			$id_postulante = $row['id'];
		}
		DB::table('documentaria')->insert([
			'cedula_front' => 'default.png',
			'cedula_back' => 'default.png',
			'licencia'   => 'default.png',
			'antecedentes' => 'default.png',
			'comprobante_domicilio' => 'default.png',
			'AFP'=> 'default.png',
			'certificado_salud' => 'default.png',
			'finiquito'=> 'default.png',
			'CV'=> 'default.png',
			'hoja_vida' => 'default.png',
			'cedula_v' => '0000-00-00',
			'licencia_v' => '0000-00-00',
			'afp_v' => '0000-00-00',
			'antecedentes_v' => '0000-00-00',
			'examen_achs' => $examen,
			'id_postulante' => $id_postulante
		]);
	}
}