<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

Class Cita{
	public static function addCitaPresencial($date,$time,$email,$place,$id_postulante,$status="No calificado"){
		DB::table('tblcita_presencial')->insert([
			'date' => $date,
			'time'=> $time,
			'email' => $email,
			'place'=> $place,
			'id_postulante'=> $id_postulante,
			'status' => $status,
			'comentario' => '',
			'start_date' => '0000-00-00'
		]);
	}
	public static function addCitaTelefonica($date,$time,$email,$link,$id_postulante, $status="No calificado"){
		DB::table('tblcita_telefonica')->insert([
			'fecha' => $date,
			'time' => $time,
			'email'=> $email,
			'link' => $link,
			'id_postulante' => $id_postulante,
			'status' => $status,
			'comentario' => '',
			'start_date' => '0000-00-00'
		]);
	}
	public static function deleteCitaTelefonica($id){
        DB::table("tblcita_telefonica")->where("id", "=", $id)->delete();
    }
    public static function deleteCitaPresencial($id){
        DB::table("tblcita_presencial")->where("id", "=", $id)->delete();
    }
}