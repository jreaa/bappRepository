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

$priv = $_SESSION['privileges'];

if(isset($_POST['btn'])){
	$title = $_POST['title'];
	$description = $_POST['description'];
	$precio = $_POST['precio'];

	try{
		$examen = DB::table('examenes')->insert([
			'title' => $title,
			'description' => $description,
			'precio' => $precio
		]);
	}catch(PDOException $e){
		echo $e;
	}
}

$privileges = DB::table('examenes')->select()->get();
$array = json_decode(json_encode($privileges), True);
?>
<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Examenes</h3>
						<button  style="float:right;" class="btn btn-bapp" onclick="modal(<?php echo $priv; ?>)">Nuevo</button>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    
    <?php 
    if(isset($_SESSION['e'])){ ?>
        <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['e'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span>
  </button></div><?php unset($_SESSION['e']);
     }?>

    <section class="mt-3">
        <div class="container">
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                        <?php if(!empty($array)){ ?>
                        <table class="table">
                            <thead>
                                <tr>
                                <th scope="col">Titulo</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Fecha Inicio</th>
                                <th scope="col">Fecha Cierre</th>
                                <th scope="col">Documento</th>
                                <th scope="col">---</th>
                                <th scope="col">---</th>
                                </tr>
                            </thead>
                        <?php foreach($array as $row){ ?>
                            <tbody>
                                <tr>
                                <td><?php echo strtoupper($row['title']); ?></td>
                                <td><?php echo strtoupper($row['description']); ?></td>
                                <td><?php echo strtoupper($row['fecha_inicio']); ?></td>
                                <td><?php echo strtoupper($row['fecha_cierre']); ?></td>
                                <td><button onclick="modal2(<?php echo $row['id']; ?>)" class="btn btn-bapp" id="btnModal">Ver Archivo</button></td>
                                <td>
							      	<a href="seeExamen.php?id=<?php echo $row['id']; ?>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"></path>
									  <path fill-rule="evenodd" d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"></path>
									</svg></a>
							 </td>
                                <td>
                                    <button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar este examen?', 'app/Controllers/controllerDeleteExamen.php', <?php echo $priv; ?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg></button>
                                </td>
                                </tr>
                            </tbody>
                         <?php } ?>
                         </table>
                         <?php }else{ ?>
                         <div class="alert alert-warning">
                             No hay examenes agregados
                         </div>
                         
                         <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

   
    <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
        <form action="app/Controllers/ControllerAddExamen.php" method="POST" enctype="multipart/form-data">
        <div class="modal-body">
            
                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">Titulo</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Fecha Inicio</th>
                    <th scope="col">Fecha Cierre</th>
                    <th scope="col">Documento</th>
                    <th scope="col">---</th>
                    </tr>
                </thead>
                    <tbody>
                        <tr>
                        <td><input type="text" name="title" class="form-control" id="title" required></td>
                        <td><input type="text" name="description" class="form-control" required></td>
                        <td><input type="date" name="date" class="form-control" id="date" required></td>
                        <td><input type="date" name="date_end" class="form-control" id="date_end" required></td>
                        <td><input type="file" name="archivo" class="form-control" required></td>
                        <td><input name="btn" type="submit" class="btn btn-bapp btn-block" value="Guardar"></td>
                        </tr>
                    </tbody>
                    
                    </table>

        </div>
        </form>
        </div>
    </div>
    </div>
    <?php foreach($array as $row) { ?>
			<!--modal-->
			<div class="modal" tabindex="-1" id="modal<?php echo $row['id'];?>">
				<div class="modal-dialog">
					<div class="modal-content modal-lg">
						<div class="modal-header">
							<h5 class="modal-title">Documento: </h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						
						<div class="col-md-12">
							<iframe src="archivos/<?php echo $row['img']; ?>" style="width: 100%; height: 500px;"></iframe>
							<a href="archivos/<?php echo $row['img']; ?>" download="archivo.pdf" class="btn btn-block btn-success">Descargar</a>
						</div>
					</div>
				</div>
			</div>
		<?php }?>
		<script type="text/javascript">
			function modal2(numero_modal){
				//let m = $('#modal').val();
				$("#modal"+numero_modal).modal("show");
			}
		</script>
        <script>
        function modal(p){
            if(p == "1"){
                $("#modal").modal("show");
            }
            if(p == "3"){
                alert("Usted no tiene los permisos necesarios para hacer esta accion")
            }
           
        }
    </script>
    
<script src="http://oca.soporbapp.cl/js/delete.js%20"></script>

<?php include 'templates/footer.php'?>
