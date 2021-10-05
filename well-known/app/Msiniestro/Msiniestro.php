<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

/**
 * 
 */
class Msiniestro
{
	
	public static function addMsiniestro($date,$patente,$mVehiculo,$nreserva,$taller,$today,$hora,$direccion,$servicio,$observaciones,$fentrega,$resultado,$id_postulante)
	{
		try{
			DB::table('mantencion_siniestro')->insert([
				'fecha_solicitud' => $date,
				'patente'=> $patente ,
				'modelo_v' => $mVehiculo,
				'n_reserva' => 	$nreserva,	
				'taller'	=> $taller,
				'fecha'			=> $today,
				'hora'		    => $hora,
				'direccion' 	=> $direccion,	
				't_servicio'	=> $servicio,	
				'observaciones'	=> $observaciones,
				'fecha_entrega'	=> $fentrega,
				'resultado'		=> $resultado,
				'id_postulante' => $id_postulante
			]);

			$m = json_decode(json_encode(DB::table('mantencion_siniestro')->get()),True);
			foreach ($m as $row) {
				$id_mantencion = $row['id'];
			}
			DB::table('seguimiento_mantencion')->insert([
				'e_taller' => false,
				'e_vehiculo' => false,
				'i_taller' => false,
				'r_conductor' => false,	
				'id_mantencion' => $id_mantencion
			]);
		}catch(PDOException $e){
			echo $e;
		}
	}
		public static function deleteMsiniestro($id_s,$id_m)
	{
		DB::table('mantencion_siniestro')->where("id","=",$id_m)->delete();
		DB::table('seguimiento_mantencion')->where("id","=",$id_s)->delete();

	}
	
}