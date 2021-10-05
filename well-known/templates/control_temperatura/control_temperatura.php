<?php 
include('../../vendor/autoload.php');
include('../../app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;


$users = json_decode(json_encode(DB::table('users')->where("id_postulante", '=', $_GET['postulante'])->get()), True);


foreach($users as $user){
    $id = $user['id'];   
}


$control_temperatura = json_decode(json_encode(DB::table('control_temp')->where("id_postulante", '=', $id)->get()), True);

if(empty($control_temperatura)){?>
	<div class="alert alert-warning">
		No existe un registro para <?php echo $_GET['postulante']; ?>
	</div>
	<?php
	}else {
	
	?>
    
    <section class="mt-3">
        <div class="container">
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                        <!-- <table class="table">
                           
                            <thead>
                                <tr>
                                <th scope="col">Fecha</th>
                                <th scope="col">Jornada</th>
                                <th scope="col">Hora</th>
                                <th scope="col">Estatus</th>
                                <th scope="col">Temperatura</th>
                                 <th scope="col">---</th>
                                <th scope="col">---</th>
                               
                                </tr>
                            </thead>
                        
                         </table>-->
                         
                         <div id='calendar'></div>
    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
        <!-- Modal -->
        <?php foreach($control_temperatura as $row) { ?>
    <div class="modal fade"  id="modal<?php echo $row['id'];?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        
        <div class="modal-body">
            
            <table class="table">
            <thead>
                <tr>
                    <th scope="col">Fecha</th>
                    <th scope="col">Jornada</th>
                    <th scope="col">Hora</th>
                    <th scope="col">Estatus</th>
                    <th scope="col">Temperatura</th>
                    <th scope="col">---</th>
                    <th scope="col">---</th>
                </tr>
            </thead>
                <tbody>
                    <form action="app/Controllers/ControllerEditTmp.php" method="POST">
                    <tr>
                        <input type="hidden" value="<?php echo $row['id'] ?>" name="id">
                    <td><input name="date" class="form-control" value="<?php echo $row['date'] ?>" name="fecha" required></td>
                    
                    <td><input name="jornada" class="form-control" value="<?php echo $row['jornada'] ?>" name="jornada" required></td>
                    <td><input name="hora" class="form-control" value="<?php echo $row['hora'] ?>" name="hora" disabled></td>
                    <td><input name="status" class="form-control" value="<?php echo $row['status'] ?>" name="estatus" required></td>
                    <td><input name="temperatura" class="form-control" value="<?php echo $row['temperatura'] ?>" name="temperaturas" required></td>
 
 
                    <td><input name="btn" type="submit" class="btn btn-bapp btn-block" value="Guardar"></td>
                    
                      </form>
                    
                    <td>
                        <form action="app/Controllers/controllDeleteTmp.php" method="POST">
                            <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                        <button id="btn" class="btn btn-danger" onclick="confirm('¿Seguro que desea eliminar este item?')"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                          <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                        </svg></button>
                        
                        </form>
                        
                    </td>
                    </tr>
                </tbody>

                
                </table>

        </div>
      
        </div>
    </div>
    </div>
    <?php }?>
<script>

    $(document).ready(function (params) {

        

        $("#calendar").fullCalendar({
            header : {
                left:'today,prev,next',
                center:'title',
                right:'month,basicWeek,basicDay,agendaWeek,agendaDay'
            },

            dayClick : function(date, jsEvent, view) {
                //alert("valor:"+date.format());
                //alert("vista:"+view.name);
              
                $("#ModalEvent").modal('show');
                $("#txtFecha").val(date.format());
            },
            
            events: [
                <?php foreach ($control_temperatura as $row){ ?>
                {   
                    id: <?php echo $row['id']; ?>,
                    title: '<?php echo strtoupper($row['jornada']); ?>',
                    start: '<?php echo $row['date']; ?>',
                    desciption: "Estado: <?php echo $row['status'];?> Temperatura: <?php echo $row['temperatura'] ?>",
                    color: <?php 
                     if($row['status'] == ""){
                        echo "'#ddd'";
                    }else{
                        if($row['temperatura'] > 37){
                            echo "'#ff00006b'";
                        }else{
                            echo "'#00800061'"; 
                        }
                         
                    }
                   
                   ?>,
                    textColor: '#ffff'
                },
                 <?php } ?>

           ],
          

            eventClick: function(calEvent, jsEvent, view) {
                $("#modal"+calEvent.id).modal('show');

            }
           
        });
    });
  
      </script>
    

	
<script src="http://oca.soporbapp.cl/js/delete.js%20"></script>

<script type="text/javascript">
	function modal(numero_modal){
		//let m = $('#modal').val();
		$("#modal"+numero_modal).modal("show");
	}
</script>
<?php } ?>
