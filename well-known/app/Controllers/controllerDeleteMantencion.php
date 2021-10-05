<?php 
session_start();
include('../../vendor/autoload.php');
include('../Msiniestro/Msiniestro.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;



if(isset($_GET['id'])){
    $id = $_GET['id'];
    $m = json_decode(json_encode(DB::table('seguimiento_mantencion')->where("id","=",$id)->get()),True);
    foreach($m as $r){
        $id_mantencion = $r['id_postulante'];
    }
    try{
        $msiniestro = new Msiniestro;
        $msiniestro->deleteMsiniestro($id,$id_mantencion);
        $_SESSION['m'] = "Usted ha eliminado una mantencion satisfactoriamente";
        header("Location: ../../../seguimiento_msiniestro.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../seguimiento_msiniestro.php");
}