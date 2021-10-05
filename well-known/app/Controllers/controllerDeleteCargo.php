<?php 
session_start();
include('../../vendor/autoload.php');
include('../Cargos/Cargo.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $cargo = new Cargo;
        $cargo->deleteCargo($id);
        $_SESSION['u'] = "Usted ha agreado eliminado un cargo satisfactoriamente";
        header("Location: ../../../addCargos.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../addCargos.php");
}