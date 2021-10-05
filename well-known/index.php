<?php
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
	header('Location: login.php');
}
include('templates/header.php');
include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;


if($_GET['status'] == 'proceso'){
    $postulante = DB::table('postulante')->select()->where('disponible', 'En Proceso')->get();
}else if($_GET['status'] == 'activo'){
    $postulante = DB::table('postulante')->select()->where('disponible', 'Activo')->get();
}else if($_GET['status'] == 'trabajando'){
    $postulante = DB::table('postulante')->select()->where('disponible', 'Trabajando')->get();
}else if($_GET['status'] == 'inactivo'){
    $postulante = DB::table('postulante')->select()->where('disponible', 'Inactivo')->get();
}
else{
    $postulante = DB::table('postulante')->select()->where('disponible', 'En Proceso')->get();
}

$array = json_decode(json_encode($postulante), True);


?>


<style>
.table td, .table th {
    color: #777272!important;
}
.file-select {          
  position: relative;
  display: inline-block;
}
 
.file-select::before {

  font-weight: 400;
color: #007bff;
text-decoration: none;
  display: flex;            
  justify-content: center;
  align-items: center;
  border-radius: 3px;
  content: 'Seleccionar'; /* testo por defecto */
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;                
}
 
.file-select input[type="file"] {
  opacity: 0;
  width: 100%;
  cursor:pointer;
  display: inline-block;            
}
 
#src-file1::before {
    font-size : 1rem;
  content: 'Importar Excel';
}
#src-file2::before {
    font-size : 1rem;
  content: 'Importar Estatus';
}
#src-file2::hover {
    cursor:pointer;
}
#files::hover {
    cursor:pointer;
}
 
</style>

<div class="mt-5">
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="head_section">
						<h3>Postulantes</h3>
						<a style="float:right;padding-top:10px" class="btn btn-bapp" href="agregarPostulantes.php">Nuevo</a>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
	<section class="mt-3">
		<div class="container">
			<div class="content">
				<div class="row">
					<div class="col-md-12">
					    <div class="dropdown" style="float:right!important">
                          <a class="btn btn-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Acciones
                          </a>
                        
                          <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                           <button id="btnExportar" class="btn btn-link" style="margin-left: 15px;">Exportar Excel</button>
                            
                           <div id="files">
                                <form id="form" method="post" action="importarExcel.php"  enctype="multipart/form-data">
                                     <div class="file-select" id="src-file1" >
                                      <input id="excelFile" name="excel" type="file" class="btn btn-link" aria-label="Archivo">
                                    </div>
                                </form>
                           </div>
                           
                            <div id="files">
                                <form id="form2" method="post" action="importarExcelStatus.php"  enctype="multipart/form-data">
                                     <div class="file-select" id="src-file2" >
                                      <input id="excelFile2" name="excel2" type="file" class="btn btn-link" aria-label="Archivo">
                                    </div>
                                </form>
                           </div>

                          </div>
                        </div>
                            <div class="dropdown" style="float:left!important">
                          <a class="btn btn-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filtrar
                          </a>
                        
                          <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                           <a href="index.php?status=proceso" class="btn btn-link">Postulante en proceso</a>
                           <a href="index.php?status=activo" class="btn btn-link">Postulante activo</a>
                           <a href="index.php?status=trabajando" class="btn btn-link">Postulante trabjando</a>
                           <a href="index.php?status=inactivo" class="btn btn-link">Postulante inactivo</a>
                          
                          </div>
                        </div>
						<div class="table-responsive">
						    <?php if(!empty($array)){ ?>
			
							<table class="table table-hover" id="table">
								
							  <thead class="mt-5">
							    <tr id="miTablaPersonalizada">
							      <th scope="col">#</th>
							      <th scope="col">Fecha Postulacion</th>
							      <th scope="col">Legajo</th>
							      <th scope="col">Verificador</th>
							      <th scope="col">Nif</th>
							      <th scope="col">Nombre Completo</th>
							      <th scope="col">Nacionalidad</th>
							    
							      <th scope="col">F/Nacimiento</th>
							      <th scope="col">Nivel Estudio</th>
							      <th scope="col">Direccion</th>
							      <th scope="col">Comuna</th>
							       <th scope="col">Telefono</th>
							       <th scope="col">Correo</th>
    							   <th scope="col">Sexo</th>
    							   <th scope="col">Edad</th>
							       <th scope="col">Cargo</th>
							      <th scope="col">--</th>
							      <th scope="col">--</th>
							    </tr>
							  </thead>

							 

							  <tbody>
							     <?php
							    $i = 1;
								foreach($array as $row) {
								    
								?>
							    <tr>
							      <th scope="row"><?php echo $i;?></th>
							      <td><?php 
							      $newDate = date("d/m/Y", strtotime($row['fecha_postulacion']));
							      echo $newDate;?>
							      
							      
							      </td>
							      <td><?php
							        $legajo = substr($row['rut'], 0, -2);
							        echo $legajo;
							        ?>
							      
							      </td>
							      <td><?php
							        $verificador = substr($row['rut'], -1);
							        echo $verificador;
							        ?>
							      </td>
							      <td style="min-width: 120px;"><?php echo $row['rut'];?></td>
							      <td style="min-width: 174px;"><?php echo strtoupper($row['name']);?></td>
							       <td ><?php echo strtoupper($row['country']);?></td>
							      <td>
							          <?php
							           setlocale(LC_TIME, 'es_ES.UTF-8');
							           $d = $row['date_born'];
							           $date = date("jS F, Y", strtotime($d));
							            
							            echo $date;
							          ?>
							      </td>
							      <td ><?php echo strtoupper($row['nivel_educacion']);?></td>
							      <td style="min-width: 150px;"><?php echo strtoupper($row['address']);?></td>
							      <td ><?php echo strtoupper($row['city']);?></td>
							       
							       <td ><?php echo($row['phone']);?></td>
							       <td ><?php echo strtoupper($row['email']);?></td>
							     
							      <td ><?php echo strtoupper($row['genere']);?></td>
							      <td >
							      <?php 
							        $oldDate = strtotime($row['date_born']);

                                    $data_birth = date('Y',$oldDate);
                                    
                                    $data_hoy = date('Y');
                                    
                                    $date = $data_hoy - $data_birth;
                                    echo $date;
							        ?>
							            </td>
							      <td ><?php echo strtoupper($row['cargo_postular']);?></td>
							      <td>
							      	<a href="editarPostulante.php?id=<?php echo $row['id'];?>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
									</svg></a>
							      </td>
							      <td>
							      	<button id="btn" class="btn btn-danger" onclick="deleteUser(<?php echo $row['id'];?>)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg></button>
							      </td>
							    </tr>
							     <?php 
							  
							  $i = $i + 1;
							  
							  } ?>
							  </tbody>
							  
							  
							 
							</table>
							<?php }else{ ?>
                            <div class="container">
                              <div id="content" class="alert alert-warning text-center">
                                    No hay postulantes agregados...
                              </div>
                            </div>
                            <?php } ?>
				
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>

<script type="text/javascript">
	function deleteUser(id){
		if(confirm('¡Estas seguro que deseas eliminar el usuario seleccionado?')){
			window.location="app/Controllers/deletePostulante.php?id="+id;
		}
	}
</script>
<!--axios-->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    $(document).ready(function() {
       $('#excelFile').on('change', function (e) {
          $("#form").submit();
       }); 
        $('#excelFile2').on('change', function (e) {
          $("#form2").submit();
       }); 
    });
    
</script>

<script>

$("#btnExportar").click(function(){
  $("#table").table2excel({
    // exclude CSS class
    exclude: ".noExl",
    name: "Worksheet Name",
    filename: "Postulantes", //do not include extension
    fileext: ".xls", // file extension
    preserveColors:true

  }); 
});
</script>


<?php include('templates/footer.php');?>