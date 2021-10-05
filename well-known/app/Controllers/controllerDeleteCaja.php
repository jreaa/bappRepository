<?php 
session_start();
include('../../vendor/autoload.php');
include('../Convenio/Convenio.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $convenio = new Convenio;
        $convenio->deleteCaja($id);
        $_SESSION['c'] = "Usted ha eliminado una caja de compensacion satisfactoriamente";
        header("Location: ../../../ccAgregados.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../ccAgregados.php");
}