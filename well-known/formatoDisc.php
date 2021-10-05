<?php 
session_start();
//$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if (!isset($_SESSION['postulante'])) {
	header('Location: verifyPostulTest.php');
}

?>
<!doctype html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!--Style--->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <!--style--->
   <link href="css/style.css" rel="stylesheet">


    <title>Bapp [Servicio de Transporte]</title>
  </head>
  <body>
    <!--header-->
    <header id="header">
        <nav class="navbar" style="height: 115px;">
        <div class="container">
          <a href="inicio.php"><img class="navbar-brand" src="img/logo.png" alt="logo bapp" width="200"></a>
          <div class="content-brand" style="text-align: center;">
            
          </div>
            <a href="#">
              <h3 class="textHead">Bienvenido</h3>
            </a>
        </div>
      </nav>
    </header>


	<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Name</label>
						<input type="text" name="name" value="<?php echo $_SESSION['postulante'];?>" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>Rut</label>
						<input type="text" name="name" value="<?php echo $_SESSION['rut'];?>" class="form-control" readonly>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label>Apellido</label>
						<input type="text" name="name" value="<?php echo $_SESSION['lastname'];?>" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>Cargo a postular</label>
						<input type="text" name="name" value="<?php echo $_SESSION['cargo_postular'];?>" class="form-control" readonly>
					</div>
				</div>
			</div>
			<form action="app/Controllers/formatDisc.php" method="post">
				<div class="card">
				    <div class="card-body">
				        <div class="conatainer">
    					<?php include 'templates/test/formatDisc.php';?>
    				    </div>
				    </div>
				</div>
				<button type="submit" class="btn btn-block btn-bapp">Enviar</button>
			</form>
	</div>
