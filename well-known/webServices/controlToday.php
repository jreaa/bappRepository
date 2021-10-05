<?php 
include('conexion.php');

$id = $_GET['id'];


try{
    $cnx = new Conexion;

    $response = $cnx->conx()->prepare("SELECT * FROM control_temp WHERE id_postulante = '$id' AND date= '2021-02-25'");
    $res = $response->execute();
    
    $controles = []; 
    
    foreach($response as $resp){
        $controles[] = $resp;
    }
    
    $customers = array_slice($controles, 0, 10);
    
    echo json_encode($controles);


/*
    $user = [];

    foreach($response as $resp){
        //$password = $resp['password'];
    }
    
    */
    /*
    var_dump(password_verify('12345678',$password));

    if(empty($user)){
        echo "";
    }else{
        echo json_encode($user);
    }*/
    
}catch(PDOException $pdo){
    echo $pdo;
}

