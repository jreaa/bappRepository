<?php 
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include 'templates/header.php'; 
include('vendor/autoload.php'); 
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$file = DB::table('files_achs')->select('id', 'file', 'periodo','vigencia')->get();
$array = json_decode(json_encode($file),True);
foreach ($array as $row ) {
	$nameFile = $row['file'];
	$vigencia = $row['vigencia'];
}
?>
<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-7">
					<h2 style="font-weight: bold;font-size:25px;padding-top:20px" class="mb-3" >Mutualidad</h2>
				</div>
				<div class="col-md-5">
				    <div class="card-header">
				        <h2 style="font-weight: bold" class="mb-3">Fecha de vencimiento: <span style="font-size:20px; font-weight: normal;"><br><?php echo $vigencia;?></span></h2>
				    </div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-md-7">
					<h4 style="font-size:20px">En este apartado solo se debe cargar certificado otorgado por la ACHS.</h4>
					<form method="post" action="app/Controllers/upload.php" enctype="multipart/form-data" class="form-group">
						<label for="archivo">Certificado ACHS</label>
						<input type="file" name="archivo" class="form-control" required>
						<label for="periodo">Periodo</label>	
						<input type="text" name="periodo" placeholder="Por favor ingrese el periodo" class="form-control" required>
						<label for="vigencia">Vigencia</label>
						<input type="date" name="vigencia" class="form-control" required>
						<button class="mt-3 btn btn-block btn-bapp" name="btn" type="submit">Subir Archivo</button>
					</form>
				</div>
				<div class="col-md-5 mt-2">
					<iframe src="archivos/<?php echo $nameFile;?>" style="width: 100%; height: 90%;"></iframe>
					<a href="archivos/<?php echo $nameFile;?>" download="ach.pdf" class="btn btn-block btn-success">Descargar</a>
				</div>
			</div>

		</div>
	</div>
</div>


<?php include 'templates/footer.php'?>
