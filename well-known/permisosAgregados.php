<?php
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
} 
include 'templates/header.php';
include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;


$privi = $_SESSION['privileges'];

$test_achs = DB::table('permisos')->get();
$array = json_decode(json_encode($test_achs), True);
?>

	<main class="mt-5">
			<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Permisos</h3>
						<a href="permisos.php" class="btn btn-bapp" style="padding:12px">Nuevo</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
        <?php 
    if(isset($_SESSION['p'])){ ?>
        <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['p'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span>
  </button></div><?php unset($_SESSION['p']);
     }?>		

		<section class="mt-3">
			<div class="container">
				<div class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
							    <?php if(!empty($array)){ ?>
								<table class="table table-hover">

									<thead>
										<tr>
											<th scope="col">Usuario</th>
											<th scope="col">Rut</th>
											<th scope="col">Departamento</th>
											<th scope="col">Tipo Permiso</th>
											<th scope="col">Status</th>
											<th scope="col">Comentario</th>
											<th scope="col">Fecha</th></th>
											<th scope="col">--</th>
										</tr>
									</thead>

									<?php
									foreach($array as $row) { ?>


										<tbody>
											<tr>
											    <?php 
											    
											    $m = json_decode(json_encode(DB::table('postulante')->where("id", "=", $row['id_postulante'])->get()),True);
											    foreach($m as $c){
											        $n = $c['name'];
											        $l = $c['lastname'];
											    }
											    
											    ?>
												<th scope="row"><?php echo strtoupper($n.' '.$l);?></th>
												<td><?php echo $row['rut'];?></td>
												<td><?php echo  strtoupper($row['departamento']);?></td>
												<td><?php echo  strtoupper($row['tipo_permiso']);?></td>
												<td><?php echo  strtoupper($row['status']);?></td>
												<td><?php echo strtoupper($row['comentario']);?></td>
												<td><?php echo $row['fecha'];?></td>
											
												<td>
													 <button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar este permiso?', 'app/Controllers/controllerDeletePermiso.php',<?php echo $privi;?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                									</svg></button>
												</td>
											</tr>
										</tbody>
									<?php } ?>
								</table>
							<?php }else{ ?>
                                 <div class="alert alert-warning">
                                     No hay mantenimientos agregados
                                 </div>
                                 
                            <?php } ?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<?php 
	foreach($array as $row) {
		$msiniestro = DB::table('mantencion_siniestro')->where('id','=', $row['id_mantencion'])->get();
		$id = $row['id'];
		$array2 = json_decode(json_encode($msiniestro), True);
		foreach ($array2 as $key) { ?>
			<!--modal-->
			<div class="modal" tabindex="-1" id="modal<?php echo $id;?>">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Mantencion: </h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form method="post" id="formSend" action="app/Controllers/addPostulante.php">
							<div class="modal-body">
								<div class="row">
									<div class="col">
										<h6>Fecha de solicitud</h6>

										<p id="n"><?php echo $key['fecha_solicitud'];?></p>
										<h6>Patente</h6>

										<p id="r"><?php echo $key['patente'];?></p>
										<h6>Modelo del vehiculo</h6>

										<p id="g"><?php echo $key['modelo_v'];?></p>

										<h6>Numero de reserva</h6>

										<p id="d"><?php echo $key['n_reserva'];?></p>
										<h6>Taller</h6>

										<p id="na"><?php echo $key['taller'];?></p>
										<h6>Hora</h6>

										<p id="cp"><?php echo $key['hora'];?></p>
									</div>
									<div class="col">
										<h6>Fecha</h6>

										<p id="l"><?php echo $key['fecha'];?></p>
										<h6>Direccion</h6>

										<p id="da"><?php echo $key['direccion'];?></p>
										<h6>Tipo de servicio</h6>

										<p id="e"><?php echo $key['t_servicio'];?></p>
										<h6>Observaciones</h6>

										<p id="t"><?php echo $key['observaciones'];?></p>
										<h6>Fecha de entrega</h6>

										<p id="c"><?php echo $key['fecha_entrega'];?></p>
										<h6>Resultado</h6>

										<p id="c"><?php echo $key['resultado'];?></p>

										<h6>Trabajador</h6>
										<?php 
										$postulante = json_decode(json_encode(DB::table('postulante')->where('id','=', $key['id_postulante'])->get()), True);
										foreach ($postulante as $k) {
											$name = $k['name'];
										} ?>

										<p id="cp"><?php echo $name;?></p>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		<?php } }?>
		<script type="text/javascript">
			function modal(numero_modal){
				//let m = $('#modal').val();
				$("#modal"+numero_modal).modal("show");
			}
		</script>
   


    <script src="http://oca.soporbapp.cl/js/delete.js%20"></script>


<?php include 'templates/footer.php' ?>