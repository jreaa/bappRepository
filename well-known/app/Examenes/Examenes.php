<?php 
include('../../vendor/autoload.php');
include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;
Class Examenes{
	public static function formatDisc($id_postulante){
		DB::table('formatodisc')->insert([
			'id_postulante' => $id_postulante,
			'intentos' => true,
			'g1' => '',
			'g2' => '',
			'g3' => '',
			'g4' => '',
			'g5' => '',
			'g6' => '',
			'g7' => '',
			'g8' => '',
			'g9' => '',
			'g10' => '',
			'g11' => '',
			'g12' => '',
			'g13' => '',
			'g14' => '',
			'g15' => '',
			'g16' => '',
			'g17' => '',
			'g18' => '',
			'g19' => '',
			'g20' => '',
			'g21' => '',
			'g22' => '',
			'g23' => '',
			'g24' => '',
			'g25' => '',
			'g26' => '',
			'g27' => '',
			'g28' => ''
		]);
	}
	public static function updateFormatDisc($id_postulante,$g1,$g2,$g3,$g4,$g5,$g6,$g7,$g8,$g9,$g10,$g11,$g12,$g13,$g14,$g15,$g16,$g17,$g18,$g19,$g20,$g21,$g22,$g23,$g24,$g25,$g26,$g27,$g28){
		DB::table('formatodisc')->where('id_postulante', '=', $id_postulante)->update([
			'id_postulante' => $id_postulante,
			'intentos' => false,
			'g1' => $g1,
			'g2' => $g2,
			'g3' => $g3,
			'g4' => $g4,
			'g5' => $g5,
			'g6' => $g6,
			'g7' => $g7,
			'g8' => $g8,
			'g9' => $g9,
			'g10' => $g10,
			'g11' => $g11,
			'g12' => $g12,
			'g13' => $g13,
			'g14' => $g14,
			'g15' => $g15,
			'g16' => $g16,
			'g17' => $g17,
			'g18' => $g18,
			'g19' => $g19,
			'g20' => $g20,
			'g21' => $g21,
			'g22' => $g22,
			'g23' => $g23,
			'g24' => $g24,
			'g25' => $g25,
			'g26' => $g26,
			'g27' => $g27,
			'g28' => $g28
		]);
	}
}