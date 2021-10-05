<?php 
include('../../vendor/autoload.php');
include('../Test/Test.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;
session_start();



if (isset($_POST['createTest'])) {
    
    
	$title = $_POST['title'];
	$date =	$_POST['date'];
	$date_end =	$_POST['date_end'];
    $description =	$_POST['description'];
    
    $test = new Test;
    $test->addTest($title, $description, $date, $date_end);
    
    $_SESSION['t'] = "Usted ha agreado un nuevo test satisfactoriamente";
    header('Location: ../../test.php');
}
else if (isset($_POST['btn'])) {
	$postulante = $_POST['postulante'];
	$date =	$_POST['date'];
	$date_end =	$_POST['date_end'];

}else if (isset($_POST['btn_achs'])) {
	$postulante = $_POST['postulante'];

	$date =	$_POST['date'];
	$precio = $_POST['precio'];
	$date_end =	$_POST['date_end'];
	$title =	$_POST['title'];
	$description =	$_POST['type'];
	$name = $_FILES['archivo']['name'];
    $tmp_name = $_FILES['archivo']['tmp_name'];
    $test = new Test;
    $test->addTestAchs($title, $description, $date, $date_end,$tmp_name,$name, $postulante,$precio);
    
    $_SESSION['a'] = "Usted ha eliminado un test satisfactoriamente";
    
    header('Location: ../../preventivo.php');
    die();
}

$cargo_postulante = json_decode(json_encode(DB::table('postulante')->where('name', '=', $postulante)->get()),True);

foreach ($cargo_postulante as $row) {
	$id_postulante = $row['id'];
	$cargo_postular = $row['cargo_postular'];
}
$examen_extra = json_decode(json_encode(DB::table('examen_extra')->where('cargo_examen', '=', $cargo_postular)->get()),True);


foreach ($examen_extra as $row) {
	$id_e = $row['id_examen'];
}

$examen = json_decode(json_encode(DB::table('examenes')->where('id', '=', $id_e)->get()),True);


foreach ($examen as $row) {
	$title = $row['id'];
	$description = $row['description'];
	$precio = $row['precio'];
}

$name = $_FILES['archivo']['name'];
$tmp_name = $_FILES['archivo']['tmp_name'];
$test = new Test;
$test->addTestAchs($title, $description, $date, $date_end,$tmp_name,$name, $id_postulante,$precio);
if ($test) {
	echo 'is running';
	header('Location: ../../Test_achs.php');
}else{
	echo 'somenthing wrong';
}

