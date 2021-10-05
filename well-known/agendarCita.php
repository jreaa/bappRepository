<?php 
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];


if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include ('templates/header.php');
include('vendor/autoload.php'); 
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

if (isset($_GET['name'])) {
	$name = $_GET['name'];
	$lastname = $_GET['lastname'];
	$id = $_GET['id'];
}

?>

<main class="mt-5">
	<div class="container">
		<div>
			<div class="row" style="height: 600px">
				<div class="col-lg-8 content">
				    <a class="btn btn-bapp" style="float:right" href="resultados.php"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                </svg></a>
					<h2>¡Usted esta agendando una nueva cita!</h2>
                    <form class="form-group mt-3">
						<div class="form-row">
						    <div class="col">
						      <label for="senior">Sr</label>
							  <input name="senior" class="form-control" type="text" value="<?php echo ucwords($_SESSION['name']);?>" readonly>
						    </div>
						    <div class="col">
						      <label for="position">Puesto</label>
							  <input name="position" class="form-control" type="text" value="<?php echo ucwords($_SESSION['position']);?>" readonly>
						    </div>
						  </div>
						 <?php $fcha = date("Y-m-d");?>
						<label for="dataDay">Fecha de hoy</label>
						<input type="date" name="dateDay" class="form-control" value="<?php echo $fcha;?>" readonly>
					</form>
                        <?php 
                    if(isset($_SESSION['c'])){ ?>
                        <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['c'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                    <span aria-hidden='true'>&times;</span>
                  </button></div><?php unset($_SESSION['c']);
                     }?>
					<div>
						<label class="text-center" style="font-size: 20px;font-weight: bold">¡Por favor seleccione el tipo de entrevista!</label>

						<div class="dropdown">
							<a style="text-align:left" class="btn btn-link btn-block dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Entrevista
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<?php if(!isset($_GET['name'])){?>
									<button id="button" class="dropdown-item" value="templates/cita_presencial.php" type="button">Presencial</button>
									<button id="button2" class="dropdown-item" value="templates/cita_telefonica.php" type="button">Telefonica</button>
								<?php }else{?>
									<button id="button" class="dropdown-item" value="templates/cita_presencial.php?name=<?php echo $name;?>&lastname=<?php echo $lastname;?>&id=<?php echo $id?>" type="button">Presencial</button>
									<button id="button2" class="dropdown-item" value="templates/cita_telefonica.php?name=<?php echo $name;?>&lastname=<?php echo $lastname;?>&id=<?php echo $id?>" type="button">Telefonica</button>
								<?php }?>
							</div>
						</div>
					</div>
					<div class="mt-3" id="contenido">
						
					</div>
					
				</div>
				<div id="bg-cita" class="col-lg-4" style="background-image: url(img/agendar.jpg); background-repeat: no-repeat;background-size: cover;background-position-x:center;  ">
				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript" src="js/ajax.js"></script>

<?php include 'templates/footer.php'?>
