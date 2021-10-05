<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

include('../vendor/autoload.php');
include('../app/Database/Database.php');
session_start();

use Illuminate\Database\Capsule\Manager as DB;


if(isset($_GET['id_informativo'])){
    $json = ['data' => '', 'inductivo' => ''];

    $inductivo = DB::table('informativo')->where("id", $_GET['id_informativo'])->get();

    $json['data'] = 3;
    $json['informativo'] = $inductivo;
    echo json_encode($json);
}else{

$id_postulante = $_GET['id'];
$user = DB::table('users')->where("id", $id_postulante)->get();

$inductivo = DB::table('informativo')->where("id_usuario_informativo", $user[0]->id_postulante)->get();

//var_dump($inductivo);

$json = ['data' => '', 'values' => ''];

if(empty($inductivo[0])){
    $json['data'] = 1;
    echo json_encode($json);
}else{
    $nInductivos =  sizeof($inductivo);
    $resultado = DB::table('informativo_resultado')->where("id_informativo", $inductivo[0]->id)->get();
    if(empty($resultado[0])){
        $json['data'] = 2;
        $json['values'] = ["inductivo" => $inductivo, 'nInductivo' => $nInductivos];
        echo json_encode($json);
    }else{
       
        $json['data'] = 3;
        $json['values'] = ["inductivo" => $inductivo, 'nInductivo' => $nInductivos, 'resultado' => $resultado];
        echo json_encode($json);
    }
    
}

}