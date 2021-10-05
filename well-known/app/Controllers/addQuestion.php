<?php 
include('../../vendor/autoload.php');
include('../Test/Test.php');
include('../Database/Database.php');


try{
	if (isset($_POST['btn'])) {
		$id = $_POST['id'];
		$question = $_POST['question'];
		$database = $_POST['database'];
		$link = $_POST['link'];
		
		$test = new Test;
		if (isset($_POST['0'])) {
			$correct = $_POST['select'];
			$a = $_POST['A'];
			$b = $_POST['B'];
			$c = $_POST['C'];
			$d = $_POST['D'];

			if ($correct == 'A') {
				$correct = $a;
			}else if ($correct == 'B') {
				$correct = $b;
			}else if ($correct == 'C'){
				$correct = $c;
			}else if ($correct == 'D') {
				$correct = $d;
			}

			$test->addQuestion($id, $question,$correct, $a, $b, $c, $d);
			if ($test) {
				echo 'is running';
				header('Location:../../test.php');
				
			}else{
				echo 'somenthing wrong';
			}

		}else if(isset($_POST['1'])){
			$correct = $_POST['select'];
			$verdadero = $_POST['verdadero'];
			$falso = $_POST['falso'];

			if ($correct == 'V') {
				$correct = $verdadero;
			}else if ($correct == 'F') {
				$correct = $falso;
			}

			$test->addQuestion($database,$id, $question,$correct, $verdadero, $falso);
			if ($test) {
				header("Location:../../$link.php");
				echo 'is running';
			}else{
				echo 'somenthing wrong';
			}
		}
	}
}catch(PDOExecption $pdo){
	echo $pdo;
}

