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

$postulante = DB::table('postulante')
->where('id', '=', $_GET['id'])
->get();
$array = json_decode(json_encode($postulante), True);

$test_postulante = DB::table('test_postulante')
->where('id_postulante', '=', $_GET['id'])
->get();
$array2 = json_decode(json_encode($test_postulante), True);

foreach ($array as $row) {
	$name = $row['name'];
	$lastname = $row['lastname'];
}

$test_achs = DB::table('test_achs')
->where('id_postulante', '=', $_GET['id'])
->get();
$array3 = json_decode(json_encode($test_achs), True);

$test_user = json_decode(json_encode(DB::table('formatodisc')->where('id_postulante', '=', $_GET['id'])->get()),True);
?>

<div class="content mt-3 mb-3">
	<div class="container">
		<div class="row">
		    
			<div class="col-md-6">
				<div class="form-group">
					<label for="name">Nombre: </label>
					<input type="text" name="name" class="form-control" value="<?php echo $name; ?>" readonly>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="lastname">Apellido: </label>
					<input type="text" name="lastname" class="form-control" value="<?php echo $lastname; ?>" readonly>
				</div>
			</div>
		</div>
	</div>
</div>

<a class="btn btn-bapp mt-2" style="float:right" href="editarPostulante.php?id=<?php echo $_GET['id']; ?>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                </svg></a>
<section class="content">
	<div class="container">
	    <!--
		<?php //if(empty($array2)){?>
		    
			<h3>Examenes Bapp</h3>
			<div class="alert alert-warning">
				Este Usuario no posee examenes aun...
			</div>
			<a class="btn btn-success" href="test.php">Desea añadir uno nuevo ?</a>
			<hr>
		<?php //}else{

			/*foreach($array2 as $row){ 
				$id_test = $row['id_test'];
			} 
			$test = json_decode(json_encode(DB::table('test')->where('id', '=',$id_test)->get()), True);
			foreach ($test as $row) { */?>	

			<div class="table-responsive">
				<h3>Examenes Bapp</h3>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Title</th>
							<th>Descripcion</th>
							<th>#</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th><?php echo $row['title'];?></th>
							<th><?php echo $row['description'];?></th>
							<th><a href="" class="btn btn-block btn-bapp">Resultados</a></th>	
						</tr>
					</tbody>
				</table>
			</div>
			<hr>
		<?php //} }?>	
		
		<?php// if(empty($array3)){?>
			<h3 class="mt-3">Examenes ACHS</h3>
			<div class="alert alert-warning">
				Este Usuario no posee examenes de la ACHS aun...
			</div>
			<a class="btn btn-success" href="test.php">Desea añadir uno nuevo ?</a>
			<hr>
		<?php /*}else{ 
			foreach($array3 as $row){ */?>	
			<div class="table-responsive">
				<h3 class="mt-3">Examenes ACHS</h3>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Title</th>
							<th>Descripcion</th>
							<th>#</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th><?php echo $row['title'];?></th>
							<th><?php echo $row['description'];?></th>
							<th><a href="" class="btn btn-block btn-bapp">Resultados</a></th>	
						</tr>
					</tbody>
				</table>
			</div>
			<hr>
		<?php //} }?>	
    <!---->
		<?php if(empty($test_user)){?>
			<h3 class="mt-3">Examenes Formativos</h3>
			<div class="alert alert-warning">
				Este Usuario no posee examenes de la formativos aun...
			</div>
			<a class="btn btn-success" href="agendarCita.php">Desea añadir uno nuevo ?</a>
			<hr>
		<?php }else{ ?>
			<div class="table-responsive">
				<h3 class="mt-3">Examenes Formativo</h3>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Id Postulante</th>
							<th>Descripcion</th>
							<th>#</th>
						</tr>
					</thead>
					<tbody>
					    <?php foreach($test_user as $row){ ?>	
						<tr>
							<th><?php echo $row['id_postulante'];?></th>
							<th>Formato Disco</th>
							<th><a href="ResultadosFormatoDisco.php?id=<?php echo $row['id_postulante'];?>" class="btn btn-block btn-bapp">Resultados</a></th>	
						</tr>
								<?php } }?>	
					</tbody>
				</table>
			</div>
			<hr>

	</div>
</section>
<?php include('templates/footer.php');?>