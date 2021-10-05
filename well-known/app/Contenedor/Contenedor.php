<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');


use Illuminate\Database\Capsule\Manager as DB;

Class Contrato{
	public static function addContrato($name,$t_contrato,$fecha, $file){
		DB::table('contratos')->insert([
			'name' => $name,
			't_contrato' => $t_contrato,
			'fecha' => $fecha,
			'file' => $file
		]);
		
	}
		public static function deleteContrato($id){
		DB::table('contratos')->where("id", "=", $id)->delete();
		
	}
}