<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;


$users = json_decode(json_encode(DB::table('users')->get()), True);

$date = date('d-m-Y');

foreach($users as $user)
{
    DB::table('control_temp')->insert([
    'date' => $date,
    'jornada' => 'entrada',
    'status' => '',
    'id_postulante' => $user['id']
    ]);
    
    DB::table('control_temp')->insert([
    'date' => $date,
    'jornada' => 'salida',
    'status' => '',
    'id_postulante' => $user['id']
    ]); 

}


