<?php 
session_start();
include('../../vendor/autoload.php');
include('../Tmp/Tmp.php');

if(isset($_POST['id'])){
    $id = $_POST['id'];
    
    $date = $_POST['date'];
    $temperatura = $_POST['temperatura'];
    $hora = $_POST['hora'];
    $status = $_POST['status'];
    $jornada = $_POST['jornada'];

    try{
        echo $id;
        $tmp = new Tmp;
        $tmp->updateTmp($id, $date, $hora,$status,$temperatura,$jornada);
        $_SESSION['a'] = "Usted ha editado una temperatura satisfactoriamente";
        header("Location: ../../../control_temperatura.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../control_temperatura.php");
}