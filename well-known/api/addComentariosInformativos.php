<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

include('../vendor/autoload.php');
include('../app/Database/Database.php');
session_start();

use Illuminate\Database\Capsule\Manager as DB;

$resonse = $_GET['response'];
$id = $_GET['id_informativo'];

DB::table('informativo_resultado')->where('id_informativo', $id)->update([
    'comentario' => $resonse
]);

DB::table('informativo')->where('id', $id)->update([
    'status' => 'realizado'
]);