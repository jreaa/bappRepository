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

$test_achs = DB::table('test_achs')->select('id','title','description','date','date_end','title_file','status','id_postulante')->get();
$array = json_decode(json_encode($test_achs), True);


$usuarios = json_decode(json_encode(DB::table('postulante')->select()->get()), True);



$priv = $_SESSION['privileges'];

?>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Test Realizados por la ACHS</h3>
						<button  style="float:right;" class="btn btn-bapp" onclick="modal(<?php echo $priv; ?>)">Nuevo</button>
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
                        <table class="table">
                            <thead>
                                <tr>
                                  <th scope="col">#</th>
    						      <th scope="col">Title</th>
    						      <th scope="col">Fecha de inicio</th>
    						      <th scope="col">Fecha final</th>
    						      <th scope="col">Status</th>
    						      <th scope="col">Postulante</th>
    						      <th scope="col">--</th>
                                </tr>
                            </thead>
                        <?php foreach($array as $row){ ?>
                            <tbody>
                                <tr>
                                <th scope="row"><?php echo $row['id'];?></th>
							      <td><?php echo strtoupper($row['title']);?></td>
							      <td><?php echo strtoupper($row['date']);?></td>
							      <td><?php echo strtoupper($row['date_end']);?></td>
							      <td id="status"><?php echo strtoupper($row['status']);?></td>
							      <td><?php echo strtoupper($name." ".$lastname); ?></td>

                                <td>
                                    <button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar este usuario?', 'app/Controllers/controllerDeleteUser.php', <?php echo $priv; ?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg></button>
                                </td>
                                </tr>
                            </tbody>
                         <?php } ?>
                         </table>
                         <?php }else{ ?>
                         <div class="alert alert-warning">
                             No hay tests agregados
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
        <form action="app/Controllers/addTest.php" method="POST" enctype="multipart/form-data">
        <div class="modal-body">
            
                <table class="table">
                <div class="row">
                    <div class="col-sm-12">
                        <thead>
                            <tr>
                            <th scope="col">titulo</th>
                            <th scope="col">descripcion</th>
                            <th scope="col">fecha de inicio</th>
                            <th scope="col">fecha de cierre</th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td><input type="text" name="title" class="form-control" id="title" required></td>
                        <td><input name="type" class="form-control" id="type" required></td>
                        <td><input type="date" name="date" class="form-control" id="date" required></td>
                        <td><input type="date" name="date_end" class="form-control" id="date_end" required></td>
                        </tr>
                    </tbody>
                    </div>
                    <div class="col-sm-12">
                        <thead>
                            <tr>
                            <th scope="col">Adjuntar documento</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">---</th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td><input type="file" name="archivo" class="form-control" required></td>
                        <td><input type="number" name="precio" class="form-control" required></td>
                        
                        <td><select name="postulante" class="form-control" id="postulante"  required>
                                <option value="0">Elegir opcion</option>
                                <?php foreach($usuarios as $row) { ?>
                                <option value="<?php echo $row['id'];?>" id="AF"><?php echo $row['name'].' '.$row['lastname'];?></option>
                                <?php } ?>
                            </select></td>
                        
                        <td><button class="btn btn-bapp btn-block" name="btn_achs" id="btn" >Guardar</button></td>
                        </tr>
                    </tbody>
                    </div>
                </div>
                

            </table>

        </div>
        </form>
        </div>
    </div>
    </div>

<script>
$(document).ready(function(){
    $("#privileges").change(function(){
        let privileges = $("#privileges").val();
    
        if(privileges == "2"){
            $("#contenido").css("display", "block");
        }else{
            $("#contenido").css("display", "none");
        }
    })
})
</script>

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
    
<?php include('templates/footer.php');?>