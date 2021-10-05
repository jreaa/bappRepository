<?php
session_start();
$url = 'formatoDisc.php';

include('../vendor/autoload.php');
include('../app/Database/Database.php');
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
  <link href="../css/style.css" rel="stylesheet">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
	<link href="../signin.css" rel="stylesheet">
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
<div class="form-signin">
    

<form method="post">
	<img class="mb-4" src="../img/logo.png" alt="" width="300">
	<h1 class="h3 mb-3 font-weight-normal">Cambiar Contraseña</h1>
	<label for="inputRut" class="sr-only">Rut</label>
	<input type="text" id="inputRut" class="form-control" placeholder="Por favor ingrese su rut" name="rut" required autofocus>

	<button name="btn" class="mt-3 btn btn-lg btn-bapp btn-block" type="submit">Buscar</button>
</form>
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
				$rut = $row['rut'];
				
			} ?>
			
	<br>
	<br>
	<h5 class=" mb-3 font-weight-normal">Por favor escribe tus contraseñas</h5>
	<form id="form" method="post">
	    <input type="hidden" value="<?=$rut;?>" name="rut"> 
	     <div class="form-input">
	         <input id="pass1" type="password" name="password1" class="form-control" placeholder="Por favor escriba su contraseña" >
	     </div>
	    <div class="form-input">
	         <input id="pass2" type="password" name="password2" class="form-control" placeholder="Confirmar contraseña">
	     </div>
	     <button id="btnsend" btn="mt-3 btn btn-lg btn-bapp btn-block"  type="button"  name="btn2" >Guardar</button>
	     
	     <script>
	         $(document).ready(function(){
	            $('#btnsend').click(function(){
	               var pass = $("#pass1").val();
	               var pass2 = $("#pass2").val(); 
	               
	               if(pass != pass2){
	                   alert("Las contraseñas no coinciden!");
	               }else{
	                   $('#form').submit();
	               }
	            });
	         });
	     </script>
	</form>
		
	<?php	}
	}
	
	
	?>
	
	<?php 
	if(isset($_POST['btn2'])):
	    $password = $_POST['password1'];
	    $pass = password_hash($password, PASSWORD_BCRYPT);
	    $rut = $_POST['rut'];
	    
	    DB::table('users')->where('rut', '=', $rut)->update([
	        'password' => $pass
	   ]);
	    
        ?>
        	<div class="alert alert-success">
        		Contraseña cambiada
        	</div>

        
        <?php
	    
	    
	  endif;
	
	?> 

	<p class="mt-5 mb-3 text-muted">&copy; Bapp Servicio de Transporte 2020</p>
</div>
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

