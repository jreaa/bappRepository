<?php
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include ('templates/header.php');
include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$privi = $_SESSION['privileges'];
//read datas to table cargo_postular


$inductivo =json_decode (json_encode(DB::table('inductivo_resultado')->where('id_inductivo', $_GET['id'])->get()),True);

$induct = json_decode (json_encode(DB::table('inductivo')->where('id', $_GET['id'])->get()),True);

$comentarios = explode(",",trim(trim($inductivo[0]['comentario'],'"['), ']"'));
$preguntas = explode(",",trim(trim($induct[0]['comentario'],'"['), ']"'));

?>
<style>
    .table td, .table th {
        color: #777272!important;
    }
</style>


<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Inductivo</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>

<div class="card mt-5">
    <div class="card-header" style="font-size:1.2rem">
        Datos de entrevistas
    </div>
    <div clasS="card-body">
        <div class="col-md-6" style="font-size:1.2rem">
            <h3 style="font-size: 1.3rem;
    border-bottom: 1px solid #ccc;
    width: 90%;
    margin-bottom: 14px;">Datos Postulante: </h3>
            <?php foreach($inductivo as $i){ ?>
                Fecha real : <?=$i['fecha_real'];?>
                <br>
                Hora real: <?=$i['hora_real'];?>
            <?php } ?>
            
            
            <h3 style="font-size: 1.3rem;
    border-bottom: 1px solid #ccc;
    margin-top:50px;
    width: 90%;
    margin-bottom: 14px;">Datos Inductivo: </h3>
            <?php foreach($induct as $i){ ?>
                Fecha Estimada: <?=$i['fecha'];?>
                <br>
                Hora Estimada: <?=$i['hora'];?>
            <?php } ?>
            
        </div>
        <div class="col-md-6" style="border: 1px solid #ccc;padding: 10px;border-radius: 10px;">
            <?php for($i=0; $i<sizeof($comentarios); $i++) {?>
                    
                   <h4 style="font-size: 1.3rem;text-transform: capitalize;font-weight: 500;"><?=trim($preguntas[$i], '""')?></h4>
                   <p style="border: 1px solid #ccc;padding: 10px;border-radius: 10px;"><?=trim($comentarios[$i], '""')?></p>
                   
            <?php } ?>
        </div>
    </div>
</div>



 
<?php include 'templates/footer.php'?>
