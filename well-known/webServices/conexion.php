<?php

class Conexion {
    public function conx($hostname="localhost", $db="sopo77862_oca2", $username="sopo77862_oca_test", $password="NBUSJI1%hWQ-"){

        try{
            $conx = new PDO("mysql:host=$hostname;dbname=$db", "$username", "$password");
            return $conx;
        }catch(PDOException $err){
            return $err;
        }

    }
}
/*
$cnx = new Conexion;
$response = $cnx->conx()->prepare("SELECT * FROM users");

$response->execute();

$users = [];

foreach($response as $resp){
    $users[] = $resp;
}

echo json_encode($users);*/