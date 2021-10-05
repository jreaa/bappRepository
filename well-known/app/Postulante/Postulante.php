<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

Class Postulante{
	public static function addPostulante($rut,$name,$lastname,$email,$date_born,$genere,$address,$phone,$country,$city,$date,$writer,$cargo_postular,$examen,$disponible='En Proceso',$nivel_educacion="Media Completa"){
		DB::table('postulante')->insert([
			'name'=> $name,
			'rut' => $rut,
			'img' => 'postul.jpg',
			'lastname' => $lastname,
			'email'=> $email,
			'date_born'=> $date_born,
			'genere' => $genere,
			'address' => $address,
			'phone' => $phone,
			'country' => $country,
			'city' => $city,
			'date' => $date,
			'writer' => $writer,
			'cargo_postular' => $cargo_postular,
			'examen_adicional' => $examen,
			'disponible' => $disponible,
			'cedula' => '',
			'numero_licencia' => '',
			'fecha_postulacion' => date('Y-m-d'),
			'nivel_educacion' => $nivel_educacion
			
		]);
	}


	public static function seePostulantes(){
		$postulante = DB::table('postulante')->select('id','rut','name','lastname','date_born','genere','email','address','phone','country','city','date','writer','img','disponible','cargo_postular')->get();

		return $postulante;
	}

	public static function deletePostulante($id){
	    DB::table('mantencion_siniestro')->where('id_postulante', '=', $id)->delete();
	    DB::table('documentaria')->where('id_postulante', '=', $id)->delete();
		DB::table('postulante')->where('id', '=', $id)->delete();
	}
	public static function updatePostulante($id,$name,$lastname,$rut,$genere,$address,$cpostular,$date,$phone,$email,$file,$nivel_educacion="Media Completa"){
		DB::table('postulante')->where('id', '=', $id)->update([
		'name' =>	$name,
		'lastname' =>	$lastname,
		'rut' =>	$rut,
		'genere' => $genere,
		'address' =>	$address,
		'cargo_postular' => $cpostular,
		'date_born' =>	$date,
		'phone' =>	$phone,
		'email' => $email,
		'img' => $file,
		'nivel_educacion' => $nivel_educacion
		]);
	}
	public static function addTestPostul($id_postulante,$id_test){
		
	}
}