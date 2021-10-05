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

$test = DB::table('examenes')->where('title', '=', $_GET['title'])->get();
$array = json_decode(json_encode($test), True);

foreach ($array as $row ) {
	$title = $row['title'];
	$id = $row['id'];
}

?>

<div class="mt-5">
	<div class="container">
		<div class="content">
		    <a class="btn btn-bapp" style="float:right" href="seeExamen.php?id=<?php echo $id ?>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                </svg></a>
			<div class="row">
				<div class="col-md-12">
					<form class="form-group" action="app/Controllers/addQuestion.php" method="post">
						<div class="mb-3">
							<div class="row">
							    
								<div class="col-md-6">
									<h3 class="mb-2">Test: <?php echo ucwords($title); ?></h3>
									<label for="question">Por favor ingrese la pregunta: </label>
									<input type="text" name="question" class="form-control">
									<input type="hidden" name="id" value="<?php echo $id; ?>">
									<input type="hidden" name="database" value="question2">
									
								</div>
								<div class="col-md-6" style="margin-top: 50px!important;">
								    <label>Seleccione un tipo de pregunta</label>
								    <select id="button" class="form-control">
								        <option value="0">...</option>
								        <option value="1">Seleccion Multiple</option>
								        <option value="2">Verdadero/Falso</option>
								    </select>

									<div id="question">

									</div>
								</div>
								
							</div>
						</div>
						<button class="btn btn-bapp btn-block" name="btn" id="btn" >Añadir</button>				
					</form>	
				</div>
			</div>
		</div>
	</div> 
</div>

<script type="text/javascript">
    $('#button').change(function(){
        let val = $('#button').val();
        if( val == "1"){
            	templates = 
		`
		<label>Respuestas: </label>
		<input type="hidden" name="0">
		<div style="display:flex">
		<label for="A">A: </label>
		<input type="radio" name="select" value="A" style="margin-top: 12px;margin-left: 10px;">
		</div>
		<input type="text" name="A" class="form-control" id="A">

		<div style="display:flex">
		<label for="B">B: </label>
		<input type="radio" name="select" value="B" style="margin-top: 12px;margin-left: 10px;">
		</div>

		<input type="text" name="B" class="form-control" id="B">

		<div style="display:flex">
		<label for="C">C: </label>
		<input type="radio" name="select" value="C" style="margin-top: 12px;margin-left: 10px;">
		</div>

		<input type="text" name="C" class="form-control" id="C">

		<div style="display:flex">
		<label for="D">D: </label>
		<input type="radio" name="select" value="D" style="margin-top: 12px;margin-left: 10px;">
		</div>
		<input type="text" name="D" class="form-control" id="D">

		`
		$('#question').html(templates)
        }
        if( val == "2" ){
            		templates = 
		`
		<label>Respuestas: </label>
		<input type="hidden" name="1">
		<div style="display:flex">
		<label for="verdadero">Verdadero: </label>
		<input type="radio" name="select" value="V" style="margin-top: 12px;margin-left: 10px;">
		</div>
		<input type="text" name="verdadero" class="form-control" id="V">

		<div style="display:flex">
		<label for="falso">Falso: </label>
		<input type="radio" name="select" value="F" style="margin-top: 12px;margin-left: 10px;">
		</div>
		<input type="text" name="falso" class="form-control" id="F">

		`
		$('#question').html(templates)

        }
        
    })
</script>




<?php include('templates/footer.php');?>