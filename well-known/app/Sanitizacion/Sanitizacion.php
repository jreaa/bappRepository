<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

Class Sanitizacion{
    public static function updateSanitizacion($id, $date, $hora,$status)
	{
		$sanitizacion = DB::table('sanitizacion')->where("id","=",$id);
		
		$time = new DateTime("now", new DateTimeZone('America/Santiago'));
		
		$fecha = date('Y-m-d');
		
		$sanitizacion->update([
		    'date' => $fecha,
		    'hora' => $time,
		    'status' => $status
		    
		]);
    }
    
	public static function deleteSanitizacion($id)
	{
		DB::table('sanitizacion')->where("id","=",$id)->delete();
    }
}