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
<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<h2 style="font-weight: bold" class="mb-3">Agregar Nuevos Perfiles</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div id="alerts"></div>
					<h4>En este apartado solo se debe agregar nuevos usuarios.</h4>
					<form method="post" action="app/Controllers/addUser.php" enctype="multipart/form-data" class="form-group">
						<label for="archivo">Name</label>
						<input type="text" name="name" class="form-control" required>
						<label for="periodo">Email</label>	
						<input type="email" name="email" placeholder="Por favor ingrese el email" class="form-control" required>
						<label for="password">Password</label>
						<input type="password" name="password" class="form-control" required id="pass">
						<label for="password2">Validar Password</label>
						<input type="password" name="password2" class="form-control" required id="pass2">
						<button id="btnValid" type="button" onclick="check()"class="mt-3 btn btn-block btn-primary">Validar</button>
						<button id="btn" style="display: none" class="mt-3 btn btn-block btn-primary" name="btn" type="submit">Guardar</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	 function check(){
	 	let pass = document.getElementById('pass');
		let pass2 = document.getElementById('pass2');
		 if (pass.value != pass2.value) {
		 	pass.className += " is-invalid";
		 	pass2.className += " is-invalid";
		 	$("#alerts").html("<div class='alert alert-danger alert-dismissible fade show'  role='alert'><strong>Las contraseñas son incorrectas.</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
		 	//return alert('Las contraseñas no son correctas');
		 }else{
		 	//pass.setAttribute('disabled','disabled');
		 	//pass2.setAttribute('disabled','disabled');
		 	$('#btnValid').css({'display':'none'}); 
		 	$('#btn').css({'display':'block'}); 
		 }
	 }

</script>

<?php include 'templates/footer.php'?>
