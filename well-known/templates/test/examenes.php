<?php 
include('../../vendor/autoload.php');
include('../../app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$examenes = json_decode(json_encode(DB::table('examenes')->select('id','title')->get()),True);

if(!empty($examenes)){
?>
<input type="hidden" name="examen" value="SI">
<label for="examen">Selecione un examen</label>
<select name="id_examen" id="examen" class="form-control" required="required" style="margin-bottom: 10px;">
<option value="0">Elegir opción</option>
<?php foreach($examenes as $row) { ?>
<option value="<?php echo $row['id'];?>" id="AF"><?php echo $row['title'];?></option>
<?php } ?>
</select>
<?php }else{?>
<div class="alert alert-warning">
	No hay cargos agregados en la base de datos
</div>
<?php }?>