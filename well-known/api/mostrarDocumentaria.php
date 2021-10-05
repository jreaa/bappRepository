<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

include('../vendor/autoload.php');
include('../app/Database/Database.php');
session_start();

use Illuminate\Database\Capsule\Manager as DB;


$id = $_GET['id'];

$usuario = DB::table('users')->where('id', $id)->get();

$documentos = DB::table('documentaria')->where('id_postulante', $usuario[0]->id_postulante)->get();

$json = ['data' => $documentos];
echo json_encode($json);