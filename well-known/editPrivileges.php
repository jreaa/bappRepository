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

$privileges = DB::table('privileges')
->where('id', '=', $_GET['id'])
->get();
$array = json_decode(json_encode($privileges), True);

?>

<style type="text/css">
	.sideA{
		font-size: 15px;
		color: #007bff;
	}
</style>
<section class="mt-5">
	<div class="container">
	        <?php 
                if(isset($_SESSION['u'])){ ?>
                    <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['u'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                <span aria-hidden='true'>&times;</span>
              </button></div><?php unset($_SESSION['u']);
                 }?>
		<div class="content">

			<?php
			foreach ($array as $row) {
				?>
			<form action="app/Controllers/controllerUpdateUser.php" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-4">
					    
					        <?php 
					        
					        $nperson = $row['name']." ".$row['lastname'];
					        ?>
							<h3><?php echo ucwords($nperson);?></h3>
							
							
							<img src="archivos/<?php echo $row['img'];?>" class="float-left img_profile_bapp" alt="..." width="250">
						<div class="form-group">
							<label class="mt-2" for="img">Cambiar la foto</label>
							<input type="file" name="img" placeholder="Cambiar la foto" class="form-control">
						</div>
					</div>

					<div class="col-md-8">
					    <a class="btn btn-bapp" style="float:right" href="privileges.php"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                        </svg></a>
						<div class="title" style="font-size: 20px">
							Detalle del Usuario
						</div>
						
							<div class="row mt-3">
								<div class="col-md-6">
									<div class="form-group">
										<input type="hidden" name="id" value="<?php echo $_GET['id'];?>">
										<label for="name">Nombre</label>
										<input type="text" name="name" class="form-control" value="<?php echo $row['name'];?>">
									</div>
									<div class="form-group">
										<label for="position">Cargo</label>
										<input type="text" name="position" class="form-control" value="<?php echo $row['position'];?>">
									</div>
									<div class="form-group">
										<label for="position">Usuario</label>
										<input type="text" name="usuario" class="form-control" value="<?php echo $row['usuario'];?>">
									</div>
					
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="last name">Apellido</label>
										<input name="lastname" id="lastname" type="text" class="form-control" placeholder="Doe" value="<?php echo $row['lastname'];?>" required>
									</div>
									<div class="form-group">
										<label for="date">Privilegio</label>
										<?php 
                                            if($row['privileges'] == 1){
                                                $p = "ADMINISTRADOR";
                                            }elseif($row['privileges'] == 2){
                                                $p = "ENCARGADO";
                                            }elseif($row['privileges'] == 3){
                                                $p = "VISITANTE";
                                            }
                                        ?>
                                        <?php if($row['privileges'] != 1){ ?>
            							<select id="privileges"class="form-control" name="privileges" required disabled>
            							<?php }else{ ?>
            						    <select id="privileges"class="form-control" name="privileges" required>
            						    <?php } ?>
                                            <option value="<?php echo $row['privileges']; ?>">Seleccionado: <?php echo $p ?></option>
                                            
                                            <option value="1">Administrador</option>
                                            <option value="2">Encargado</option>
                                            <option value="3">Visitante</option>
                                        </select>
									</div>
									<div class="form-group">
										<label for="email">Cambio Contraseña</label>
										<input type="password" placeholder="*******" class="form-control" name="password" >
									</div>
									
								</div>

							</div>
							<div class="container">
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
							<button type="submit" name="btn" class="btn btn-bapp btn-block mt-3" data-toggle="modal" data-target="#staticBackdrop">
								Enviar
							</button>
						</form>
					</div>
				</div>
			<?php }?>
		</div>
	</div>
</section>

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



<?php include 'templates/footer.php'?>