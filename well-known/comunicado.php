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
$privi = $_SESSION['privileges'];

$comunicados = json_decode(json_encode(DB::table('comunicados')->get()), True);

?>

<main class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Comunicados</h3>
						<a href="comunicados.php" class="btn btn-bapp" style="padding:10px">Nuevo</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="mt-3">
		<div class="container">
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
						    <?php if(!empty($comunicados)){ ?>
							<table class="table table-hover">
								
							  <thead class="mt-5">
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">Trabajador</th>
							      <th scope="col">Asunto</th>
							      <th scope="col">Mensaje</th>
							      <th scope="col">Fecha</th>
							      <th scope="col">Hora</th>
							      <th scope="col">Leido</th>
							      <th scope="col">Firmado</th>
							      <th scope="col">--</th>
							    </tr>
							  </thead>

							  <?php
								foreach($comunicados as $row) {
								?>

							  <tbody>
							    <tr>
							      <th scope="row"><?php echo $row['id'];?></th>
							      <?php 
							      $postulante = json_decode(json_encode(DB::table('postulante')->where('id', '=', $row['id_postulante'])->get()), True);
							      foreach ($postulante as $key) {
							      	$name = $key['name'];
							      	$lastname = $key['lastname'];
							      }
							      ?>
							      <td><?php echo $name.' '.$lastname;?></td>
							      <td><?php echo $row['asunto'];?></td>

							      <td><?php echo $row['mensaje'];?></td>

							      <td id="status"><?php echo $row['fecha'];?></td>

							      <td><?php echo $row['hora'];?></td>
							    
							      <td><?php echo $row['leido'];?></td>
							     

							      <td><?php echo $row['firmado'];?></td>

							      <td>
							      	 <button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar este comunicado?', 'app/Controllers/controllerDeleteComunicado.php',<?php echo $privi;?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg></button>
							      </td>
							    </tr>
							  </tbody>
							  <?php } ?>
							</table>
                            <?php }else{ ?>
                            <div class="container">
                              <div id="content" class="alert alert-warning text-center">
                                    No hay comunicados agregados...
                              </div>
                            </div>
                            <?php } ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>

    
<script src="http://oca.soporbapp.cl/js/delete.js%20"></script>



<?php include('templates/footer.php');?>