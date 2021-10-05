 
<?php
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}

include 'templates/header.php'; 
?>
<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-7">
					<h2 style="font-weight: bold" class="mb-3">Accidente</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7">
					<h4>DENUNCIA INDIVIDUAL DE ACCIDENTE DEL TRABAJO (DIAT)</h4>
					<form method="post" action="app/Controllers/accidente.php" enctype="multipart/form-data">
						<label for="archivo">Subir archivo DIAT</label>
						<input type="file" name="archivo" class="form-control" required>
						<label for="f_evento">Fecha de evento</label>	
						<input type="date" name="f_evento" placeholder="Por favor ingrese el periodo" class="form-control" required>
						<label for="f_resultado">Fecha de resolucion</label>
						<input type="date" name="f_resultado" class="form-control" required>
						<label for="resultado">Resultado</label>
						<textarea name="resultado" class="form-control" required></textarea>
						<button class="mt-3 btn btn-block btn-bapp" name="btn" type="submit">Subir Archivo</button>
					</form>
				</div>
				<div class="col-md-5">
					<iframe src="archivos/04_Formulario_DIAT.pdf" style="width: 100%; height: 90%;"></iframe>
					<a href="archivos/04_Formulario_DIAT.pdf" download="04_Formulario_DIAT.pdf" class="btn btn-block btn-success">Descargar</a>
				</div>
			</div>

		</div>
	</div>
</div>


<?php include 'templates/footer.php'?>
