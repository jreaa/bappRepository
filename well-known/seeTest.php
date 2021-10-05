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
$postulante = DB::table('postulante')->select('id','name')->get();
$array1 = json_decode(json_encode($postulante), True);

//test
$test = DB::table('test')
->where('id', '=', $_GET['id'])
->get();
$array = json_decode(json_encode($test), True);
foreach ($array as $row) {
	$title = $row['title'];
	$title_id = $row['id'];
}
//test
$question = DB::table('question')
->where('id_test', '=', $_GET['id'])
->get();
$array2 = json_decode(json_encode($question), True);



?>


<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="mb-3" style="display: flex; justify-content: space-between;">
				<h3>Test: <?php echo $title;?></h3>
				<form style="display:flex; float:right" class="form-group" action="app/Controllers/sendTest.php" method="POST">
					<input type="hidden" name="title_id" value="<?php echo $title_id;?>">
				
					    <label class="mr-2">Postulante: </label>
    					<select class="form-control mr-2" name="postulante" id="postulante">
    						<option value="0">...</option>
    					<?php foreach($array1 as $row){?>
    						<option value="<?php echo $row['id']; ?>"><?php echo $row['name'];?></option>
    					<?php }?>
    					</select>
    					<button class="btn btn-bapp" name="btn" id="btn">Enviar</button>
				</form>
					
				<a class="btn btn-bapp" style="float:right" href="test.php"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                </svg></a>
			</div>
			
				<a href="Question.php?title=<?php echo $title;?>"><svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-plus-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
				</svg></a>
				
				<?php foreach($array2 as $row){?>
				
                    <div class="card mt-3">
                        <div class="card-body">
                            <div class="row">
                            <div class="col-md-6">
        						<h4>
        							Pregunta: <?php echo ucwords($row['question'])?>
        						</h4>
        
        					</div>
        					<div class="col-md-6">
        						<h4>Respuesta: </h4>
        						<p><span style="color: green">Respuesta correcta: <?php echo $row['correct_answer']?></span></p>
        						<?php if ($row['answer3'] == "") { ?>
        							<p>Verdadero: <?php echo $row['answer1'];?></p>
        							<p>Falso: <?php echo $row['answer2'];?></p>
        						<?php }else{ ?>
        							<p>A: <?php echo $row['answer1'];?></p>
        							<p>B: <?php echo $row['answer2'];?></p>
        							<p>C: <?php echo $row['answer3'];?></p>
        							<p>D: <?php echo $row['answer4'];?></p>
        						<?php } ?>
        					</div>
                        </div>
                    </div>
				</div>
			<?php } ?>
		</div>
	</div>
</div>

<?php include 'templates/footer.php'?>
