<?php 
session_start();
include('../../vendor/autoload.php');
include('../CentroCosto/CentroCosto.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;


$id = $_GET['id'];

DB::table("cc_vinculacion")->where("id", "=", $id)->delete();

	    
$_SESSION['c'] = "Usted ha eliminado una clasificacion";
header("Location: ../../../clasificacion.php");
	    