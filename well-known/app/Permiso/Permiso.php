<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

Class Permiso{
	public static function addPermiso($id_postulante,$rut,$departamento,$t_permiso,$status,$firma,$fecha,$comentarios){
		DB::table('permisos')->insert([
			'id_postulante' => $id_postulante,
			'rut' => $rut,
			'departamento' => $departamento,
			'tipo_permiso' => $t_permiso,
			'status' => $status,
			'firma' => $firma,
			'comentario' => $comentarios,
			'fecha' => $fecha
		]);
	}
		public static function deletePermiso($id){
		DB::table('permisos')->where("id","=",$id)->delete();
	}
}