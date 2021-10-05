<?php 
session_start();
include('../../vendor/autoload.php');
include('../Control_Hora/Control_Hora.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $control_hora = new Control_Hora;
	    $control_hora->deleteControl($id);
        $_SESSION['c'] = "Usted ha eliminado un control satisfactoriamente";
        header("Location: ../../../seguimiento_ch.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../seguimiento_ch.php");
}