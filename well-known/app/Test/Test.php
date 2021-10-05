<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');
include('../Upload/Upload.php');

use Illuminate\Database\Capsule\Manager as DB;

Class Test{
	public static function addTest($title, $description, $date, $date_end){
		DB::table('test')->insert([
			'title' => $title,
			'description' => $description,
			'date' => $date,
			'date_end' => $date_end,
			'title_file' => ''
		]);

		
	}
	
	public static function deleteTest($id){
		DB::table('test')->where("id", "=", $id)->delete();

	}
	public static function addQuestion($database,$id_test,$question, $correct_answer,$answer1="",$answer2="", $answer3="", $answer4="", $answer5="", $answer6=""){

		DB::table($database)->insert([
			'id_test'=>$id_test,
			'question'=>$question, 
			'correct_answer' => $correct_answer,
			'answer1'=>$answer1,
			'answer2'=>$answer2, 
			'answer3'=>$answer3, 
			'answer4'=>$answer4, 
			'answer5'=>$answer5, 
			'answer6'=>$answer6 

		]);
	}
	public static function addTestAchs($title, $description,$date,$date_end,$tmp_name,$name_file,$postulante,$precio){
		DB::table('test_achs')->insert([
			'title' => $title.' by ACHS',
			'description' => $description,
			'date' => $date,
			'date_end' => $date_end,
			'title_file' => $name_file,
			'id_postulante' => $postulante,
			'precio' => $precio,
			'status' => 'pendiente'
		]);
		$upload = new Upload;
		$upload->addFileAchs($name_file,$tmp_name,$date,$date_end);

	}
}