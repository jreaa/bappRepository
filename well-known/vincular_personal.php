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

$doc = json_decode(json_encode(DB::table('documentaria')->get()), True);
$mensaje = 'el usuario necesita entregar: ';
$p = [];
foreach ($doc as $row) {
	if ($row['cedula_front'] != 'default.png' && $row['cedula_back'] != 'default.png' && $row['antecedentes'] != 'default.png' && $row['comprobante_domicilio'] != 'default.png' && $row['AFP'] != 'default.png' && $row['certificado_salud'] != 'default.png' &&  $row['finiquito'] != 'default.png' && $row['CV'] != 'default.png') {
		array_push($p,$row['id_postulante']);
	}
}



?>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<form action="app/Controllers/vincular_personal.php" method="post" enctype="multipart/form-data">
						<div class="mb-3">
						    <div class="card">
						        <div class="card-header">
						            <h3 class="mb-2">¡	
						            	Vincular personal activo</h3>
						            
						        </div>
						        <div class="card-body">
						            						    
							<div class="form-gruop">
								<?php if(!empty($p)){?>
								<label for="postulante">Seleccionar un postulante</label>
								<select name="postulante" class="form-control" id="postulante" style="margin-bottom: 10px;" required>
									<option value="0">Elegir opción</option>
									<?php 
									for ($i=0; $i < sizeof($p) ; $i++) { 
										$postulante = json_decode(json_encode(DB::table('postulante')->where('id', '=', $p[$i])->get()), True);
										foreach ($postulante as $row) { ?>
											<option value="<?php echo $row['id'] ?>"><?php echo $row['name'];?></option>
										<?php }
									}
									?>
								</select>
								<?php }else{ ?>
									<div class="alert alert-warning">
										No hay usuarios disponibles
									</div>
									<input id="test" value="0" type="hidden">
								<?php }?>
							</div>
						
							<div class="form-gruop">
								<label for="trato">Tipo de trato: </label>
								<select name="trato" class="form-control" id="trato" style="margin-bottom: 10px;" required>
									<option value="0">Elegir Opcion</option>
									<option value="boleta">Boleta de honorario</option>
									<option value="fijo">Contrato Fijo</option>
									<option value="indefinido">Contrato Indefinido</option>
								</select>
							</div>
							<div class="form-gruop">
								<label for="hora">Modalidad de Hora: </label>
								<select name="hora" class="form-control" id="hora" style="margin-bottom: 10px;" required>
									<option value="0">Elegir Opcion</option>
									<option value="20Hrs">20Hrs</option>
									<option value="20Hrs">30Hrs</option>
									<option value="20Hrs">40Hrs</option>
									<option value="20Hrs">45Hrs</option>
								</select>
							</div>
							<div class="form-gruop">
								<div class="row">
									<div class="col-md-6">
										<label for="fecha_inicio">Fecha de inicio: </label>
										<input type="date" name="fecha_inicio" class="form-control" required>
									</div>
									<div class="col-md-6">
										<label for="fecha_cierre">Fecha de cierre: </label>
										<input type="date" name="fecha_cierre" class="form-control" required>
									</div>
								</div>	
							</div>
							<hr>
							<div class="form-gruop">
								<label>Adjuntar Documento: </label>
								<input type="file" name="archivo" class="form-control" required>
							</div>
							<hr>
						
        						<button class="btn btn-bapp btn-block" name="btn" id="btn" >Añadir</button>
        						</div>
							
						        </div>
						    </div>
			
					</form>	
				</div>
			</div>
		</div>
	</div> 
</div>

<script>
    $(document).ready(function(){
        let t = $("#test").val()
        if(t == 0){
            $("#btn").click(function(e){
                e.preventDefault;
                alert("No hay usuarios disponibles...");
            })
        }
    })
</script>



<?php include('templates/footer.php');?>