<?php 
session_start();
include('../../vendor/autoload.php');
include('../Tmp/Tmp.php');

if(isset($_POST['id'])){
    $id = $_POST['id'];

    try{
        echo $id;
        $tmp = new Tmp;
        $tmp->deleteTmp($id);
        $_SESSION['a'] = "Usted ha agreado eliminado una temperatura satisfactoriamente";
        header("Location: ../../../control_temperatura.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
  
    header("Location: ../../../control_temperatura.php");
}