<?php 
session_start();
include('../../vendor/autoload.php');
    include('../Sanitizacion/Sanitizacion.php');

if(isset($_POST['id'])){
    $id = $_POST['id'];

    try{
        echo $id;
        $sanitizacion = new Sanitizacion;
        $sanitizacion->deleteSanitizacion($id);
        $_SESSION['a'] = "Usted ha eliminado una sanitizacion satisfactoriamente";
        header("Location: ../../../sanitizacion.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../sanitizacion.php");
}