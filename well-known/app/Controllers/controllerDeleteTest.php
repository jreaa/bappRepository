<?php 
session_start();
include('../../vendor/autoload.php');
include('../Test/Test.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $examen = new Test;
        $examen->deleteTest($id);
        $_SESSION['t'] = "Usted ha eliminado un test satisfactoriamente";
        header("Location: ../../../test.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../privileges.php");
}