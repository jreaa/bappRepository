<?php 
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
  header('Location: login.php');
}
include 'templates/header.php'
?>
<main class="mt-5" >
  <div class="container">
  	<div class="mt-3 row">
      <div class="col-lg-6">
        <div class="row">
          <div class="col-8">
            <div class="banner1">
              <div class="text-center" style="width: 300px; max-width: 100%;">
                    <span class="text-white txtFont">AÑADIR TEST</span><br> 
                    <div class="mt-5">
                      <div class="mt-3">
                        <button  style="float:right;" class="btn btn-bapp" onclick="modal(<?php echo $privi; ?>)">Nuevo</button>
                      </div>
                  </div>
                </div>
            </div>
          </div>
          <div class="col-4" style="background-image: url(../img/test.jpg); transition: background-position 0.8s; background-size: cover;background-repeat: none;background-position: center;">
          </div>
        </div>
        
      </div>

      <div class="col-lg-6">
        <div class="row">
          <div class="col-8">
            <div class="banner2">
              <div class="text-center" style="width: 300px; max-width: 100%;">
                    <span class="text-white txtFont">LISTAR TEST</span><br> 
                    <div class="mt-5">
                      <div class="mt-3">
                        <a href="test.php" class="btn btn-link button button1">LISTAR TEST</a>
                      </div>
                  </div>
                </div>
            </div>
          </div>
          <div class="col-4" style="background-image: url(../img/resultadotest.png); transition: background-position 0.8s; background-size: cover;background-repeat: none;background-position: center;">
          </div>
        </div>
        
      </div>
      
    </div>
  </div>
</main>


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
                    <th scope="col">多Examen Adicional?</th>
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
         </form>
        </div>
    </div>
    </div>
    
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
    
<?php include 'templates/footer.php' ?>