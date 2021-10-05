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

$id_postulante = $_GET['id'];

$test = json_decode(json_encode(DB::table('formatodisc')->where('id_postulante','=',$id_postulante)->get()),True);
$user = json_decode(json_encode(DB::table('postulante')->where('id','=',$id_postulante)->get()),True);
?>

<div class="content mt-3">
	<div class="container">

		<div class="row">
		    
			<?php foreach ($user as $row) { ?>
				<div class="col-md-6">
					<div class="form-group">
						<label>Name</label>
						<input type="text" name="name" value="<?php echo $row['name'];?>" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>Rut</label>
						<input type="text" name="name" value="<?php echo $row['rut'];?>" class="form-control" readonly>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label>Apellido</label>
						<input type="text" name="name" value="<?php echo $row['lastname'];?>" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>Cargo a postular</label>
						<input type="text" name="name" value="<?php echo $row['cargo_postular'];?>" class="form-control" readonly>
					</div>
				</div>
			<?php } ?>
			</div>
					    
		<div>

			<div class="card">
			    
			    <div class="card-body">
			        <?php foreach($test as $row){?>
			        	    <a class="btn btn-bapp" style="float:right" href="Examenes.php?id=<?php echo $_GET['id']; ?>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                </svg></a>
			<h3 class="text-center mb-4">Resultados: Formato Disco</h3>
			<div class="row">
				<div class="col-md-3">
					<h4>Grupo 1</h4>
					<p><?php echo ucwords($row['g1']); ?></p>
					<hr>
					<h4>Grupo 2</h4>
					<p><?php echo ucwords($row['g2']); ?></p>
					<hr>
					<h4>Grupo 3</h4>
					<p><?php echo ucwords($row['g3']); ?></p>
					<hr>
					<h4>Grupo 4</h4>
					<p><?php echo ucwords($row['g4']); ?></p>
					<hr>
					<h4>Grupo 5</h4>
					<p><?php echo ucwords($row['g5']); ?></p>
					<hr>
					<h4>Grupo 6</h4>
					<p><?php echo ucwords($row['g6']); ?></p>
					<hr>
					<h4>Grupo 7</h4>
					<p><?php echo ucwords($row['g7']); ?></p>
					<hr>

				</div>
				<div class="col-md-3">
					<h4>Grupo 8</h4>
					<p><?php echo ucwords($row['g8']); ?></p>
					<hr>
					<h4>Grupo 9</h4>
					<p><?php echo ucwords($row['g9']); ?></p>
					<hr>
					<h4>Grupo 10</h4>
					<p><?php echo ucwords($row['g10']); ?></p>
					<hr>
					<h4>Grupo 11</h4>
					<p><?php echo ucwords($row['g11']); ?></p>
					<hr>
					<h4>Grupo 12</h4>
					<p><?php echo ucwords($row['g12']); ?></p>
					<hr>
					<h4>Grupo 13</h4>
					<p><?php echo ucwords($row['g13']); ?></p>
					<hr>
					<h4>Grupo 14</h4>
					<p><?php echo ucwords($row['g14']); ?></p>
					<hr>
				</div>
				<div class="col-md-3">
					<h4>Grupo 15</h4>
					<p><?php echo ucwords($row['g15']); ?></p>
					<hr>
					<h4>Grupo 16</h4>
					<p><?php echo ucwords($row['g16']); ?></p>
					<hr>
					<h4>Grupo 17</h4>
					<p><?php echo ucwords($row['g17']); ?></p>
					<hr>
					<h4>Grupo 18</h4>
					<p><?php echo ucwords($row['g18']); ?></p>
					<hr>
					<h4>Grupo 19</h4>
					<p><?php echo ucwords($row['g19']); ?></p>
					<hr>
					<h4>Grupo 20</h4>
					<p><?php echo ucwords($row['g20']); ?></p>
					<hr>
					<h4>Grupo 21</h4>
					<p><?php echo ucwords($row['g21']); ?></p>
					<hr>
				</div>
				<div class="col-md-3">
					<h4>Grupo 22</h4>
					<p><?php echo ucwords($row['g22']); ?></p>
					<hr>
					<h4>Grupo 23</h4>
					<p><?php echo ucwords($row['g23']); ?></p>
					<hr>
					<h4>Grupo 24</h4>
					<p><?php echo ucwords($row['g24']); ?></p>
					<hr>
					<h4>Grupo 25</h4>
					<p><?php echo ucwords($row['g25']); ?></p>
					<hr>
					<h4>Grupo 26</h4>
					<p><?php echo ucwords($row['g26']); ?></p>
					<hr>
					<h4>Grupo 27</h4>
					<p><?php echo ucwords($row['g27']); ?></p>
					<hr>
					<h4>Grupo 28</h4>
					<p><?php echo ucwords($row['g28']); ?></p>
					<hr>
				</div>
			</div>
			<?php } ?>
			    </div>
			</div>
		</div>
	</div>
</div>
