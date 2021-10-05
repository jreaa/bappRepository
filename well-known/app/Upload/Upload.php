<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

Class Upload{
    public static function addImg($name,$tmp_name,$database,$id){
        
        if (!file_exists('../../archivos')) {
			mkdir('../../archivos',0777, true);
			if (file_exists('../../archivos')) {
				if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
					echo 'El archivo se ha guardado correctamente';
				}else{
					echo 'El archivo no se ha guardado correctamente';
				}
			}
		}else{
			if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
				//header('Location: ../../mutualidad.php');
				echo 'El archivo se ha guardado correctamente';
			}else{
				echo 'El archivo no se ha guardado correctamente';
			}
		}
		
		if($id == null){
		    $t = json_decode(json_encode(DB::table($database)->where("id", "=", $id)->get()),True);
		    foreach($t as $r){
		        $id = $r['id'];
		    }
		}
	    DB::table($database)->where("id", "=", $id)->update([
			'img' => $name,
		]);
		
    }
    
    
	public static function addFile($name,$tmp_name, $periodo, $vigencia){
		if (!file_exists('../../archivos')) {
			mkdir('../../archivos',0777, true);
			if (file_exists('../../archivos')) {
				if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
					echo 'El archivo se ha guardado correctamente';
					header('Location: ../../mutualidad.php');
				}else{
					echo 'El archivo no se ha guardado correctamente';
				}
			}
		}else{
			if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
				header('Location: ../../mutualidad.php');
			}else{
				echo 'El archivo no se ha guardado correctamente';
			}
		}

		DB::table('files_achs')->insert([
			'file' => $name,
			'periodo' => $periodo,
			'vigencia' => $vigencia
		]);
	}
	public static function addFileAchs($name,$tmp_name, $periodo, $vigencia){
		if (!file_exists('../../archivos')) {
			mkdir('../../archivos',0777, true);
			if (file_exists('../../archivos')) {
				if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
					echo 'El archivo se ha guardado correctamente';
					
				}else{
					echo 'El archivo no se ha guardado correctamente';
				}
			}
		}else{
			if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
				echo 'El archivo se ha guardado correctamente';
			}else{
				echo 'El archivo no se ha guardado correctamente';
			}
		}

		DB::table('files')->insert([
			'file' => $name,
			'periodo' => $periodo,
			'vigencia' => $vigencia
		]);
	}

	public static function addDocs($name,$tmp_name,$doc,$id){
		if (!file_exists('../../archivos')) {
			mkdir('../../archivos',0777, true);
			if (file_exists('../../archivos')) {
				if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
					echo 'El archivo se ha guardado correctamente';
					header('Location: ../../documentaria.php?id='.$id);
				}else{
					echo 'El archivo no se ha guardado correctamente';
				}
			}
		}else{
			if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
				header('Location: ../../documentaria.php?id='.$id);
			}else{
				echo 'El archivo no se ha guardado correctamente';
			}
		}
		DB::table('documentaria')->where('id_postulante','=',$id)->update([
			$doc => $name
		]);
	}

	public static function updateFilePostul($name,$tmp_name){
		if (!file_exists('../../archivos')) {
			mkdir('../../archivos',0777, true);
			if (file_exists('../../archivos')) {
				if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
					echo 'El archivo se ha guardado correctamente';
				}else{
					echo 'El archivo no se ha guardado correctamente';
				}
			}
		}else{
			if (move_uploaded_file($tmp_name, '../../archivos/'.$name)) {
				echo 'El archivo se ha guardado correctamente';
			}else{
				echo 'El archivo no se ha guardado correctamente';
			}
		}
	}
}