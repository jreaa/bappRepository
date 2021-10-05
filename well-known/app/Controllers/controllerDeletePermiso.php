<?php 
session_start();
include('../../vendor/autoload.php');
include('../Permiso/Permiso.php');

if(isset($_GET['id'])){
    $id = $_GET['id'];

    try{
        $permiso = new Permiso;
        $permiso->deletePermiso($id);
        $_SESSION['s'] = "Usted ha eliminado un permiso satisfactoriamente";
        header("Location: ../../../permisosAgregados.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../permisosAgregados.php");
}