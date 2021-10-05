<?php 
include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$cargo_postular = json_decode(json_encode(DB::table('cargo_postular')->select('id','name')->get()),True);

if(!empty($cargo_postular)){
?>

<label for="postulante">Selecione un cargo</label>
<select name="cargo_postular" id="cargo_postular" class="form-control" required="required" style="margin-bottom: 10px;">
<option value="0">Elegir opción</option>
<?php foreach($cargo_postular as $row) { ?>
<option value="<?php echo $row['name'];?>" id="AF"><?php echo $row['name'];?></option>
<?php } ?>
</select>
<?php }else{?>
<label>No hay cargos agregados en la base de datos</label>
<input type="text" placeholder="..."  class="form-control" readonly>
<?php }?>