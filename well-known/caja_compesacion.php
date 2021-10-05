<?php
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include 'templates/header.php'; 
include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;
$c = json_decode(json_encode(DB::table('caja_compesacion')->get()),True);
?>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<form class="form-group" action="app/Controllers/caja_compesacion.php" method="post" enctype="multipart/form-data">
						<div class="mb-3">
						    
						    <div class="card">
						        <div class="card-header">
						            <h3 class="text-center mb-2">¡Caja Compesacion!</h3>
							
						        </div>
						        <div class="card-body">
						            							<div class="row">
								<div class="col-md-6">
									<hr>
									<h4 class="text-center">Informacion de la empresa</h4>
									<hr>
									<div class="form-group">
										<label for="name">Nombre:</label>
										<input type="text" name="name" class="form-control" required>
									</div>
									<div class="form-group">
										<label for="nfantasia">Nombre de fantasia: </label>
										<input type="text" name="nfantasia" class="form-control" id="patente" required>									</div>
										<div class="form-group">
											<label for="rubro">Rubro: </label>
											<input type="text" name="rubro" class="form-control" id="patente" required>
										</div>
										<div class="form-group">
											<label for="rut">Rut: </label>
											<input type="text" name="rut" class="form-control" required>
										</div>
										<div class="form-group">
											<label for="activity">Actividad:</label>
											<input type="text" name="activity" class="form-control" required>
										</div>
									</div>

									<div class="col-md-6">
										<hr>
										<h4 class="text-center">Informacion del convenio</h4>
										<hr>
										<div class="form-group">
											<label for="nconvenio">Nombre: </label>
											<input type="text" name="nconvenio"class="form-control" required>
										</div>
										<div class="form-group">
											<label class="archivo">Imagen: </label>
											<input type="file" name="archivo" class="form-control" required>

										</div>
										<div class="form-group">
											<label class="t_convenio">Tipo de convenio: </label>
											<input type="text" name="t_convenio" class="form-control" required>
										</div>
										<div class="form-group">
											<label for="about">Informacion del convenio: </label>
											<textarea name="about" class="form-control" required></textarea>
										</div>
									</div>
								</div>
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
	<?php if(!empty($c)){?>
		<div class="container">
			<h4 class="text-center mt-3 mb-3">Caja Compesasion</h4>
			<div class="brand">
				<?php foreach($c as $row): ?>
					<div class="item"><a href="#"><img width="400" height="200" style="width: 100%" src="archivos/<?php echo $row['archivo'];?>"></a></div>
				<?php endforeach ?>
			</div>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous"></script>

		<script type="text/javascript">
			$('.brand').slick({
				slidesToShow:5,
				slidesToScroll:1,
				dots:false,
				arrows:true,
				autoplay:true,
				autoplaySpeed: 2000,
				infinite: true 
			})
		</script>
	<?php } ?>


	<?php include 'templates/footer.php' ?>