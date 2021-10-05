<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

Class Limpieza{
    
    public static function updateLimpieza($id, $date, $hora,$status)
	{
		$limpieza = DB::table('limpieza')->where("id","=",$id);
		
		$time = new DateTime("now", new DateTimeZone('America/Santiago'));
		
		$fecha = date('Y-m-d');
		
		$limpieza->update([
		    'date' => $fecha,
		    'hora' => $time,
		    'status' => $status
		    
		]);
    }
    
	public static function deleteLimpieza($id)
	{
		DB::table('limpieza')->where("id","=",$id)->delete();
    }
}