<?php 
session_start();
include('../../vendor/autoload.php');
include('../VincularPersonal/VincularPersonal.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $vp = new VincularPersonal;
        $vp->deleteVP($id);
        $_SESSION['p'] = "Usted ha eliminado un usuario activo satisfactoriamente";
        header("Location: ../../../verificar_persona.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../verificar_persona.php");
}