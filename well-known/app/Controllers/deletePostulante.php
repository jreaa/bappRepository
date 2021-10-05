<?php
include('../../vendor/autoload.php');
include('../Postulante/Postulante.php');

$id = $_GET['id'];
try{
    $postulante = new Postulante;
    $postulante->deletePostulante($id);
}catch(PDOException $e){
    echo $e;
}

header('Location: ../../index.php');