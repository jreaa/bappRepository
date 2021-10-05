<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

include('../vendor/autoload.php');
include('../app/Database/Database.php');
session_start();

use Illuminate\Database\Capsule\Manager as DB;


$id = $_POST['id'];


if($_POST['value'] == '1'){
    $fecha = date("Y-m-d");
    $inductivo = DB::table('inductivo_resultado')->insert([
        'id_inductivo' => $id,
        'fecha_real' => $fecha
    ]); 
}elseif($_POST['value'] == '2'){
    date_default_timezone_set("America/Santiago");
    $hora = date('H:i:s', time());

    DB::table('inductivo_resultado')->where('id_inductivo', $id)->update([
        'hora_real' => $hora
    ]);
}

$json = ["id" => $_POST['id'], "value" => $_POST['value']];
echo json_encode($json);

