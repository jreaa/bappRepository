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
$convenio = json_decode(json_encode(DB::table('convenio')->get()),True);
?>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<form class="form-group" action="app/Controllers/control_hora.php" method="post" enctype="multipart/form-data">
						<div class="mb-3">
						     <?php 
                                if(isset($_SESSION['c'])){ ?>
                                    <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['c'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                                <span aria-hidden='true'>&times;</span>
                              </button></div><?php unset($_SESSION['c']);
                                 }?>
						    <div class="card">
						        <div class="card-header">
						        <h3 class="text-center mb-2">¡	
							        Control Horas!</h3>
						        </div>
						        <div class="card-body">
						            							<div class="row">
								<div class="col-md-12">
									<hr>
									<div class="form-group">
										<label for="requerimiento">Requerimiento:</label>
										<input type="text" name="requerimiento" class="form-control" required>
									</div>
										
										<div class="form-group">
											<?php include 'templates/postulantes_lista.php';?>
										</div>
										<div class="form-group">
											<label for="date">Fecha: </label>
											<input type="date" name="date" class="form-control" required>
										</div>
										<div class="form-group">
											<label for="hours">Horas de trabajo:</label> 
											<input type="text" name="hours" class="form-control" required>
										</div>
										<div class="form-group">
											<hr>
											<h3>Quien asigna el documento!</h3>
											<hr>
											<div class="row">
												<div class="col-md-6">
													<label for="name">Nombre:</label> 
													<input type="text" name="name" class="form-control" required>
												</div>
												<div class="col-md-6">
													<label for="rut">Rut:</label> 
													<input type="text" name="rut" class="form-control" required>
												</div>

											</div>
										</div>


								</div>
							</div>
							<button class="btn btn-bapp btn-block mt-2" name="btn" id="btn" >Añadir</button>
						        </div>
						    </div>
						
						</form>	
					</div>
				</div>
			</div>
		</div> 
	</div>

	<?php include 'templates/footer.php' ?>