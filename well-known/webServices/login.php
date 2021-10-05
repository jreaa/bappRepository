<?php 
include('conexion.php');

$rut = $_POST['rut'];
$pass = $_POST['pass'];

try{
    $cnx = new Conexion;

    $response = $cnx->conx()->prepare("SELECT * FROM users WHERE rut = '$rut'");
    $res = $response->execute();
    
    $user = [];
    
    if($res){
        foreach($response as $resp){
            $password = $resp['password'];
            $user[] = $resp;
         }
         if(password_verify($pass,$password)){
            
             echo json_encode($user);
         }else{
             echo "";
         }
    }else{
        echo "";
    }


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

