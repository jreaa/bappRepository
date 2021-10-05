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
		      <?php 
                if(isset($_SESSION['p'])){ ?>
                    <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['p'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                <span aria-hidden='true'>&times;</span>
              </button></div><?php unset($_SESSION['p']);
                 }?>
			<div class="row">
				<div class="col-md-12">
					<form action="app/Controllers/addPermiso.php" method="post">
						<div class="mb-3">
							<div class="card">
							    <div class="card-header">
							        <h3 class="mb-2">¡	
						            	Creacion de Vacaciones, Permisos, Licencias!</h3>
							    </div>
							    <div class="card-body">
							<div class="form-gruop">
								<?php include 'templates/postulantes_lista.php';?>
							</div>
							<div class="form-gruop">
								<label for="departamento">Departamento: </label>
								<input type="text" name="departamento" class="form-control">
							</div>
							<hr>
							<div class="form-gruop">
								<label>Tipo de permiso solicitado: </label>

								<div class="row">
									<div class="col-md-3">
										<label for="enfermedad">Enfermedad</label>
										<input type="radio" name="t_permiso" value="enfermedad">
									</div>
									<div class="col-md-3">
										<label for="vacaciones">Vacaciones</label>
										<input type="radio" name="t_permiso" value="vacaciones"><br>
										<label for="jurado">Jurado</label>
										<input type="radio" name="t_permiso" value="jurado">
									</div>
									<div class="col-md-3">
										<label for="defuncion">Defuncion</label>
										<input type="radio" name="t_permiso" value="defuncion"><br>
										<label for="maternidad_paternidad">Maternidad/Paternidad</label>
										<input type="radio" name="t_permiso" value="maternidad_paternidad">
									</div>
									<div class="col-md-3">
										<label for="t_libre">Tiempo libre no remunerado</label>
										<input type="radio" name="t_permiso" value="t_libre"><br>
										<label for="otro">Otro</label>
										<input type="radio" name="t_permiso" value="otro">
									</div>
								</div>

							</div>
							<hr>

							<div class="form-gruop">
								<label for="aceptada">Aceptada</label>
								<input type="radio" name="status" value ="aceptada"><br>
								<label for="rechazada">Rechazada</label>
								<input type="radio"  name="status" value="rechazada">
							</div>
							<hr>

							<div class="form-gruop">
								<label for="comentario">Comentarios</label>
								<textarea name="comentario" class="form-control"></textarea>
							</div>

							<div class="col-md-6">
								<div class="form-gruop">
									<label for="firma">Firma</label><br>
									<input type="hidden" name="firma" value="firma.png">
									<img src="archivos/firma.png" style="width: 100%">
								</div>
								
							</div>
							<div class="col-md-6">
								<div class="form-gruop">
									<?php $fcha = date("Y-m-d");?>
									<label for="fecha">Fecha</label>
									<input type="text" value="<?php echo $fcha;?>" name="fecha" class="form-control" readonly>
								</div>
							</div>
								<button class="btn btn-bapp btn-block" name="btn" id="btn" >Añadir</button>
						</div>
						
							    </div>
							</div>
							
			
					</form>	
				</div>
			</div>
		</div>
	</div> 
</div>



<?php include 'templates/footer.php' ?>