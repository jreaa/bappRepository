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



//statuentrevista
$sentrevista = DB::table('status_entrevista')->where('id', '=', $_GET['id'])->get();
$arraysEntrevista = json_decode(json_encode($sentrevista), True);

foreach($arraysEntrevista as $r){
    $id_e = $r['id_entrevista'];
    $id_comments = $r['id'];
}


//entrevista
$entrevista = DB::table('tblcita_presencial')->where('id', '=', $id_e)->get();
$arrayEntrevista = json_decode(json_encode($entrevista), True);

foreach($arrayEntrevista as $r){
    $id_postulante = $r['id_postulante'];
}

//postulante
$postulante = DB::table('postulante')->where('id', '=',$id_postulante)->get();
$array = json_decode(json_encode($postulante), True);

?>
<style type="text/css">
	input{
		margin-bottom: 10px;
	}
</style>

<section class="mt-5">
	<div class="container">
		<div class="content">
			    <a class="btn btn-bapp" style="float:right" href="resultados.php"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                </svg></a>
                 
    

                
				<h3 class="mb-4">Datos Postulante</h3>
				

				<div class="row ">
					<?php foreach ($array as $row ) {?>	
					<input type="hidden" name="id_postulante" value="<?php echo $row['id'];?>">
					<div class="col-md-6" >
						<input type="text" name="name" value="<?php echo $row['name'];?>"class="form-control" readonly>
						<input type="text" name="rut" class="form-control" value="<?php echo $row['rut'];?>" readonly>
					</div>
					<div class="col-md-6">
						<input type="text" name="lastname"value="<?php echo $row['lastname']; ?>" class="form-control" readonly>
						<input type="text" name="cargo" value="<?php echo $row['cargo_postular']; ?>"class="form-control" readonly>
					</div>
					<?php }?>
				</div>

				<?php foreach($arrayEntrevista as $row) {?>
				<input type="hidden" name="id" value="<?php echo $row['id'];?>">
				<input type="hidden" name="db" value="0">
				
				
				<div class="card">
				    <div class="card-body">
				        <h4>Datos de la entrevista: <?php echo $row['id'];?></h4>
        				<label>Fecha de la entrevista</label>
        				<input type="date" class="form-control"value="<?php echo $row['date'];?>" readonly>
        				<label>Status</label>
        				<input type="status"class="form-control" value="<?php echo $row['status'];?>" readonly>
                            
                        <h3>Comentarios: </h3>
                        <div class="card">
                            <div class="card-body">
                                <?php 
                                $comment = DB::table('comentarios_entrevista')->where('id_status_entrevista', '=', $id_comments )->get();
                                $arraycomment = json_decode(json_encode($comment), True);
                                
                                $i = 1;
                                foreach($arraycomment as $r):
                                    
                                ?>
                                <?=$i;?>.- <span> <?= $r['comentario']; ?> </span> <br>
                                <?php $i = $i + 1;?>
                                <?php endforeach; ?>
                            </div>
                        </div>

        				<?php }?>
        				                        
                <form class="mt-3" action="app/Controllers/comentarioPresencial.php" method="POST">
                        <h3>Agregar un nuevo comentario</h3>
        				<textarea cols="5" name="comentario" class="form-control"></textarea>
        				<input type="hidden" name="id_entrevista" value="<?=$id_comments;?>">
        				<button type="sumbit" name="btn" class="btn btn-bapp btn-block mt-2">Enviar</button>
        	    </form>
				    </div>
				</div>
				
		
		</div>
	</div>
</section>

<?php include 'templates/footer.php'?>
