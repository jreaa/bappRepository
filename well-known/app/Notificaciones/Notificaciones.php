<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

class Notificaciones 
{
    
    public static function Notificacion($des, $user)
    {
        $date = date("Y-m-d");
        DB::table('notificaciones')->insert([
            'description' => $des,
            'usuario'     => $user,
            'fecha'       => $date
        ]);
    }
    
}