<?php 
session_start();
include('../../vendor/autoload.php');
include('../Accidente/Accidente.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $accidente = new Accidente;
        $accidente->deleteAccidente($id);
        $_SESSION['a'] = "Usted ha agreado eliminado un seguimiento satisfactoriamente";
        header("Location: ../../../seguimiento_accidente.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../seguimiento_accidente.php");
}