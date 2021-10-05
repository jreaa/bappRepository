<?php 
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include('templates/header.php');
?>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<form class="form-group" action="app/Controllers/addTest.php" method="post">
						<div class="mb-3">
							<h3 class="mb-2">¡Usted esta creando un nuevo test!</h3>
							<label for="title">Por favor escriba un titulo: </label>
							<input type="text" name="title" class="form-control" id="title">
							<label for="type">Por favor escriba una descripcion: </label>
							<input type="text" name="description" class="form-control" id="description">
							<label for="date">Por favor escriba una fecha de inicio: </label>
							<input type="date" name="date" class="form-control" id="date">
							<label for="date_end">Por favor escriba una fecha de cierre: </label>
							<input type="date" name="date_end" class="form-control" id="date_end">
						</div>
						<button class="btn btn-primary btn-block" name="createTest" id="btn" >Añadir</button>				
					</form>	
				</div>
			</div>
		</div>
	</div> 
</div>










<?php include('templates/footer.php');?>