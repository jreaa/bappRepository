<?php 
session_start();
include('../../vendor/autoload.php');
    include('../Sanitizacion/Sanitizacion.php');

if(isset($_POST['id'])){
    $id = $_POST['id'];

    try{
        echo $id;
        $limpieza = new Limpieza;
        $limpieza->deleteLimpieza($id);
        $_SESSION['a'] = "Usted ha eliminado una limpieza satisfactoriamente";
        header("Location: ../../../limpieza.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../limpieza.php");
}