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

if($_GET['status'] == 'proceso'){
    $estado = 'proceso';
}
else if($_GET['status'] == 'realizado'){
    $estado = 'realizado';
}
else{
    $estado = 'proceso';
}

$v =json_decode (json_encode(DB::table('inductivo')->where("status", $estado)->get()),True);



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
                               <a href="inductivo.php?status=realizado" class="btn btn-link">Realizado</a>
                               <a href="inductivo.php?status=proceso" class="btn btn-link">En Proceso</a>
                              
                              </div>
                            </div>
                    
                    <div class="col-md-12">
                        
                        <div class="table-responsive">
                        <?php if(!empty($v)){ ?>
                        <table class="table">
                            <thead>
                                <tr>
                                <th scope="col">Legajo</th>
                                <th scope="col">Verificador</th>
                                <th scope="col">Nif</th>
                                <th scope="col">Nombre Completo</th>
                                <th scope="col">Cargo</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Hora</th>
                                <th scope="col">Documento</th>
                                <th scope="col">Pautas agregadas</th>
                                <th scope="col">Resultados Participantes</th>
                                <th scope="col">---</th>
                                <th scope="col">---</th>
                                </tr>
                            </thead>
                        <?php foreach($v as $row){ ?>
                        <?php 
                        
                            $postulante = DB::table('postulante')->select()->where('id','=',$row['id_usuario_inductivo'])->get();
                            $pe =json_decode (json_encode($postulante),True);
                            
                            
                            foreach($pe as $p){
                                $name = $p['name'];
                                $rut = $p['rut'];
                                $cargo = $p['cargo_postular'];
                                $status = $p['disponible'];
                            }
                            $legajo = substr($rut, 0, -2);
                            $verificador = substr($rut, -1);
                            
                        ?>
                            <tbody>
                                <tr>
                                    
                               
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
                                    $fecha_incio = $row['fecha'];
                                    
                                    if($fecha_incio != null || $fecha_incio != ''){
                                         $newDate = date("d/m/Y", strtotime($fecha_incio));
							             echo $newDate;
                                        
                                    }else{
                                        echo "SIN FECHA DE INICIO";
                                    }
                                    
                                    ?>
                                </td>
                                
                                <td>
                                    <?=(substr($row['hora'], 0,-3))?>
                                </td>
                                
                                  <td>
                                      
                                    <?php if(!empty($row['archivo'])){?>
                                        <a class="btn btn-link" href="archivos/<?=$row['archivo']?>">Visualizar Archivo</a>
                                    <?php }else{?>
                                        <span>No hay un archivo registrado</span>
                                    <?php } ?>
                                        
                                </td>
                                
                                <td>
                                      
                                    <?php if(!empty($row['comentarios'])){?>
                                        <a class="btn btn-link" href="archivos/<?=$row['archivo']?>">Visualizar Archivo</a>
                                    <?php }else{
                                       $value = strtr(strtr($row['comentario'], '[', ' '),']', " ");
                                       echo $value;
                                     } ?>
                                        
                                </td>
                                
                                <td>
                                    <?php 
                                        $inductivo_resultado = DB::table('inductivo_resultado')->where('id_inductivo', $row['id'])->get();
                                        
                                        if(!empty($inductivo_resultado[0])){
                                           echo ' <a href="InductivoResultado.php?id='.$row['id'].'">Ver Resultados Participante</a>';
                                        }else{
                                            echo 'En Proceso';
                                        }
                                    ?>
                                </td>

                                <td>
							      	<a href="#" onclick="modal2(<?php echo $row['id']; ?>)" ><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
									</svg></a>
							    </td>
                                
                                <td>
                                    <button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar esta clasificacion?', 'app/Controllers/deleteInductivo.php',<?php echo $privi;?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg></button>
                                </td>
                                </tr>
                            </tbody>
                         <?php } ?>
                         </table>
                         <?php }else{ ?>
                         <div class="alert alert-warning">
                             No hay inductivos agregados
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
    <div class="modal-dialog modal-xl">
        <div class="modal-content">

        <div class="modal-body">
             <form method="POST" action="app/Controllers/addInductivo.php" enctype="multipart/form-data" >
                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">Usuario</th>
                    <th scope="col">Fecha inductivo</th>
                    <th scope="col">Hora inductivo</th>
                    <th scope="col">Archivo Adicional</th>
                    <th scope="col">Pautas Inductivo</th>
                    <th scope="col">&nbsp</th>
                    </tr>
                </thead>
                    <tbody>
                        <tr>
                        <td>
                            <?php 
                             $veh =json_decode (json_encode(DB::table('postulante')->select()->get()),True);
                             $inductivo = json_decode (json_encode(DB::table('inductivo')->select()->get()),True);
                             $p = [];
                             $ccid = [];
                             for($i=0;$i<sizeof($inductivo);$i++){
                                array_push($ccid,$inductivo[$i]['id_usuario_inductivo']);
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
                                
                                 <option value="<?php echo $p[$i]['id'];?>"><?php echo strtoupper($p[$i]['name']) ?></option>
                            
                            <?php }
                            ?>
                            </select>
                           
                        </td>
                        <td>
                            <input type="date" class="form-control" name="fecha_inductivo">
                        </td>
                        <td>
                            <input type="time" class="form-control" name="hora_inductivo">
                        </td>
                        <td>
                            <select class="form-control" id="archivo" >
                                <option selected>¿Desea agregar un archivo adicional?</option>
                                <option value="si">Si</option></option>
                                <option value="no">No</option>
                            </select>
                            
                        </td>
                        <td>
                            <select class="form-control" id="comentario" >
                                <option selected>¿Desea agregar pautas adicionales?</option>
                                <option value="si">Si</option></option>
                                <option value="no">No</option>
                            </select>
                            
                        </td>
                        <td><input name="btn" type="submit" class="btn btn-bapp btn-block" value="Guardar"></td>
                        </tr>
                    </tbody>
                    </table>
                    
                    <div id="mainFile" style="display:none">
                       <hr>
                    
                        <div class="form-group">
                            <label for="archivo">Archivo</label>
                            <div class="input-group mb-3">
                              <div class="custom-file">
                                <input type="file" class="custom-file-input" name="archivo" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                                <label class="custom-file-label" for="inputGroupFile01">Buscar Archivo</label>
                              </div>
                            </div>
                        </div> 
                    </div>
                    
                    <div id="mainPautas" class="mt-2" style="display:none">
                        <hr>
                        <div class="form-group">
                            <label>Pautas</label>
                            <input name="tags" placeholder="Por favor escribe una pauta" >
                        </div>
                    </div>
                    

        

         </form>
         </div>
        </div>
    </div>
    </div>
    
        <?php foreach($v as $row) { ?>
			<!--modal-->
			<div class="modal" tabindex="-1" id="modal<?php echo $row['id'];?>">
				<div class="modal-dialog modal-xl">
					<div class="modal-content ">
                        <div class="modal-body">
                            <form method="POST" action="app/Controllers/editInductivo.php">
                               <table class="table">
                                <thead>
                                    <tr>
                                    <th scope="col">Usuario</th>
                                    <th scope="col">Fecha inductivo</th>
                                    <th scope="col">Hora inductivo</th>
                                    
                                    <th scope="col">&nbsp</th>
                                    </tr>
                                </thead>
                                    <tbody>
                                        <tr>
                                        <td>
                                            <select class="form-control" name="cc">
                                             <?php
                                                $veh =json_decode (json_encode(DB::table('postulante')->where("id", $row['id_usuario_inductivo'])->select()->get()),True);
                                                foreach($veh as $ve){ ?>
                                                <?php 
                                                    
                                                    if($ve['id'] == $row['id_usuario_inductivo']){ ?>
                                                        
                                               <option selected="selected" value="<?php echo $ve['id']; ?>"><?php echo ucwords($ve['name']); ?></option>
                                                    <?php }else{ ?>
                                                
                                                
                                                <option value="<?php echo $ve['id']; ?>"><?php echo ucwords($ve['name']); ?></option>
                                              <?php }  ?>
                                            
                                            
                                            <?php }
                                            ?>
                                            </select>
                                           
                                        </td>
                                        
                                        <td>
                                            <input type="date" class="form-control" name="fecha_inductivo" value="<?=$row['fecha'];?>">
                                            
                                        </td>
                                        <td>
                                            <input type="time" class="form-control" name="hora_inductivo" value="<?=$row['hora'];?>">
                                            <input type="hidden" class="form-control" name="id" value="<?=$row['id'];?>">
                                            
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
            const archivo = document.querySelector("#archivo");
            const comentario = document.querySelector("#comentario");
            const mainFile = document.querySelector("#mainFile");
            const mainPautas = document.querySelector("#mainPautas");
            
            $('[name=tags]').tagify();

            
            //functions
            const dataDisplay = (div) => {
                div.style.display = "block";
            }
            const dataHide = (div) =>{
                div.style.display = "none";
            }
            //end
            
            archivo.addEventListener("change", function (e){
                if(this.value === "si"){
                    dataDisplay(mainFile);
                }else{
                    dataHide(mainFile);
                }
            })
            
            comentario.addEventListener("change", function (e){
                if(this.value === "si"){
                    dataDisplay(mainPautas);
                }else{
                    dataHide(mainPautas);
                }
            })
            
           
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
