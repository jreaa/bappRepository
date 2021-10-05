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

$test = DB::table('test')->select('id','title','description','date','date_end')->get();
$array = json_decode(json_encode($test), True);


if(!empty($array)){
?>

<main class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Pruebas</h3>
						<button  style="float:right;" class="btn btn-bapp" onclick="modal(<?php echo $privi; ?>)">Nuevo</button>
					</div>
				</div>
			</div>
		</div>
	</div>
        <?php 
    if(isset($_SESSION['t'])){ ?>
        <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['t'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span>
  </button></div><?php unset($_SESSION['t']);
     }?>
	<section class="mt-3">
		<div class="container">
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-hover">

							  <thead class="mt-5">
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">Titulo</th>
							      <th scope="col">Descipcion</th>
							      <th scope="col">Fecha de inicio</th>
							      <th scope="col">Fecha Final</th>
							      <th scope="col">--</th>
							      <th scope="col">--</th>
							    </tr>
							  </thead>

							  <?php
								foreach($array as $row) {
								?>

							  <tbody>
							    <tr>
							      <th scope="row"><?php echo $row['id'];?></th>
							      <td><?php echo $row['title'];?></td>
							      <td><?php echo $row['description'];?></td>
							      <td><?php echo $row['date'];?></td>
							      <td><?php echo $row['date_end'];?></td>
							      <td>
							      	<a href="seeTest.php?id=<?php echo $row['id'];?>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
									  <path fill-rule="evenodd" d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
									</svg></a>
							      </td>
							      <td>
									 <button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar este test?', 'app/Controllers/controllerDeleteTest.php',<?php echo $privi;?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg></button>
							      </td>
							    </tr>
							  </tbody>
							  <?php } ?>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
  <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

        <div class="modal-body">
            <form method="POST" action="app/Controllers/addTest.php" >
                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">Titulo</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Fecha incio</th>
                    <th scope="col">Fecha Cierre</th>
                    <th scope="col">---</th>
                    </tr>
                </thead>
                    <tbody>
                        <tr>
                        <td><input type="text" name="title" class="form-control" id="title"></td>
                        <td><input type="text" name="description" class="form-control" id="description"></td>
                        <td><input type="date" name="date" class="form-control" id="date"></td>
                        <td><input type="date" name="date_end" class="form-control" id="date_end"></td>
                        <td><button class="btn btn-bapp btn-block" name="createTest" id="btn" >Añadir</button></td>
                        </tr>
                    </tbody>
                    </table>
                    
           
        </div>
        <div id="contenido" class="model-footer" style="display:none;padding:20px">
            <?php 
                $examenes = json_decode(json_encode(DB::table('examenes')->select('id','title')->get()),True);
                
                if(!empty($examenes)){
                ?>
                <label for="examen">Selecione un examen</label>
                <select name="id_examen" id="examen" class="form-control" required="required" style="margin-bottom: 10px;">
                <option value="0">Elegir opcion</option>
                <?php foreach($examenes as $row) { ?>
                <option value="<?php echo $row['id'];?>" id="AF"><?php echo $row['title'];?></option>
                <?php } ?>
                </select>
                <?php }else{?>
                <div class="alert alert-warning">
                	No hay cargos agregados en la base de datos
                </div>
                <?php }?>
        </div>
         </form>
        </div>
    </div>
    </div>
    
    <script src="http://oca.soporbapp.cl/js/delete.js%20"></script>

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


    
<?php }else{ ?>
<div class="container">
  <div id="content" class="alert alert-warning text-center">
        No hay tests agregados...
  </div>
</div>
<?php } ?>




















<?php include('templates/footer.php');?>