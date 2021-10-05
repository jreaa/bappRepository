<?php
include('../vendor/autoload.php');
include('../app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$postulante = DB::table('postulante')->select()->where("disponible","En Proceso" )->get();
$array = json_decode(json_encode($postulante), True);

if(!empty($array)){
?>

<label for="postulante">Selecione un postulante</label>
<select name="postulante" class="form-control" id="postulante"  required>
<option value="0">Elegir opcion</option>
<?php foreach($array as $row) { ?>
<option value="<?php echo $row['id'];?>" id="AF"><?php echo $row['name'];?></option>
<?php } ?>
</select>
<?php }else{?>
<label>No hay postulantes agregados en la base de datos</label>
<input type="text" placeholder="..." readonly>
<?php }?>