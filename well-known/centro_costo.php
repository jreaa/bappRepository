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

$cc = DB::table('centro_costo')->select()->get();
$array = json_decode(json_encode($cc), True);
?>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Centro de Costo</h3>
						<button  style="float:right;" class="btn btn-bapp" onclick="modal(<?php echo $priv; ?>)">Nuevo</button>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    
    <?php 
    if(isset($_SESSION['c'])){ ?>
        <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['c'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span>
  </button></div><?php unset($_SESSION['c']);
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
                                <th scope="col">Centro de Costo</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">---</th>
                                <th scope="col">---</th>
                                </tr>
                            </thead>
                        <?php foreach($array as $row){ ?>
                            <tbody>
                                <tr>
                                <td><?php echo strtoupper($row['cc']); ?></td>
                                <td><?php echo strtoupper($row['description']); ?></td>
                               
                                <td>
							      	<a  href="#" onclick="modal2(<?php echo $row['id']; ?>)">
							      	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
									</svg></a>
							      </td>
                                <td>
                                    <button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar este usuario?', 'app/Controllers/deleteCc.php', <?php echo $priv; ?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg></button>
                                </td>
                                </tr>
                            </tbody>
                         <?php } ?>
                         </table>
                         <?php }else{ ?>
                         <div class="alert alert-warning">
                             No hay centros de costos agregados
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
        <form action="app/Controllers/addCc.php" method="POST">
        <div class="modal-body">
            
                <table class="table">
                <thead>
                    <tr>
                      <th scope="col">Centro de Costo</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">---</th>
                    </tr>
                </thead>
                    <tbody>
                        <tr>
                        <td><input class="form-control" name="cc" required></td>
                        <td><input class="form-control" name="description" required></td>
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
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
                        <div class="modal-body">
                                  <form action="app/Controllers/updateCc.php" method="POST">
                                    <div class="modal-body">
                                        
                                            <table class="table">
                                            <thead>
                                                <tr>
                                                  <th scope="col">Centro de Costo</th>
                                                <th scope="col">Descripcion</th>
                                                <th scope="col">---</th>
                                                </tr>
                                            </thead>
                                                <tbody>
                                                    <tr>
                                                    <td><input class="form-control" name="cc" value="<?php echo $row['cc']?>" required></td>
                                                    <td><input class="form-control" name="description" value="<?php echo $row['description']?>" required></td>
                                                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                                    <td><input name="btn" type="submit" class="btn btn-bapp btn-block" value="Guardar"></td>
                                                    </tr>
                                                </tbody>
                            
                                                
                                                </table>
                            
                                    </div>
                                    </form>
                
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