<?php 
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include('templates/header.php'); 
?>

<?php 
if(isset($_SESSION['t'])){ ?>
    <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['t'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
<span aria-hidden='true'>&times;</span>
</button></div><?php unset($_SESSION['t']);
 }?>

<main class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Entrevistas</h3>
						<div style="float:right;display:flex">
					    	<div class="dropdown">
    						  <a class="btn btn-link btn-block dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Filtrar por Entrevista
    						  </a>
    						  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    						    <button id="button" class="dropdown-item" value="layouts/Entrevista/Presencial.php" type="button">Presencial</button>
    						    <button id="button2" class="dropdown-item" value="layouts/Entrevista/Telefonica.php" type="button">Telefonica</button>
    						  </div>
    						</div>
    						<a style="float:right;padding-top:10px" class="btn btn-bapp" href="agendarCita.php">Nuevo</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>




<section class="mt-3">
	<div class="container">
		<div id="contenido">
					
		</div>
	</div>
</section>

<script type="text/javascript">
	//AJAX ENTREVISTAS
	$(document).ready(function(){
		$('#button').on('click',function(e){
			let button = $('#button').val();
			$.ajax({
				url: button,
				type:'GET',
				success: function(response){
					let template = 
					`<div>
						${response}
					</div>`;

					$('#contenido').html(template);
				}
			})
		})
		$('#button2').on('click',function(e){
			let button = $('#button2').val();
			$.ajax({
				url: button,
				type:'GET',
				success: function(response){
					let template = 
					`<div>
						${response}
					</div>`;

					$('#contenido').html(template);
				}
			})
		})
	})
</script>

<?php include('templates/footer.php');?>






















