<?php 
include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

?>

<?php 
$postulantes = json_decode(json_encode(DB::table('postulante')->where('disponible', '=', 'Trabajando')->get()), True); ?>
<div class="mt-5">
	<div class="container">
		<div class="content">
			    
			    <div class="card">
			        <div class="card-header">
			            <h2 style="font-weight: bold" class="mb-3">Desvinculacion Personal</h2>
			        </div>
			        <div class="card-body">
			            <form method="post" action="app/Controllers/desvincular.php" enctype="multipart/form-data">
						<div class="form-group">
							<?php 
							if(!empty($postulantes)){
							?>
							<label for="postulante">Selecione un postulante</label>
							<select name="postulante" class="form-control" id="postulante" style="margin-bottom: 10px;" required>
								<option value="0">Elegir opción</option>
								<?php foreach($postulantes as $row) { ?>
									<option value="<?php echo $row['id'];?>" id="AF"><?php echo $row['name'].' '.$row['lastname'];?></option>
								<?php } ?>
							</select>
						<?php }else{?>
							<div class="alert alert-waring"> No hay postulantes agregados en la base de datos</div>
							
						<?php }?>
					</div>

					<div class="form-group">
						<label for="fecha">Fecha Termino de Relacion</label>	
						<input type="date" name="fecha" class="form-control" required>
					</div>


					<div class="form-group">
						<label for="motivo">Motivo</label>
						<textarea type="text" name="motivo" class="form-control" required></textarea>
					</div>

					<button class="mt-3 btn btn-block btn-bapp" name="btn" type="submit">Guardar</button>
				</form>
			        </div>
			    </div>

				
			</div>

	</div>
</div>
</div>