<?php
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include('templates/header.php');
include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

?>


<?php 
if(isset($_GET['id'])){
	$desvincular = json_decode(json_encode(DB::table('desvincular')->where('id', '=', $_GET['id'])->get()), True);
	foreach ($desvincular as $row) {
		$finiquito = $row['finiquito'];
	}
	if($finiquito == 'No Realizado'){
		include('templates/personalInactivo/step2.php');
	}else{
		include('templates/personalInactivo/step3.php');
	}
}else{
	include('templates/personalInactivo/form.php');
}
?>

<?php include('templates/footer.php') ?>

