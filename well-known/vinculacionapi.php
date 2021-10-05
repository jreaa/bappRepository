<?php 
include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$id = $_GET['id'];

$p = json_decode (json_encode(DB::table('users')->where("id", "=", $id)->select()->get()),True);


$vinculacion =json_decode (json_encode(DB::table('vinculacion')->where("id_postulante", "=", $p[0]['id_postulante'])->select()->get()),True);

$vehiculo = $vinculacion[0]['id_vehiculo'];

$v =  json_encode(DB::table('vehiculo')->where("id", "=", $vehiculo)->select()->get());

echo trim($v, "[]");

?>
