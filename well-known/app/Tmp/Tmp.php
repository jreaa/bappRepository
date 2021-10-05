<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

Class Tmp{
    public static function updateTmp($id, $date, $hora,$status,$temperatura,$jornada){
        $h = new DateTime();
        $tmp = DB::table('control_temp')->where("id","=",$id);
        $tmp->update([
            'date' => $date,
            'hora' => $h,
            'jornada' => $jornada,
            'status' => $status,
            'temperatura' => $temperatura,
        ]);
    }
	public static function deleteTmp($id)
	{
		DB::table('control_temp')->where("id","=",$id)->delete();
    }
}