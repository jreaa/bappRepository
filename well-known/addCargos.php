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
$c =json_decode (json_encode(DB::table('cargo_postular')->select()->get()),True);
?>


<style>
    th{
        border-bottom: none!important;
    }    
</style>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Cargos a postular</h3>
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
                        <div class="table-responsive">
                        <?php if(!empty($c)){ ?>
                        <table class="table">
                            <thead>
                                <tr>
                                <th scope="col">Nombre del cargo</th>
                                <th scope="col">Examen Adicional</th>
                                <th scope="col">Documentaria Adicional</th>
                                <th scope="col">---</th>
                                </tr>
                            </thead>
                        <?php foreach($c as $row){ ?>
                            <tbody>
                                <tr>
                                <td><?php echo strtoupper($row['name']); ?></td>
                                <?php 
                                    if($row['examen_adicional'] == 1){
                                        $p = "si";
                                    }elseif($row['privileges'] == 0){
                                        $p = "no";
                                    }
                                ?>
                                <td><?php echo strtoupper($p); ?></td>
                                 <?php 
                                    if($row['licencia'] == 0 && $row['hojaVida'] == 0 ) {
                                        $d = "Este cargo no posee documentaria adicional";
                                    }elseif($row['licencia'] == 1 && $row['hojaVida'] == 1 ){
                                        $d = "1.-Licencia <br> 2.-Hoja de vida conductor";
                                    }
                                    elseif($row['licencia'] == 1){
                                        $d = "1.-Licencia";
                                    }
                                    elseif($row['hojaVida'] == 1 ){
                                        $d = "1.-Hoja de vida conductor";
                                    }
                                ?>
                                <td><?php echo strtoupper($d); ?></td>
                                 
                                <td>
                                    <button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>, 'Esta seguro que desea eliminar este cargo?', 'app/Controllers/controllerDeleteCargo.php',<?php echo $privi;?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg></button>
                                </td>
                                </tr>
                            </tbody>
                         <?php } ?>
                         </table>
                         <?php }else{ ?>
                         <div class="alert alert-warning">
                             No hay cargos agregados
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
            <form method="POST" action="app/Controllers/controllerAddCargo.php">
                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">Nombre Cargo</th>
                    <th scope="col">¿Examen Adicional?</th>
                    <th scope="col">Documentaria Especial?</th>
                    <th scope="col" style="display:none" id="doc_box" style="transition: width 2s;" >Selc. Documentos </th>
                    <th scope="col">---</th>
                    </tr>
                </thead>
                    <tbody>
                        <tr>
                        <td><input class="form-control" name="ncargo" required></td>
                        <td>
                            <select id="examen" class="form-control" name="examen_adicional" required>
                                <option value="..">...</option>
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </td>
                         <td>
                            <select id="documentaria" class="form-control" required>
                                <option value="..">...</option>
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </td>
                         <td  style="display:none;transition: width 2s;" id="doc_content" >
                          <select class="js-example-basic-multiple form-control" name="docs[]" multiple="multiple" style="width: 100%">
                              <option value="licencia">Licencia Conducir</option>
                              <option value="hojaVida">Hoja de vida Conductor</option>
                            </select>
                                                    
                        </td>
                        
                        <td><input name="btn" type="submit" class="btn btn-bapp btn-block" value="Guardar"></td>
                        </tr>
                    </tbody>
                    </table>
                    
           
        </div>
        <div id="contenido" class="model-footer" style="display:none;padding:20px">
            <?php 
                $examenes = json_decode(json_encode(DB::table('examenes')->select('id','title')->get()),True);
                
                if(!empty($examenes)){
                ?>
                <label for="examen">Selecione un examen</label>
                <select name="id_examen" id="examen" class="form-control" required="required" style="margin-bottom: 10px;">
                <option value="0">Elegir opcion</option>
                <?php foreach($examenes as $row) { ?>
                <option value="<?php echo $row['id'];?>" id="AF"><?php echo $row['title'];?></option>
                <?php } ?>
                </select>
                <?php }else{?>
                <div class="alert alert-warning">
                	No hay cargos agregados en la base de datos
                </div>
                <?php }?>
        </div>
        
          <div id="doc_box" class="model-footer" style="display:none;padding:20px">
                <h3>running</h3>
        </div>
         </form>
        </div>
    </div>
    </div>
    
    <script src="http://oca.soporbapp.cl/js/delete.js%20"></script>
    
    <script>
        
        $(document).ready(function() {
            $('.js-example-basic-multiple').select2();
        });
    </script>

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
    
    
    <script>
        $(document).ready(function(){
            $("#examen").change(function(){
                let valor = $("#examen").val();
                if(valor == "1"){
                    $("#contenido").css("display", "block");
                }else if(valor == "0"){
                    $("#contenido").css("display", "none");
                }
            });
             $("#documentaria").change(function(){
                let valor = $("#documentaria").val();
                if(valor == "1"){
                    $("#doc_box").css("display", "block");
                    $("#doc_content").css("display", "block");
                }else if(valor == "0"){
                    $("#doc_box").css("display", "none");
                    $("#doc_content").css("display", "none");
                }
            });
        })
    </script>

 
	<?php include 'templates/footer.php'?>
