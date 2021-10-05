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

<?php 
$postulantes = json_decode(json_encode(DB::table('postulante')->where('disponible', '=', 'Trabajando')->get()), True); ?>
<div class="mt-5">
	<div class="container">
		<div class="content">
		     <a class="btn btn-bapp" style="float:right;padding: 10px;float: right;" href="monestacion.php"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
        </svg></a><br><br><br>
		   <div class="card">
		  <div class="card-header">
		      <div class="row">
				<div class="col-md-7">
					<h2 style="font-weight: bold" class="mb-3">Carta Amonestacion - Felicitaciones</h2>
				</div>
			</div>
		  </div>
			
			<div class="row">
				<div class="col-md-12">
				
						<div class="card-body">
							<form method="post" action="app/Controllers/carta_monestacion.php" enctype="multipart/form-data">
								<div class="form-gruop">
									<?php 
									if(!empty($postulantes)){
										?>
										<div class="row">
											<div class="col-md-12">
												<label for="postulante">Selecione un postulante</label>
												<select name="postulante" class="form-control" id="postulante" style="margin-bottom: 10px;" required>
													<option value="0">Elegir opción</option>
													<?php foreach($postulantes as $row) { ?>
														<option value="<?php echo $row['id'];?>" id="AF"><?php echo $row['name'].' '.$row['lastname'];?></option>
													<?php } ?>
												</select>
											</div>
										</div>
									<?php }else{?>
										<input type="hidden" value="2" id="com">
									    <div class="alert alert-warning">
									        No hay postulantes agregados en la base de datos
									    </div>
									<?php }?>
								</div>

								<div class="form-gruop">
									<label for="formato">Formatos</label>	
									<select name="formato" class="form-control">
										<option value="0">...</option>
										<option value="amonestacion">Amonestacion</option>
										<option value="felicitaciones">Felicitaciones</option>
									</select>
								</div>

								<div class="form-gruop">
									<label for="mensaje">Mensaje</label>
									<textarea rows="8"type="text" name="mensaje" class="form-control" required></textarea>
								</div>
								<button class="mt-3 btn btn-block btn-bapp" name="btn" id="btn"  type="submit">Enviar</button>
							</form>
						</div>
					</div>	
				</div>
			</div>

		</div>
	</div>
</div>


<script>
    let c = $('#com').val();
    if(c == "2"){
        $("#btn").click(function(){
            alert("No hay usuarios agregados..")
        })
    }
</script>




<?php include('templates/footer.php'); ?>