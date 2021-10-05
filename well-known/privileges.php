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

$priv = $_SESSION['privileges'];

$privileges = DB::table('privileges')->select()->get();
$array = json_decode(json_encode($privileges), True);
?>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Privilegios</h3>
						<button  style="float:right;" class="btn btn-bapp" onclick="modal(<?php echo $priv; ?>)">Nuevo</button>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    
    <?php 
    if(isset($_SESSION['u'])){ ?>
        <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['u'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span>
  </button></div><?php unset($_SESSION['u']);
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
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Cargo</th>
                                <th scope="col">Privilegio</th>
                                <th scope="col">Usuario</th>
                                <th scope="col">---</th>
                                <th scope="col">---</th>
                                </tr>
                            </thead>
                        <?php foreach($array as $row){ ?>
                            <tbody>
                                <tr>
                                <td><?php echo strtoupper($row['name']); ?></td>
                                <td><?php echo strtoupper($row['lastname']); ?></td>
                                <td><?php echo strtoupper($row['position']); ?></td>
                                <?php 
                                    if($row['privileges'] == 1){
                                        $p = "ADMINISTRADOR";
                                    }elseif($row['privileges'] == 2){
                                        $p = "ENCARGADO";
                                    }elseif($row['privileges'] == 3){
                                        $p = "VISITANTE";
                                    }
                                ?>
                                <td><?php echo strtoupper($p); ?></td>
                                <td><?php echo strtoupper($row['usuario']); ?></td>
                                <td>
                                    <?php if($priv != 3){ ?>
							      	<a href="editPrivileges.php?id=<?php echo $row['id'];?>">
							      	<?php }else{ ?>
							      	<a href="#">
							      	<?php } ?>
							      	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
									</svg></a>
							      </td>
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
                             No hay usuarios agregados
                         </div>
                         
                         <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    
    <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        <form action="app/Controllers/ControllerAddUsers.php" method="POST">
        <div class="modal-body">
            
                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Cargo</th>
                    <th scope="col">Privilegio</th>
                    <th scope="col">Usuario</th>
                    <th scope="col">Contraseña</th>
                    <th scope="col">---</th>
                    </tr>
                </thead>
                    <tbody>
                        <tr>
                        <td><input class="form-control" name="name" required></td>
                        <td><input class="form-control" name="lastname" required></td>
                        <td><input class="form-control" name="position" required></td>
                        <td>
                            <select id="privileges" class="form-control" name="privileges" required>
                                <option value="0">...</option>
                                <option value="1">Administrador</option>
                                <option value="2">Encargado</option>
                                <option value="3">Visitante</option>
                            </select>
                        </td>
                        <td><input class="form-control" name="usuario" required></td>
                        <td><input type="password" class="form-control" name="password" required></td>
                        <td><input name="btn" type="submit" class="btn btn-bapp btn-block" value="Guardar"></td>
                        </tr>
                    </tbody>

                    
                    </table>

        </div>
        <div class="modal-footer">
            <div id="contenido" class="form-gruop" style="display:none">
                <label>Por favor seleccione los modulos de alcance</label><br>
                <label class="mr-2 ml-2">Recluting</label>
                <input type="checkbox" name="1">
                <label class="mr-2 ml-2">Formacion</label>
                <input type="checkbox" name="2">
                <label class="mr-2 ml-2">Prevencion y riesgo</label>
                <input type="checkbox" name="3">
                <label class="mr-2 ml-2">Gestion Persona</label>
                <input type="checkbox" name="4">
                <label class="mr-2 ml-2">Servicios Generales</label>
                <input type="checkbox" name="5">
                <label class="mr-2 ml-2">Relaciones Laborales</label>
                <input type="checkbox" name="6">
                <label class="mr-2 ml-2">Operaciones</label>
                <input type="checkbox" name="7">
            </div>
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