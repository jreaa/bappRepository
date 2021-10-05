<?php 


session_start();
include('../../vendor/autoload.php');
include('../Vinculacion/Vinculacion.php');



if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $v = new Vinculacion;
        $v->deleteVinculacion($id);
        $_SESSION['v'] = "Usted ha eliminado una vinculacion satisfactoriamente";
        header("Location: ../../../vinculacion.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../vinculacion.php");
}