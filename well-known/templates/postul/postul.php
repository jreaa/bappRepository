<?php
include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$documentaria = json_decode(json_encode(DB::table('documentaria')->where('examen_achs','=', 'No realizado')->get()),True);
$lista_postulante = [];
foreach($documentaria as $row){
	array_push($lista_postulante, $row['id_postulante']);
}
$lista_p = [];
for ($i=0; $i < sizeof($lista_postulante) ; $i++) { 
	$p = json_decode(json_encode(DB::table('postulante')->where('id','=',$lista_postulante[$i])->get()),True);
	array_push($lista_p, $p);
}
$nombre_postulante = [];
foreach ($lista_p as $row => $value) {
	foreach ($value as $key) {
		array_push($nombre_postulante, $key['name']);
	}
}
if(!empty($nombre_postulante)){
?>

<label for="postulante">Selecione un cargo</label>
<select name="postulante" id="postulante" class="form-control" required="required" style="margin-bottom: 10px;">
<option value="0">Elegir opción</option>
<?php for ($i=0; $i < sizeof($nombre_postulante) ; $i++) {  ?>
<option value="<?php echo $nombre_postulante[$i];?>" id="AF"><?php echo $nombre_postulante[$i];?></option>
<?php } ?>
</select>
<?php }else{?>
<label>No hay postulante agregados en la base de datos</label>
<input type="text" placeholder="..."  class="form-control" readonly>
<?php }?>