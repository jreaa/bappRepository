<?php 

include('vendor/autoload.php');
include('app/Database/Database.php');
//include('app/Postulante/Postulante.php');
//include('app/Documentaria/Documentaria.php');
use Illuminate\Database\Capsule\Manager as DB;

require 'PHPExcel/Classes/PHPExcel.php';
require 'PHPExcel/Classes/PHPExcel/Shared/Date.php';


$file = $_FILES['excel'];
$file = $file['tmp_name'];

$excel = PHPExcel_IOFactory::load($file);
$excel->setActiveSheetIndex(0);

$rows = $excel->setActiveSheetIndex(0)->getHighestRow();

$date =date('Y-m-d');
$writer = "Admin";

for($i=1;$i<=$rows;$i++){
    $nombre_postulante = $excel->getActiveSheet()->getCell('E'.$i)->getCalculatedValue();
    $rut = $excel->getActiveSheet()->getCell('D'.$i)->getCalculatedValue();
    //$date_born = $excel->getActiveSheet()->getCell('G'.$i)->getCalculatedValue();
    $genere = $excel->getActiveSheet()->getCell('L'.$i)->getCalculatedValue();
    $email = $excel->getActiveSheet()->getCell('N'.$i)->getCalculatedValue();
    $address = $excel->getActiveSheet()->getCell('I'.$i)->getCalculatedValue();
    $phone = $excel->getActiveSheet()->getCell('K'.$i)->getCalculatedValue();
    $country = $excel->getActiveSheet()->getCell('F'.$i)->getCalculatedValue();
    $city = $excel->getActiveSheet()->getCell('J'.$i)->getCalculatedValue();
    $cargo_postular = $excel->getActiveSheet()->getCell('O'.$i)->getCalculatedValue();
    $nivel_educacion = $excel->getActiveSheet()->getCell('H'.$i)->getCalculatedValue();
    
    $fecha_excel = $excel->getActiveSheet()->getCell('G'.$i)->getValue();
    // utilizo la función y obtengo el timestamp
    $timestamp = PHPExcel_Shared_Date::ExcelToPHP($fecha_excel);
    $fecha_php = date("Y-m-d",$timestamp);
    
    $cargo = json_decode(json_encode(DB::table('cargo_postular')->where('name','=',$cargo_postular)->get()),True);
   
    
    foreach ($cargo as $row) {
    	$examen = $row['examen_adicional'];
    }
    if ($examen === 1) {
    	$e = 'No realizado';
    }else if ($examen === 0) {
    	$e = '';
    }
    try{
       		DB::table('postulante')->insert([
			'name'=> $nombre_postulante,
			'rut' => $rut,
			'img' => 'postul.jpg',
			'lastname' => $nombre_postulante,
			'email'=> $email,
			'date_born'=> $fecha_php,
			'genere' => $genere,
			'address' => $address,
			'phone' => $phone,
			'country' => $country,
			'city' => $city,
			'date' => $date,
			'writer' => $writer,
			'cargo_postular' => $cargo_postular,
			'examen_adicional' => $examen,
			'disponible' => 'En Proceso',
			'cedula' => '',
			'numero_licencia' => '',
			'fecha_postulacion' => date('Y-m-d'),
			'nivel_educacion'=> $nivel_educacion
			
		]);
		
		$postulante = DB::table('postulante')->where('name', '=', $nombre_postulante)->get();
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
			'examen_achs' => 'No realizado',
			'examen_achs' => $examen,
			'id_postulante' => $id_postulante
		]);
    }catch(PDOException $e){
    	echo $e;
    }
}

header('Location: index.php');


