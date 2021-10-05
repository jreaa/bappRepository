<?php
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include 'templates/header.php'; ?>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<form class="form-group" action="app/Controllers/mantencion_siniestro.php" method="post" enctype="multipart/form-data">
					    <div class="card">
					        <div class="card-header">
					            <h3 class="mb-2">¡	
							        Mantencion y Siniestro!</h3>
					        </div>
					                <?php 
                                        if(isset($_SESSION['m'])){ ?>
                                            <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['m'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                                        <span aria-hidden='true'>&times;</span>
                                      </button></div><?php unset($_SESSION['m']);
                                         }?>

					        <div class="card-body">
					            <div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="date">Fecha de solicitud:</label>
										<input type="date" name="date" class="form-control" required>
									</div>
									<div class="form-group">
										<label for="patente">Patente: </label>
										<input type="text" name="patente" class="form-control" id="patente" required>									</div>
										<div class="form-group">
											<label>Responsable: </label>
											<?php include 'templates/postulantes_lista.php'; ?>
										</div>
										<div class="form-group">
											<label for="mVehiculo">Modelo Vehiculo</label>
											<input type="text" name="mVehiculo" class="form-control" required>
										</div>
										<div class="form-group">
											<label for="nreserva">Numero de Reserva: </label>
											<input type="number" name="nreserva" class="form-control" required>
										</div>
										<div class="form-group">
											<label for="taller">Taller</label>
											<input type="text" name="taller" class="form-control" required>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
										<label for="today">Fecha: </label>
										<input type="date" name="today"class="form-control" value="<?php echo  $fcha = date("Y-m-d");?>"readonly>
									</div>
									<div class="form-group">
										<label for="hora">Hora: </label>
										<input type="time" name="hora" class="form-control" required>						
									</div>
										<div class="form-group">
											<label class="direccion">Direccion: </label>
											<input type="text" name="direccion" class="form-control" required>
										</div>
										<div class="form-group">
											<label for="servicio">Tipo de servicio</label>
											<input type="text" name="servicio" class="form-control" required>
										</div>
										<div class="form-group">
											<label for="observaciones">Observaciones: </label>
											<input type="text" name="observaciones" class="form-control" required>
										</div>
										<div class="form-group">
											<label for="fentrega">Fecha entrega</label>
											<input type="date" name="fentrega" class="form-control" required>
										</div>
									</div>
								</div>
					        </div>
					        <div class="card-footer">
					            <div class="form-group">
								<label for="resultado">Resultado</label>
								<textarea type="text" name="resultado"class="form-control" col="5" required></textarea>
							</div>
							<button class="btn btn-bapp btn-block" name="btn" id="btn" >Añadir</button>	
							
					        </div>
					    </div>

							
						</form>	
					</div>
				</div>
			</div>
		</div> 
	</div>



	<?php include 'templates/footer.php' ?>