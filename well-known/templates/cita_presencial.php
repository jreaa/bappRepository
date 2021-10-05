<div id="alerts"></div>
<form id="form" action="app/Controller/addCita.php" method="POST">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
			    <div class="form-gruop">
			        <label for="date">Fecha de la cita</label>
				    <input type="date" name="date" class="form-control" id="date" required>
			    </div>
			    <div class="form-gruop">
			        <label for="date">Hora de la cita</label>
				    <input type="time" name="date" class="form-control" id="time" required>
			    </div>
			    <div class="form-gruop">
			        <label for="place">Lugar</label>
				    <input type="text" name="place" class="form-control" id="place" required>
			    </div>
			</div>
			<div class="col-sm-6">
			    <div class="form-gruop">
			        <?php if (isset($_GET['name'])) { ?>
    					<input id="NombrePostulante" type="text" value="<?php echo $_GET['name'];?>" class="form-control" readonly>
    					<input id="postulante" type="hidden" name="postulante" value="<?php echo $_GET['id'];?>" class="form-control" readonly>
    				<?php }else{ 
    					include('postulantes_lista2.php');
    				}?>
			    </div>
				
				<div class="form-gruop">
    				<label for="link">Link</label>
    				<select name="link" class="form-control" id="link" required>
    					<option value="0">...</option>
    					<option value="FormatoDisc">Formato Disc</option>
    				</select>
			    </div>
				
				<div class="form-gruop">
			        <label>Mensaje(opcional)</label>
				    <textarea name="message" class="form-control" rows="5" id="message"></textarea>
			    </div>
			
			</div>
		</div>
		<button type="button" class="btn btn-bapp btn-block mt-5" id="btnModal">
		  Enviar
		</button>
	</div>

</form>
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
      <form method="post" id="formSend" action="app/Controllers/addCitaPresencial.php">
	      	<div class="modal-body">
	        <div class="row">
	        	<div class="col">
	        		<input type="hidden" name="writer" value="Jose Era" id="writer">
	        		<?php $fcha = date("Y-m-d");?>
	        		<input type="hidden" name="date" value="<?php echo $fcha;?>" id="today">
	        		<h6>Fecha</h6>
	        		<input type="hidden" name="date_cita" value="" id="fecha">
	        		<p id="d"></p>
	        		<h6>Hora</h6>
	        		<input type="hidden" name="time_cita" value="" id="hora">
	        		<p id="t"></p>
	        		<h6>Lugar</h6>
	        		<input type="hidden" name="place_cita" value="" id="lugar">
	        		<p id="p"></p>
	        	</div>
	        	<div class="col">
	        		<h6>Postulante</h6>
	        		<input type="hidden" name="person" value="" id="person">
	        		<p id="post"></p>
	        		<h6>Link</h6>
	        		<input type="hidden" name="link" value="" id="enlace">
	        		<p id="e"></p>
	           		<h6>Mensaje</h6>
	        		<input type="hidden" name="message" value="" id="mensaje">
	        		<p id="m"></p>
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
<script type="text/javascript" src="js/modalCitaPresencial.js"></script>
<?php if(!isset($_GET)){?>
<script>
    $(function(){
      $('#postulante').change(function(){
        console.log($('select[name="postulante"] option:selected').text());
        
        let p = $('#NombrePostulante').val();
        
        post = document.getElementById("post")
		post.innerHTML = p
      });
    });
</script>
<?php } ?>
<script>
    let p = document.getElementById("NombrePostulante").value
    post = document.getElementById("post")
	post.innerHTML = p
    
    console.log(p);
</script>


