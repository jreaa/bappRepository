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

$cargo_postular = json_decode(json_encode(DB::table('cargo_postular')->get()),True);

?>

<main class="mt-5">
	<div class="container">
		<div>
			<div class="row">
				<div class="col-lg-8 content">
				<a class="btn btn-bapp" style="float:right;padding: 10px;float: right;" href="index.php"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                </svg></a>
					<h2>¡Usted esta agregando una  nueva postulacion! </h2>
					<form class="form-group mt-3">
						<div class="form-row">
						    <div class="col">
						      <label for="senior">Sr</label>
							  <input name="senior" class="form-control" type="text" value="<?php echo ucwords($_SESSION['name']);?>" readonly>
						    </div>
						    <div class="col">
						      <label for="position">Puesto</label>
							  <input name="position" class="form-control" type="text" value="<?php echo ucwords($_SESSION['position']);?>" readonly>
						    </div>
						  </div>
						 <?php $fcha = date("Y-m-d");?>
						<label for="dataDay">Fecha de hoy</label>
						<input type="date" name="dateDay" class="form-control" value="<?php echo $fcha;?>" readonly>
					</form>
					<div class="container">
						<form class="form-group mt-5" id="formBody">
							<h3>¡Por favor ingrese los siguientes datos!</h3>
							    <?php 
                                if(isset($_SESSION['p'])){ ?>
                                    <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['p'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                                <span aria-hidden='true'>&times;</span>
                              </button></div><?php unset($_SESSION['p']);
                                 }?>

							<div class="mt-2" id="alerts"></div>
						  <div class="row">
						    <div class="col">
						      <label for="name">Nombre</label>
						      <input name="name" type="text" class="form-control" placeholder="Jhon" id="name" required>
						      <label for="rut">Rut</label>
						      <input name="rut" type="text" class="form-control" placeholder="12345678-9" id="rut" required pattern="[0-9]{1,2}.[0-9]{3}.[0-9]{3}-[0-9Kk]{1}">

						      <label for="inlineFormCustomSelect">Genero</label>
						      <select class="form-control" id="genere">
						        <option value = "0" selected>...</option>
						        <option value="hombre">Masculino</option>
						        <option value="mujer">Femenino</option>
						      </select>
						      <div class="row">
						          <div class="col-md-6">
						              <label for="address">Direccion</label>
            						  <input type="text" name="address"class="form-control" id="address">
            						
						          </div>
						           <div class="col-md-6">
						             <label for="city">Comuna</label>
							         <input type="text" name="city" id="city" class="form-control" required>
						          </div>
						      </div>
						        <?php include 'templates/countries.php'?>
						    
						    </div>


						    <div class="col">
						      <label for="last name">Apellido Paterno</label>
						      <input name="last name" id="lastname" type="text" class="form-control" placeholder="Doe" required>
						      <label for="date">Fecha de nacimiento</label>
						      <input type="date" name="date"class="form-control" id="date">
						      <label for="email">Email (Por favor seleccionar el check si desea notificar al usuario)</label>
						      <div class="row">
						          <div class="col-8">
						              <input type="email" name="email" class="form-control" id="email" placeholder="example@mail.com" require>
						          </div>
						          <div class="col-4">
						              <input type="checkbox"name="send_email" id="emailcheck" class="form-control" style="width: 30%;!important">
						          </div>
						      </div>
						      
						      
						      
						      <label for="phone">Telefono</label>
						       <div style="margin-bottom:0px!important" class="input-group ">
						        <div class="input-group-prepend">
						          <div class="input-group-text">+56</div>
						        </div>
						        <input type="tel" name="phone" class="form-control" placeholder="9999999" id="tel">
							   </div>
							   
                                <label for="nivele">Nivel de estudio</label>
							    <input type="text" name="nivele" id="nivele" class="form-control" required>

						    </div>

						  </div>

						  <!-- Button trigger modal -->
						  	<label>Cargo a postular</label>
						  	<select name="cargo_postular" id="cargo_postular" class="form-control" required>
						  	    <option value="0">...</option>
						  	    <?php foreach($cargo_postular as $row){?>
						  	        <option value="<?php echo $row['name'];?>"><?php echo $row['name'];?></option>
						  	    <?php } ?>
						  	</select>
						  	<!--input type="text" name="cargo_postular" id="cargo_postular" class="form-control" required >-->

						  	
							<button type="button" class="btn btn-bapp btn-block mt-5" id="btnModal">
							  Enviar
							</button>
						  
						</form>
					</div>
				</div>
				<div class="col-lg-4" style="background-image: url(img/postul2.jpg); background-repeat: no-repeat;background-size: cover;background-position-x:center;  ">
				</div>
			</div>
		</div>
	</div>
</main>



<!--modal-->
<div class="modal" tabindex="-1" id="modal1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">¿Los datos estan correctos?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" id="formSend" action="app/Controllers/addPostulante.php">
	      	<div class="modal-body">
	        <div class="row">
	        	<div class="col">
	        		<input type="hidden" name="writer" value="Jose Era" id="writer">
	        		<input type="hidden" name="date" value="<?php echo $fcha;?>" id="today">
	        		<input type="hidden" name="email_send" id="email_send" value="0">
	        		<h6>Nombre</h6>
	        		<input type="hidden" name="name" value="" id="nombre">
	        		<p id="n"></p>
	        		<h6>Rut</h6>
	        		<input type="hidden" name="rut" value="" id="rut_id" >
	        		<p id="r"></p>
	        		<h6>Genero</h6>
	        		<input type="hidden" name="genere" value="" id="genero">
	        		<p id="g"></p>
	        		<h6>Direccion</h6>
	        		<input type="hidden" name="address" value="" id="direccion">
	        		<p id="d"></p>
	        		<h6>Nacionalidad</h6>
	        		<input type="hidden" name="country" value="" id="pais">
	        		<p id="na"></p>
	        		<h6>Cargo a Postular</h6>
	        		<input type="hidden" name="cargo_postular" value="" id="cargo">
	        		<p id="cp"></p>
	        	</div>
	        	<div class="col">
	        		<h6>Apellido</h6>
	        		<input type="hidden" name="lastname" value="" id="apellido">
	        		<p id="l"></p>
	        		<h6>Fecha de nacimiento</h6>
	        		<input type="hidden" name="date_born" value="" id="fecha">
	        		<p id="da"></p>
	        		<h6>Email</h6>
	        		<input type="hidden" name="email" value="" id="correo">
	        		<p id="e"></p>
	        		<h6>Telefono</h6>
	        		<input type="hidden" name="phone" value="" id="telefono">
	        		<p id="t"></p>
	        		<h6>Comuna</h6>
	        		<input type="hidden" name="city" value="" id="ciudad">
	        		<p id="c"></p>
	        		
	        		<h6>Nivel Estudio</h6>
	        		<input type="hidden" name="nivel_estudio" value="" id="nivel_estudio">
	        		<p id="ne"></p>
	        	</div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
	        <button type="submit" name="btn" class="btn btn-bapp" id="btn">Si</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<!--<input type="submit" name="btn" class="btn btn-primary" >-->




 <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 <!--Scripts--->
 <script>
   $('#emailcheck').on('click', function(){
       if($('#emailcheck').is(":checked")){
           let email = document.getElementById("email_send")
           email.value = "1"
       }else{
           let email = document.getElementById("email_send")
           email.value = "0"
       }
   } ) 
    
    
</script>
    
 <script type="text/javascript" src="js/validate.js"></script>

 <script type="text/javascript" src="js/modalAddUser.js"></script>

<?php include 'templates/footer.php'?>
