<?php 


session_start();
include('../../vendor/autoload.php');
include('../Vehiculo/Vehiculo.php');



if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $v = new Vehiculo;
        $v->deleteVehiculo($id);
        $_SESSION['u'] = "Usted ha eliminado un vehiculo satisfactoriamente";
        header("Location: ../../../vehiculos.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../vehiculos.php");
}