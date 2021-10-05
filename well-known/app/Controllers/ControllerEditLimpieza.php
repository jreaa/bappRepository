<?php 
session_start();
include('../../vendor/autoload.php');
include('../Limpieza/Limpieza.php');

if(isset($_POST['id'])){
    $id = $_POST['id'];
    
    $date = $_POST['date'];
    $hora = $_POST['hora'];
    $status = $_POST['status'];


    try{
        echo $id;
        $limpieza = new Limpieza;
        $limpieza->updateLimpieza($id, $date, $hora,$status);
        $_SESSION['a'] = "Usted ha editado una limpieza satisfactoriamente";
        header("Location: ../../../limpieza.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../limpieza.php");
}