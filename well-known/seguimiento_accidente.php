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

$accidente = DB::table('accidente')->get();
$array = json_decode(json_encode($accidente), True);

?>

	<div class="mt-5">
    	<div class="container">
    		<div class="content">
    			<div class="row">
    				<div class="col-md-12">
    					<div class="head_section">
        						<h3>Seguimiento Accidentes</h3>
    						<a href="accidente.php" style="padding:12px;" class="btn btn-bapp">Nuevo</a>
    						</div>
    					</div>
    				</div>
    			</div>
    		</div>
		</div>
		        <?php 
    if(isset($_SESSION['a'])){ ?>
        <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['a'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span>
  </button></div><?php unset($_SESSION['a']);
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
											<th scope="col">#</th>
											<th scope="col">Fecha de evento</th>
											<th scope="col">Fecha de reultado</th>
											<th scope="col">Resultado</th>
											<th scope="col">DIAT</th>
											<th scope="col">--</th>
										</tr>
									</thead>

									<?php
									foreach($array as $row) { ?>


										<tbody>
											<tr>
												<th scope="row"><?php echo $row['id'];?></th>
												<td><?php echo $row['f_evento'];?></td>
												<td><?php echo $row['f_resultado'];?></td>
												<td><?php echo $row['resultado'];?></td>
												<td><button onclick="modal(<?php echo $row['id']; ?>)" class="btn btn-bapp" id="btnModal">Ver Archivo</button></td>
												<input type="hidden" id="modal" value="<?php echo $row['id'];?>">
												<td>
												<button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar este seguimiento?', 'app/Controllers/controllerDeleteAccidente.php',<?php echo $privi;?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
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
                                				No hay accidentes agregados...
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

	<?php 
	foreach($array as $row) { ?>
			<!--modal-->
			<div class="modal" tabindex="-1" id="modal<?php echo $row['id'];?>">
				<div class="modal-dialog">
					<div class="modal-content modal-lg">
						<div class="modal-header">
							<h5 class="modal-title">Archvio DIAT: </h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						
						<div class="col-md-12">
							<iframe src="archivos/<?php echo $row['achivo']; ?>" style="width: 100%; height: 500px;"></iframe>
							<a href="archivos/<?php echo $row['achivo']; ?>" download="04_Formulario_DIAT.pdf" class="btn btn-block btn-success">Descargar</a>
						</div>
					</div>
				</div>
			</div>
		<?php }?>
		<script type="text/javascript">
			function modal(numero_modal){
				//let m = $('#modal').val();
				$("#modal"+numero_modal).modal("show");
			}
		</script>

    <script src="http://oca.soporbapp.cl/js/delete.js%20"></script>



<?php include 'templates/footer.php' ?>