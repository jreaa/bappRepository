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


$v =json_decode (json_encode(DB::table('cc_vinculacion')->select()->get()),True);


$estado = '';

if($_GET['status'] == 'proceso'){
    $estado = 'En Proceso';
}else if($_GET['status'] == 'activo'){
    $estado = 'Activo';
}else if($_GET['status'] == 'trabajando'){
    $estado = 'Trabajando';
}else if($_GET['status'] == 'inactivo'){
    $estado = 'Inactivo';
}
else if($_GET['status'] == 'prceso'){
    $estado = 'En Proceso';
}
else{
    $estado = 'Trabajando';
}
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
						<h3>Clasificacion</h3>
						<button  style="float:right;" class="btn btn-bapp" onclick="modal(<?php echo $privi; ?>)">Nuevo</button>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
        <?php 
    if(isset($_SESSION['c'])){ ?>
        <div class='mt-5 alert alert-success lert-dismissible fade show'><?php echo $_SESSION['c'];?><button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span>
  </button></div><?php unset($_SESSION['c']);
     }?>

     <section class="mt-3">
        <div class="container">
       
            <div class="content">
                <div class="row">
                    
                    <div class="col-md-12">
                             <div class="dropdown" style="float:left!important">
                              <a class="btn btn-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Filtrar
                              </a>
                            
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                               <a href="clasificacion.php?status=activo" class="btn btn-link">Activo</a>
                               <a href="clasificacion.php?status=trabajando" class="btn btn-link">Trabajando</a>
                               <a href="clasificacion.php?status=inactivo" class="btn btn-link">Inactivo</a>
                               <a href="clasificacion.php?status=proceso" class="btn btn-link">Proceso</a>
                              
                              </div>
                            </div>
                        
                        <div class="table-responsive">
                        <?php if(!empty($v)){ ?>
                        <table class="table">
                            <thead>
                                <tr>
                                <th scope="col">Fecha de Inicio</th>
                                <th scope="col">Legajo</th>
                                <th scope="col">Verificador</th>
                                <th scope="col">Nif</th>
                                <th scope="col">Nombre Completo</th>
                                <th scope="col">Cargo</th>
                                <th scope="col">CC</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Fecha Final</th>
                                <th scope="col">---</th>
                                <th scope="col">---</th>
                                </tr>
                            </thead>
                        <?php foreach($v as $row){ ?>
                        <?php 
                        
                            $postulante = DB::table('postulante')->select()->where('id','=',$row['id_postulante'])->get();
                            $pe =json_decode (json_encode($postulante),True);
                            
                            
                            foreach($pe as $p){
                                $name = $p['name'];
                                $rut = $p['rut'];
                                $cargo = $p['cargo_postular'];
                                $status = $p['disponible'];
                                $fecha_incio = $p['fecha_inicio'];
                                $fecha_final = $p['fecha_final'];
                            }
                            $legajo = substr($rut, 0, -2);
                            $verificador = substr($rut, -1);
                            
                            if($status === $estado ){
                        ?>
                            <tbody>
                                <tr>
                                    
                                <td>
                                    <?php
                                    
                                    if($fecha_incio != null || $fecha_incio != ''){
                                         $newDate = date("d/m/Y", strtotime($fecha_incio));
							             echo $newDate;
                                        
                                    }else{
                                        echo "SIN FECHA DE INICIO";
                                    }
                                    
                                    ?>
                                </td>
                                <td>
                                    <?php 
                                        $legajo = substr($rut, 0, -2);
                                        echo $legajo;
                                    ?>
                                </td>
                                <td>
                                    <?php 
                                        $verificador = substr($rut, -1);
                                        echo $verificador;
                                    ?>
                                </td>
                                <td>
                                    <?=$rut?>
                                </td>
                                <td>
                                    <?=strtoupper($name);?>
                                </td>
                                <td>
                                    <?=strtoupper($cargo);?>
                                </td>
                                
                                <td>
                                    <?php
                                    
                                    $ccc =json_decode (json_encode(DB::table('centro_costo')->where('id','=',$row['id_cc'])->select()->get()),True);
                                    foreach($ccc as $ve){
                                        $centroc = $ve['cc'];
                                    }
                                    echo strtoupper($centroc); 
                                    ?>
                                </td>
                                
                                <td>
                                    <?=strtoupper($status)?>
                                </td>
                                
                                  <td>
                                    <?php
                                    
                                    if($fecha_final != null || $fecha_final != ''){
                                         $newDate = date("d/m/Y", strtotime($fecha_final));
							             echo $newDate;
                                        
                                    }else{
                                        echo "SIN FECHA FINAL";
                                    }
                                    
                                    ?>
                                </td>

                                <td>
							      	<a href="#" onclick="modal2(<?php echo $row['id']; ?>)" ><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
									</svg></a>
							      </td>
                                
                                <td>
                                    <button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar esta clasificacion?', 'app/Controllers/deleteClasificacion.php',<?php echo $privi;?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg></button>
                                </td>
                                </tr>
                            </tbody>
                         <?php } } ?>
                         </table>
                         <?php }else{ ?>
                         <div class="alert alert-warning">
                             No hay postulantes agregados
                         </div>
                         <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

    <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

        <div class="modal-body">
            <form method="POST" action="app/Controllers/addVinculacionCc.php">
                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">Usuario</th>
                    <th scope="col">Centro Costo</th>
                    <th scope="col">---</th>
                    </tr>
                </thead>
                    <tbody>
                        <tr>
                        <td>
                            <?php 
                             $veh =json_decode (json_encode(DB::table('postulante')->select()->get()),True);
                             $cc = json_decode (json_encode(DB::table('cc_vinculacion')->select()->get()),True);
                             $p = [];
                             $ccid = [];
                             for($i=0;$i<sizeof($cc);$i++){
                                array_push($ccid,$cc[$i]['id_postulante']);
                            }
                           
                            for($i=0;$i<sizeof($veh);$i++){
                                if(array_search($veh[$i]['id'], $ccid) === false || array_search($veh[$i]['id'], $ccid) === '' ){
                                    array_push($p,$veh[$i]);
                                }
                            }
                            ;

                            ?>
                            <select class="form-control" name="id_postulante">
                             <?php
                               
                                for($i=0;$i<sizeof($p);$i++){ ?>
                                
                                 <option value="<?php echo $p[$i]['id']; ?>"><?php echo strtoupper($p[$i]['name']) ?></option>
                            
                            <?php }
                            ?>
                            </select>
                           
                        </td>
                        <td>
                            <select class="form-control" name="id_cc">
                             <?php
                                $pe =json_decode (json_encode(DB::table('centro_costo')->select()->get()),True);
                                foreach($pe as $p){ ?>
                                
                            <option value="<?php echo $p['id']; ?>"><?php echo strtoupper($p['cc']) ?> - <?php echo strtoupper($p['description']);?></option>
                            
                            <?php }
                            ?>
                            </select>
                        </td>
                        <td><input name="btn" type="submit" class="btn btn-bapp btn-block" value="Guardar"></td>
                        </tr>
                    </tbody>
                    </table>

        

         </form>
         </div>
        </div>
    </div>
    </div>
    
        <?php foreach($v as $row) { ?>
			<!--modal-->
			<div class="modal" tabindex="-1" id="modal<?php echo $row['id'];?>">
				<div class="modal-dialog modal-lg">
					<div class="modal-content ">
                        <div class="modal-body">
                            <form method="POST" action="app/Controllers/editCc.php">
                               <table class="table">
                                <thead>
                                    <tr>
                                    <th scope="col">Fecha Inicio</th>
                                    <th scope="col">Centro Costo</th>
                                    <th scope="col">Estatus</th>
                                    <th scope="col" id="contentheader" style="display:none">Fecha Final</th>
                                    <th scope="col">---</th>
                                    </tr>
                                </thead>
                                    <tbody>
                                        <tr>
                                        <td>
                                            <?php   
                                                $postulante = DB::table('postulante')->where('id', $row['id_postulante'])->get();
                                                
                                            ?>
                                            <input type="date" class="form-control" name="fechainicio" value="<?=$postulante[0]->fecha_inicio?>" >
                                        </td>
                                        <td>
                                            <select class="form-control" name="cc">
                                             <?php
                                                $veh =json_decode (json_encode(DB::table('centro_costo')->select()->get()),True);
                                                foreach($veh as $ve){ ?>
                                                <?php 
                                                    
                                                    if($ve['id'] == $row['id_cc']){ ?>
                                                        
                                               <option selected="selected" value="<?php echo $ve['id']; ?>"><?php echo ucwords($ve['cc']); ?> - <?php echo $ve['description'];?></option>
                                                    <?php }else{ ?>
                                                
                                                
                                                <option value="<?php echo $ve['id']; ?>"><?php echo $ve['cc'] ?> - <?php echo $ve['description'];?></option>
                                              <?php }  ?>
                                            
                                            
                                            <?php }
                                            ?>
                                            </select>
                                           
                                        </td>
                                        <td >
                                            <select class="form-control" name="status" id="statusmodal" >
                                                <option value="Trabajando">Trabajando</option>
                                                <option value="Inactivo">Inactivo</option>
                                                <option value="En Proceso">En Proceso</option>
                                                <option value="Activo">Activo</option>
                                            </select>
                                            
                                            <input type="hidden" name="id" value="<?php echo $row['id'];?>">
                                            
                                        
                                            <input type="hidden" name="id_postulante" value="<?php echo $row['id_postulante']; ?>">
                                        
                                           
                                            
                                        </td>
                                        <td id="contentfinal"style="display:none" >
                                            <input type="date" name="fechafinal" class="form-control">
                                        </td>
                                        
                                     
                                        <td><input name="btn" type="submit" class="btn btn-bapp btn-block" value="Guardar"></td>
                                        </tr>
                                    </tbody>
                                    </table>
                            </form>
                
                        </div>
					
					</div>
				</div>
			</div>
		<?php }?>
		<script type="text/javascript">
			function modal2(numero_modal){
				//let m = $('#modal').val();
				$("#modal"+numero_modal).modal("show");
			}
		</script>
		
		   <script>
		   const statusmodal = document.querySelectorAll("#statusmodal");
		   statusmodal.forEach(element => element.addEventListener('change', function() {

		        let status = element.value
		        console.log(this)
                let contentfinal = $(this).parent().parent().children("td#contentfinal");
                let contentheader = $(this).parent().parent().parent().parent().children("thead").children("tr").children("th#contentheader");
                console.log(contentheader);
                if(status == "Inactivo"){
                    contentfinal.css("display","block");
                    console.log("Inactivo");
                    contentheader.css("display", "block");
                }else{
                    contentfinal.css("display","none");
                    contentheader.css("display", "none");
                    console.log("no Inactivo");
                }
		    }));

		   
        </script>
		
    
    <script src="http://oca.soporbapp.cl/js/delete.js%20"></script>

    <script>

        function modal(p){
            if(p == "1"){
                $("#modal").modal("show");
            }
            if(p == "3"){
                alert("Usted no tiene los permisos necesarios para hacer esta accion")
            }
           
        }
        
    </script>


 
	<?php include 'templates/footer.php'?>
