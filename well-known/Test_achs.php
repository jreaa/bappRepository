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
				<div class="col-md-12">
					<form class="form-group" action="app/Controllers/addTest.php" method="post" enctype="multipart/form-data">
						<div class="mb-3">
							
							<h3 class="mb-2">¡Usted esta creando un nuevo test por la ACHS!</h3>
							
							<label for="title">Por favor escriba un titulo: </label>
							<input type="text" name="title" class="form-control" id="title" required>
							<label for="type">Por favor escriba una descripcion: </label>
							<textarea name="type" class="form-control" id="type" required></textarea>
							<label for="date">Por favor escriba una fecha de inicio: </label>
							<input type="date" name="date" class="form-control" id="date" required>
							<label for="date_end">Por favor escriba una fecha de cierre: </label>
							<input type="date" name="date_end" class="form-control" id="date_end" required>
							<label for="doc">Adjuntar documento</label>
							<input type="file" name="archivo" class="form-control" required>
							<label for="precio">Precio</label>
							<input type="number" name="precio" class="form-control" required>
							<?php include 'templates/postulantes_lista.php';?>
						</div>
						<button class="btn btn-primary btn-block" name="btn_achs" id="btn" >Añadir</button>				
					</form>	
				</div>
			</div>
		</div>
	</div> 
</div>





<?php include 'templates/footer.php';?>