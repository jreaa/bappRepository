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

$postulantes = json_decode(json_encode(DB::table('postulante')->where('disponible', '=', 'Trabajando')->get()), True);

?>

<main class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Historial del Personal</h3>
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
						    <?php if(!empty($postulantes)){ ?>
							<table class="table table-hover">
								
							  <thead class="mt-5">
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">Nombre</th>
							      <th scope="col">Apellido</th>
							      <th scope="col">Rut</th>
							      <th scope="col">Status</th>
							      <th scope="col">Fecha inicio de contrato</th>
							      <th scope="col">Fecha termino de contrato</th>
							      <th scope="col">--</th>
							      <th scope="col">--</th>
							    </tr>
							  </thead>

							  <?php
								foreach($postulantes as $row) {
								?>

							  <tbody>
							    <tr>
							      <th scope="row"><?php echo $row['id'];?></th>
							      <td><?php echo $row['name'];?></td>
							      <td><?php echo $row['lastname'];?></td>
							      <td><?php echo $row['rut'];?></td>
							      <td id="status"><?php echo $row['disponible'];?></td>

							      <?php 
							      $vp = json_decode(json_encode(DB::table('vincular_personal')->where('id_postulante', '=', $row['id'])->get()), True);
							      foreach ($vp as $key) {
							      	$fecha1 = $key['fecha_incio'];
							      	$fecha2 = $key['fecha_cierre'];
							      }
							      ?>
							      <td><?php echo $fecha1;?></td>
								  <td><?php echo $fecha2;?></td>

							      <td>
							      	<a href="editarPostulante.php?id=<?php echo $row['id'];?>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
									</svg></a>
							      </td>
							      <td>
							      	<button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar este usuario?', 'app/Controllers/deletePostulante.php',<?php echo $privi;?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
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
                                    No hay usuarios agregados...
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
<script type="text/javascript">
	function deleteUser(id){
		if(confirm('¡Estas seguro que deseas eliminar el usuario seleccionado?')){
			window.location="app/Controllers/deletePostulante.php?id="+id;
		}
	}
</script>
<?php include('templates/footer.php');?>