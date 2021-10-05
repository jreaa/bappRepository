<?php 
session_start();
include('../../vendor/autoload.php');
include('../Seguro/Seguro.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $seguro = new Seguro;
        $seguro->deleteSeguro($id);
        $_SESSION['s'] = "Usted ha eliminado un seguro satisfactoriamente";
        header("Location: ../../../seguros.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../seguros.php");
}