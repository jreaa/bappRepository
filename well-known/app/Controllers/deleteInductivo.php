<?php 
session_start();
include('../../vendor/autoload.php');
include('../CentroCosto/CentroCosto.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;


$id = $_GET['id'];

DB::table("inductivo")->where("id", "=", $id)->delete();

	    
$_SESSION['c'] = "Usted ha eliminado un inductivo";
header("Location: ../../../inductivo.php");
	    