<?php 
session_start();
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;



if(isset($_GET['id'])){
    $id = $_GET['id'];
    
    try{
        DB::table('notificaciones')->where("id","=",$id)->delete();
        $_SESSION['n'] = "Usted ha eliminado un mensaje satisfactoriamente";
        header("Location: ../../../mensajes.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../mensajes.php");
}