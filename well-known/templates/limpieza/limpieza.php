<?php 
include('../../vendor/autoload.php');
include('../../app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;


$users = json_decode(json_encode(DB::table('users')->where("id_postulante", '=', $_GET['postulante'])->get()), True);


foreach($users as $user){
    $id = $user['id'];   
}


$limpieza = json_decode(json_encode(DB::table('limpieza')->where("id_postulante", '=', $id)->get()), True);

if(empty($limpieza)){?>
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
                            <div id='calendar'></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
       
        <!-- Modal -->
        <?php foreach($limpieza as $row) { ?>
    <div class="modal fade"  id="modal<?php echo $row['id'];?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        <form action="app/Controllers/ControllerEditLimpieza.php" method="POST">
        <div class="modal-body">
            
            <table class="table">
            <thead>
                <tr>
                    <th scope="col">Fecha</th>
                    <th scope="col">Estatus</th>
                    <th scope="col">Hora</th>

                    <th scope="col">---</th>
                </tr>
            </thead>
                <tbody>
                    <tr>
                        <input type="hidden" value="<?php echo $row['id'] ?>" name="id">
                    <td><input name="date" class="form-control" value="<?php echo $row['date'] ?>" name="fecha" required></td>
                   <td><input name="status" class="form-control" value="<?php echo $row['status'] ?>" name="estatus" required></td>

                    <td><input name="hora" class="form-control" value="<?php echo $row['hora'] ?>" name="hora" disabled></td>
 
 
                    <td><input name="btn" type="submit" class="btn btn-bapp btn-block" value="Guardar"></td>
                    </tr>
                </tbody>

                
                </table>

        </div>
        </form>
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
                <?php foreach ($limpieza as $row){ ?>
                {   
                    id: <?php echo $row['id']; ?>,
                    title: '<?php 
                    if($row['status'] == "no realizado"){
                        $status = "NO REALIZADO";
                    }else{
                        $status = "REALIZADO";
                    }
                    echo strtoupper($status." | ".$row['hora']); ?>',
                    start: '<?php echo $row['date']; ?>',
                    desciption: "Estado: <?php echo $row['status'];?> ",
                    color: <?php 
                     if($row['status'] == "no realizado"){
                        echo "'#ff00006b'";
                    }else{
                         echo "'#00800061'"; 
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
