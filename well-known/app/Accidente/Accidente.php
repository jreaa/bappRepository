<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

Class Accidente{
	public static function addAccidente($name_file,$f_evento,$f_resultado,$resultado){
		DB::table('accidente')->insert([
			'achivo' => $name_file,	
			'f_evento' => $f_evento,	
			'f_resultado' =>$f_resultado,	
			'resultado' => $resultado
		]);
	}
		public static function deleteAccidente($id){
		DB::table('accidente')->where("id","=",$id)->delete();
	}
}