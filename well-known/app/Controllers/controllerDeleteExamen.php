<?php 
session_start();
include('../../vendor/autoload.php');
include('../Examen/Examen.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $examen = new Examen;
        $examen->deleteExamen($id);
        $_SESSION['e'] = "Usted ha eliminado un examen satisfactoriamente";
        header("Location: ../../../addExamen.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../privileges.php");
}