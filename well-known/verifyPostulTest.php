<?php
session_start();
$url = 'formatoDisc.php';

include('vendor/autoload.php');
include('app/Database/Database.php');
session_start();

use Illuminate\Database\Capsule\Manager as DB;
?>

<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Jekyll v4.1.1">
	<title>Bapp [Servicio de Transporte]</title>
	  <!--style--->
  <link href="css/style.css" rel="stylesheet">


	<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

	<style>
		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			user-select: none;
		}

		@media (min-width: 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}
	</style>
	<!-- Custom styles for this template -->
	<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">

<!--<div class="content mt-3">
	<div class="container">

		<div class="row">
			<div class="text-center">
				<div class="wrapper_form">
					<form action="app/Controllers/postul_test.php" method="post">
						<div class="form-group">
							<label>Por favor ingrese su rut:</label>
							<input type="text" name="rut" class="form-control" id="rut" required>	
						</div>
						<button name="btn" type="submit" class="btn btn-block btn-primary sbumit_button">Ingresar</button>
					</form>
				</div>
			</div>
		</div>
		
	</div>
</div>-->

<form class="form-signin" method="post">
	<img class="mb-4" src="img/logo.png" alt="" width="300">
	<h1 class="h3 mb-3 font-weight-normal">Bienvenido</h1>
	<label for="inputRut" class="sr-only">Rut</label>
	<input type="text" id="inputRut" class="form-control" placeholder="Por favor ingrese su rut" name="rut" required autofocus>
	<button name="btn" class="mt-3 btn btn-lg btn-bapp btn-block" type="submit">Iniciar Sesion</button>
	<?php 
	if (isset($_POST['btn'])) {
		$postulante=DB::table('postulante')->where('rut', '=', $_POST['rut'])->get();
		$array = json_decode(json_encode($postulante), True);
		if(empty($array)){ ?>
			<div class="alert alert-danger">
				El rut no existe
			</div>

		<?php }else{
			foreach($array as $row){
				$cargo_postular = $row['cargo_postular'];
				$name = $row['name'];
				$rut = $row['rut'];
				$lastname = $row['lastname'];
				$email = $row['email'];
				$id_postulante = $row['id'];
			}
			$e = json_decode(json_encode(DB::table('formatodisc')->where('id_postulante', '=', $id_postulante)->get()),True);
			if(empty($e)){ ?>
				<div class="alert alert-warning">
					Uste no tiene ninguna prueba asignada aun!
				</div>
			<?php }else{ 
				foreach ($e as $row) {
					$intentos = $row['intentos'];
				}
				if ($intentos === 0) { ?>
					<div class="alert alert-warning">
						Usted ya ha rendido esta prueba!!
					</div>
				<?php }else{


				$_SESSION['postulante'] = $name;
				$_SESSION['email'] = $email;
				$_SESSION['cargo_postular'] = $cargo_postular;
				$_SESSION['rut'] = $rut;
				$_SESSION['lastname'] = $lastname;
				$_SESSION['id_postulante'] = $id_postulante;
				header('Location: '.$url);
			}
		}
			
		}
	}

	?>
	<p class="mt-5 mb-3 text-muted">&copy; Bapp Servicio de Transporte 2020</p>
</form>
</body>


<!--<script type="text/javascript">
	$(document).ready(function(){
		$('#db_contact_form').on('submit',db_contact_form);
		function db_contact_form(e){
			e.preventDefault();
			var data = new FormData($('#db_contact_form').get(0)),
			wrapper_form = $('.wrapper_form'),
			wrapper_msg = $('.wrapper_msg'),
			sbumit_button = $('.sbumit_button');

			console.log(data)
		}
	})
</script>-->

