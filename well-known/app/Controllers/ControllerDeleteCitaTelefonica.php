<?php 
session_start();
include('../../vendor/autoload.php');
include('../Cita/Cita.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $examen = new Cita;
        $examen->deleteCitaTelefonica($id);
        $_SESSION['t'] = "Usted ha eliminado una cita telefonica satisfactoriamente";
        header("Location: ../../../resultados.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../resultados.php");
}