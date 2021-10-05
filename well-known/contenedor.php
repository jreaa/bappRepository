<?php
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include ('templates/header.php'); ?>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-7">
					<h2 style="font-weight: bold" class="mb-3">Accidente</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h4>Subir un nuevo contrato</h4>
					<form method="post" action="app/Controllers/contenedor.php" enctype="multipart/form-data">
						<div class="form-gruop">
							<label for="archivo">Contrato</label>
							<input type="file" name="archivo" class="form-control" required>
						</div>

						<div class="form-gruop">
							<label for="name">Nombre del contrato</label>	
							<input type="text" name="name" class="form-control" required>
						</div>
						

						<div class="form-gruop">
							<label for="t_contrato">Tipo de Contrato</label>
							<input type="text" name="t_contrato" class="form-control" required>
						</div>
						<div class="form-gruop">
							<label for="fcha">Fecha de ingreso</label>
							<input type="date" value="<?php echo $fcha = date("Y-m-d") ?>" name="fcha" class="form-control" readonly="">
						</div>

						
						
						
						<button class="mt-3 btn btn-block btn-primary" name="btn" type="submit">Guardar Contrato</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>


<?php include 'templates/footer.php'?>