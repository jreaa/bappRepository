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
$v =json_decode (json_encode(DB::table('inductivo')->where("status", $estado)->get()),True);


$documentaria = DB::table('documentaria')
->where('id_postulante', '=', $_GET['id'])
->get();
$array = json_decode(json_encode($documentaria), True);


$postulante = json_decode(json_encode(DB::table('postulante')->where('id','=',$_GET['id'])->get()), True);


$cargo = json_decode(json_encode(DB::table('cargo_postular')->where('name','=',$postulante[0]['cargo_postular'])->get()), True);

?>

<style>
    
    .venobox img {
        height: 350px;
    }
</style>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Documentaria</h3>
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


     <section class="mt-3 p-2">
         <!-- Gallery -->
        <div class="row">
          <div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
              
              <div>
                    <p style="font-size: 15px;font-weight: 400; color: #ccccc;color: #5e5151;letter-spacing: 1px;">CV</p>
                   <a class="venobox" href="archivos/<?php echo $array[0]['CV'];?>">
                      <img
                      src="archivos/<?php echo $array[0]['CV'];?>"
                      class="w-100 shadow-1-strong rounded mb-2"
                      alt=""
                    />
                 </a>
                 
                 <div class="row mb-4" style="float:right">
                    <div class="btn-group" role="group" aria-label="Basic example" style="margin-right:10px">
                      <button class="btn btn-bapp" onclick="editar('CV')">
                         Editar
                     </button>
                      <a href="archivos/<?php echo $array[0]['CV'];?>" download="archivo.png" class="btn btn-bapp">Descargar</a>

                    </div>
                 </div>
              </div>
            
          </div>
        
          <div class="col-lg-4 mb-4 mb-lg-0">
              
              <div>
                    <p style="font-size: 15px;font-weight: 400; color: #ccccc;color: #5e5151;letter-spacing: 1px;">Cedula</p>
                   <a class="venobox" href="archivos/<?php echo $array[0]['cedula_front'];?>">
                      <img
                      src="archivos/<?php echo $array[0]['cedula_front'];?>"
                      class="w-100 shadow-1-strong rounded mb-2"
                      alt=""
                    />
                 </a>
                 
                 <div class="row mb-4" style="float:right">
                    <div class="btn-group" role="group" aria-label="Basic example" style="margin-right:10px">
                      <button class="btn btn-bapp" onclick="editar('cedula_front', '<?php echo $array[0]['cedula_v'];?>')">
                         Editar
                     </button>
                     <a href="archivos/<?php echo $array[0]['cedula_front'];?>" download="archivo.png" class="btn btn-bapp">Descargar</a>

                    </div>
                 </div>
        
              </div>
              
 
          </div>
        
          <div class="col-lg-4 mb-4 mb-lg-0">
              <div>
                <p style="font-size: 15px;font-weight: 400; color: #ccccc;color: #5e5151;letter-spacing: 1px;">Antecedentes</p>
                   <a class="venobox" href="archivos/<?php echo $array[0]['antecedentes'];?>">
                      <img
                      src="archivos/<?php echo $array[0]['antecedentes'];?>"
                      class="w-100 shadow-1-strong rounded mb-2"
                      alt=""
                    />
                 </a>
                 
                 <div class="row mb-4" style="float:right">
                    <div class="btn-group" role="group" aria-label="Basic example" style="margin-right:10px">
                      <button class="btn btn-bapp" onclick="editar('antecedentes')">
                         Editar
                     </button>
                    <a href="archivos/<?php echo $array[0]['antecedentes'];?>" download="archivo.png" class="btn btn-bapp">Descargar</a>

                    </div>
                 </div>
                  
              </div>
              

        
          </div>
        </div>
        
        <hr>
        
        <div class="row">
          <div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
              
              <div>
                    <p style="font-size: 15px;font-weight: 400; color: #ccccc;color: #5e5151;letter-spacing: 1px;">Finiquito</p>
                   <a class="venobox" href="archivos/<?php echo $array[0]['finiquito'];?>">
                      <img
                      src="archivos/<?php echo $array[0]['finiquito'];?>"
                      class="w-100 shadow-1-strong rounded mb-2"
                      alt=""
                    />
                 </a>
                 
                 <div class="row mb-4" style="float:right">
                    <div class="btn-group" role="group" aria-label="Basic example" style="margin-right:10px">
                      <button class="btn btn-bapp" onclick="editar('finiquito')">
                         Editar
                     </button>
                    <a href="archivos/<?php echo $array[0]['finiquito'];?>" download="archivo.png" class="btn btn-bapp">Descargar</a>

                    </div>
                 </div>
              </div>
            
          </div>
        
          <div class="col-lg-4 mb-4 mb-lg-0">
              
              <div>
                    <p style="font-size: 15px;font-weight: 400; color: #ccccc;color: #5e5151;letter-spacing: 1px;">Comprobante Domicilio</p>
                   <a class="venobox" href="archivos/<?php echo $array[0]['comprobante_domicilio'];?>">
                      <img
                      src="archivos/<?php echo $array[0]['comprobante_domicilio'];?>"
                      class="w-100 shadow-1-strong rounded mb-2"
                      alt=""
                    />
                 </a>
                 
                 <div class="row mb-4" style="float:right">
                    <div class="btn-group" role="group" aria-label="Basic example" style="margin-right:10px">
                      <button class="btn btn-bapp" onclick="editar('comprobante_domicilio')">
                         Editar
                     </button>
                     <a href="archivos/<?php echo $array[0]['comprobante_domicilio'];?>" download="archivo.png" class="btn btn-bapp">Descargar</a>

                    </div>
                 </div>
        
              </div>
              
 
          </div>
        
          <div class="col-lg-4 mb-4 mb-lg-0">
              <div>
                <p style="font-size: 15px;font-weight: 400; color: #ccccc;color: #5e5151;letter-spacing: 1px;">Certificado AFP</p>
                   <a class="venobox" href="archivos/<?php echo $array[0]['AFP'];?>">
                      <img
                      src="archivos/<?php echo $array[0]['AFP'];?>"
                      class="w-100 shadow-1-strong rounded mb-2"
                      alt=""
                    />
                 </a>
                 
                 <div class="row mb-4" style="float:right">
                    <div class="btn-group" role="group" aria-label="Basic example" style="margin-right:10px">
                      <button class="btn btn-bapp" onclick="editar('AFP')">
                         Editar
                     </button>
                     <a href="archivos/<?php echo $array[0]['AFP'];?>" download="archivo.png" class="btn btn-bapp">Descargar</a>

                    </div>
                 </div>
                  
              </div>
              

        
          </div>
        </div>
        
        <hr>
        
        <div class="row">
          <div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
              
              <div>
                    <p style="font-size: 15px;font-weight: 400; color: #ccccc;color: #5e5151;letter-spacing: 1px;">Certificado Salud</p>
                   <a class="venobox" href="archivos/<?php echo $array[0]['certificado_salud'];?>">
                      <img
                      src="archivos/<?php echo $array[0]['certificado_salud'];?>"
                      class="w-100 shadow-1-strong rounded mb-2"
                      alt=""
                    />
                 </a>
                 
                 <div class="row mb-4" style="float:right">
                    <div class="btn-group" role="group" aria-label="Basic example" style="margin-right:10px">
                      <button class="btn btn-bapp" onclick="editar('certificado_salud')">
                         Editar
                     </button>
                    <a href="archivos/<?php echo $array[0]['certificado_salud'];?>" download="archivo.png" class="btn btn-bapp">Descargar</a>

                    </div>
                 </div>
              </div>
            
          </div>
          
          <?php if($cargo[0]['licencia'] == 1): ?>
        
          <div class="col-lg-4 mb-4 mb-lg-0">
              
              <div>
                    <p style="font-size: 15px;font-weight: 400; color: #ccccc;color: #5e5151;letter-spacing: 1px;">Licencia</p>
                   <a class="venobox" href="archivos/<?php echo $array[0]['licencia'];?>">
                      <img
                      src="archivos/<?php echo $array[0]['licencia'];?>"
                      class="w-100 shadow-1-strong rounded mb-2"
                      alt=""
                    />
                 </a>
                 
                 <div class="row mb-4" style="float:right">
                    <div class="btn-group" role="group" aria-label="Basic example" style="margin-right:10px">
                      <button class="btn btn-bapp" onclick="editar('licencia','<?php echo $array[0]['licencia_v'] ?>')">
                         Editar
                     </button>
                     <a href="archivos/<?php echo $array[0]['licencia'];?>" download="archivo.png" class="btn btn-bapp">Descargar</a>

                    </div>
                 </div>
        
              </div>
          </div>
          <?php endif; ?>
          
          <?php if($cargo[0]['hojaVida'] == 1): ?>
        
          <div class="col-lg-4 mb-4 mb-lg-0">
              <div>
                <p style="font-size: 15px;font-weight: 400; color: #ccccc;color: #5e5151;letter-spacing: 1px;">Hoja Vida</p>
                   <a class="venobox" href="archivos/<?php echo $array[0]['hoja_vida'];?>">
                      <img
                      src="archivos/<?php echo $array[0]['hoja_vida'];?>"
                      class="w-100 shadow-1-strong rounded mb-2"
                      alt=""
                    />
                 </a>
                 
                 <div class="row mb-4" style="float:right">
                    <div class="btn-group" role="group" aria-label="Basic example" style="margin-right:10px">
                      <button class="btn btn-bapp" onclick="editar('hoja_vida')">
                         Editar
                     </button>
                     <a href="archivos/<?php echo $array[0]['hoja_vida'];?>" download="archivo.png" class="btn btn-bapp">Descargar</a>

                    </div>
                 </div>
                  
              </div>
          </div>
          <?php endif; ?>
        </div>
         
    </section>
    
        <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">

        <div class="modal-body">
             <form  action="app/Controllers/editDocumentaria.php" enctype="multipart/form-data" method="POST">
                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">Cargar Nuevo Archivo</th>
                    <th scope="col" id="col-licencia" style="display:none">Licencia</th>
                    <th scope="col" id="col-cedula" style="display:none">Cedula</th>
                    
                    <th scope="col">&nbsp</th>
                    </tr>
                </thead>
                    <tbody>
                        <tr>
                        <td>
                            <input type="file" class="form-control" name="archivo2">
                            
                            <?php if($cargo[0]['licencia'] == 1): ?>
                            
                            <?php endif; ?>
                            <input type="hidden" id="id_documentaria" name="id_documentaria">
                            <input type="hidden" id="nombre_position" name="nombre_position"> 
                            <input type="hidden" id="id_postulante" name="id_postulante"> 
                        </td>
                        <td id="licencia" style="display:none">
                            <input type="date" name="fecha_vencimiento_licencia" class="form-control">
                        </td>
                        <td id="cedula" style="display:none">
                            <input type="date" name="fecha_vencimiento_cedula" class="form-control">
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
    
    <script>
    
        function editar(nombre,fecha=''){
            let doc = $("#id_documentaria").val(<?php echo $array[0]['id'];?>);
            let position = $("#nombre_position").val(nombre); 
            let id_postulante = $("#id_postulante").val(<?php echo $_GET['id'] ?>);
            
            $('#modal').modal('show');
            
            if(nombre == 'licencia'){
                $('#licencia').css('display', 'block');
                $('#licencia > input').val(fecha);
                $('#col-licencia').css('display', 'block');
            }else if(nombre == 'cedula_front'){
                $('#cedula').css('display', 'block');
                $('#cedula > input').val(fecha);
                $('#col-cedula').css('display', 'block');
            }else{
                $('#cedula').css('display', 'none');
                $('#licencia > input').val(fecha);
                $('#col-cedula').css('display', 'none');
                $('#licencia').css('display', 'none');
                $('#col-licencia').css('display', 'none');
            }
        }

        
    </script>
    

		
    <script>
        $(document).ready(function(){
            $('.venobox').venobox(); 
        });
    </script>

 
	<?php include 'templates/footer.php'?>
