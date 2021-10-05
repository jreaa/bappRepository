<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

Class Convenio{
	public static function addConvenio($name, $nfantasia,$rubro,$rut,$activity,$nconvenio,$t_convenio,$about,$archivo){
		DB::table('convenio')->insert([
			'name' => $name,	
			'nfantasia' => $nfantasia,	
			'rubro' =>$rubro,	
			'rut' => $rut,
			'activity' => $activity,
			'nconvenio' => $nconvenio,
			't_convenio' => $t_convenio,
			'about' => $about,
			'archivo' => $archivo
		]);
	}
	public static function addCaja($name, $nfantasia,$rubro,$rut,$activity,$nconvenio,$t_convenio,$about,$archivo){
		DB::table('caja_compesacion')->insert([
			'name' => $name,	
			'nfantasia' => $nfantasia,	
			'rubro' =>$rubro,	
			'rut' => $rut,
			'activity' => $activity,
			'nconvenio' => $nconvenio,
			't_convenio' => $t_convenio,
			'about' => $about,
			'archivo' => $archivo
		]);
	}
		public static function deleteConvenio($id){
		DB::table('convenio')->where("id", "=", $id)->delete();
	}
	public static function deleteCaja($id){
		DB::table('caja_compesacion')->where("id", "=", $id)->delete();
	}
}