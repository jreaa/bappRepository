<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

Class Seguro{
	public static function addSeguro($d,$de,$p,$n){
		DB::table('seguro')->insert([
			'date' => $d,
			'date_end' => $de,
			'id_postulante' => $p,
			'name' =>$n
		]);
	}
		public static function deleteSeguro($id){
		DB::table('seguro')->where("id","=",$id)->delete();
	}
}