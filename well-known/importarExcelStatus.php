<?php 

include('vendor/autoload.php');
include('app/Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

require 'PHPExcel/Classes/PHPExcel.php';
require 'PHPExcel/Classes/PHPExcel/Shared/Date.php';


$file = $_FILES['excel2'];
$file = $file['tmp_name'];

$excel = PHPExcel_IOFactory::load($file);
$excel->setActiveSheetIndex(0);

$rows = $excel->setActiveSheetIndex(0)->getHighestRow();

$date =date('Y-m-d');
$writer = "Admin";

for($i=1;$i<=$rows;$i++){
    $nombre_postulante = $excel->getActiveSheet()->getCell('E'.$i)->getCalculatedValue();
    $rut = $excel->getActiveSheet()->getCell('D'.$i)->getCalculatedValue();
    $email = $excel->getActiveSheet()->getCell('N'.$i)->getCalculatedValue();
    
    $postulante = json_decode(json_encode(DB::table('postulante')->where('rut','=',$rut)->get()),True);
   
    
    foreach ($postulante as $p) {
    	$id_postulante = $p['id'];
    }
    
    $legajo = substr($rut, 0, -2);

    DB::table('postulante')->where('rut','=',$rut)->update([
        'disponible' => 'Trabajando'
    ]);
    
    DB::table('users')->insert([
        'name' => $nombre_postulante,
        'email' => $email,
        'rut'   => $rut,
        'id_postulante' => $id_postulante,
        'password'  => 	password_hash($legajo, PASSWORD_DEFAULT, ['cost => 12'])
    ]);
    
    //echo $rut." ".$email." ".$nombre_postulante." ".$legajo."<br><br>";

    
}

header('Location: index.php');


