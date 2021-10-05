<?php 
session_start();
include('../../vendor/autoload.php');
include('../Sanitizacion/Sanitizacion.php');

if(isset($_POST['id'])){
    $id = $_POST['id'];
    
    $date = $_POST['date'];
    $hora = $_POST['hora'];
    $status = $_POST['status'];


    try{
        echo $id;
        $sanitizacion = new Sanitizacion;
        $sanitizacion->updateSanitizacion($id, $date, $hora,$status);
        $_SESSION['a'] = "Usted ha editado una sanitizacion satisfactoriamente";
        header("Location: ../../../sanitizacion.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../sanitizacion.php");
}