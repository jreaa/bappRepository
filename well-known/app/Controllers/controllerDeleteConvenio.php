<?php 
session_start();
include('../../vendor/autoload.php');
include('../Convenio/Convenio.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $convenio = new Convenio;
        $convenio->deleteConvenio($id);
        $_SESSION['c'] = "Usted ha eliminado una convenio satisfactoriamente";
        header("Location: ../../../conveniosAgregados.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../conveniosAgregados.php");
}