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

//postulante
$postulante = DB::table('postulante')->where('id', '=',$_GET['id_postulante'])->get();
$array = json_decode(json_encode($postulante), True);

//entrevista
$entrevista = DB::table('tblcita_presencial')->where('id', '=', $_GET['id'])->get();
$arrayEntrevista = json_decode(json_encode($entrevista), True);
?>
<style type="text/css">
	input{
		margin-bottom: 10px;
	}
</style>

<section class="mt-5">
	<div class="container">
		<div class="content">
			<form method="POST" action="app/Controllers/EnviarResultados.php">
			    <a class="btn btn-bapp" style="float:right" href="resultados.php"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                </svg></a>
                 
    

                
				<h3 class="mb-4">Datos Postulante</h3>
				
				<?php 
                    if(isset($_SESSION['p'])): ?>
                        <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['u'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                    <span aria-hidden='true'>&times;</span>
                  </button></div><?php unset($_SESSION['p']);
                     endif; ?>
                     
				<div class="row ">
					<?php foreach ($array as $row ) {?>	
					<input type="hidden" name="id_postulante" value="<?php echo $row['id'];?>">
					<div class="col-md-6" >
						<input type="text" name="name" value="<?php echo $row['name'];?>"class="form-control" readonly>
						<input type="text" name="rut" class="form-control" value="<?php echo $row['rut'];?>" readonly>
					</div>
					<div class="col-md-6">
						<input type="text" name="lastname"value="<?php echo $row['lastname']; ?>" class="form-control" readonly>
						<input type="text" name="cargo" value="<?php echo $row['cargo_postular']; ?>"class="form-control" readonly>
					</div>
					<?php }?>
				</div>

				<?php foreach($arrayEntrevista as $row) {?>
				<input type="hidden" name="id" value="<?php echo $row['id'];?>">
				<input type="hidden" name="db" value="0">
				
				
				<div class="card">
				    <div class="card-body">
				        <h4>Usted esta calificando la siguiente entrevista: <?php echo $row['id'];?></h4>
        				<label>Fecha de la entrevista</label>
        				<input type="date" class="form-control" value="<?php echo $row['date'];?>" readonly>
        				<label>Status</label>
        				<input type="status"class="form-control" value="<?php echo $row['status'];?>" readonly>
        
        				<label for="status_participant">Status del participante</label>
        				<select class="form-control" name="status" id="status_participant">
        				    <?php 
                               $postulante = json_decode(json_encode(DB::table('postulante')->select('disponible')->where('id', $row['id_postulante'])->get()),True);
                              
                                if($postulante[0]['disponible'] == 'Activo') {
                            ?>
                            <option value="1" selected>Aceptado</option>
                            <?php }elseif($postulante[0]['disponible'] == 'Rechazado'){ ?>
                            <option value="2" selected>Rechazado</option>
                            <?php } ?>
        					<option value="0">..</option>
        					<option value="1">Aceptado</option>
        					<option value="2">Rechazado</option>
        				</select>
        				<label for="comentario">Comentarios para el participante</label>
        				<textarea cols="5" name="comentario" class="form-control">
        				    <?=$row['comentario'];?>
        				</textarea>
        				<label>Fecha de ingreso (Si el postulante no fue aceptado por favor dejar el campo vacio)</label>
        				<input type="date" name="date" class="form-control" id="date" value="<?=$row['start_date']?>">
        				<label for="comentario_add">Comentarios sobe el participante</label>
        				<textarea cols="5" name="comentario_add" class="mb-5 form-control"></textarea>
        				<?php }?>
        				<button type="sumbit" name="btn" class="btn btn-bapp btn-block">Enviar</button>
				    </div>
				</div>
				
			</form>
		</div>
	</div>
</section>

<script type="text/javascript">
	function rejectit(valor){
		valor.readonly = true;
	}

	let status = document.getElementById('status_participant');
	let date = document.getElementById('date');
	if (status.value == 'reject') {
		rejectit(date)
	}
</script>
<?php include 'templates/footer.php'?>
