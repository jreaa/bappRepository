<?php 
session_start();
include('../../vendor/autoload.php');
include('../Contenedor/Contenedor.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $contenedor = new Contrato;
	    $contenedor->deleteContrato($id);
        $_SESSION['c'] = "Usted ha eliminado un control satisfactoriamente";
        header("Location: ../../../contratos.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../contratos.php");
}