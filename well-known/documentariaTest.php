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

$documentaria = DB::table('documentaria')
->where('id_postulante', '=', $_GET['id'])
->get();
$array = json_decode(json_encode($documentaria), True);

$postulante = DB::table('postulante')->where('id','=',$_GET['id'])->get();
$array2 = json_decode(json_encode($postulante), True);

foreach ($array2 as $row) {
    $cargo_postular = $row['cargo_postular'];
    $cedula = $row['cedula'];
    $licencia = $row['numero_licencia'];
}

$cargo = json_decode(json_encode(DB::table('cargo_postular')->where('name','=',$cargo_postular)->get()), True);





if (!$array[0] == 'default.jpg') {
    ?>
    <div class="container">
        <div style="position: static!important;" class="alert alert-warning text-center">
            Este usuario no posee documentaria aun...
        </div>
    </div>
<?php }else{?>
    <?php foreach($array as $row){?>
    <section class="mt-5">
        <div class="container">
            <div class="content">
                
                <h3>Documentaria</h3>

            

                <form action="app/Controllers/documentaria.php" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-md-6">
                            
                            
                            <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                        <label for="CV">CV</label><br>
                                        <div class="row">
                                            <div class="col-md-6">
                                                 <img src="archivos/<?php echo $row['finiquito'];?>" width="250">
                                            </div>
                                            <div class="col-md-6" style="padding-left:50px">
                                                <label>Actualizar Imagen:</label><br>
                                                
                                                <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                    <input name="CV"type="file" class="form-control mt-2" id="foto">
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                            <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                        <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
                                        
                                        <label for="cedula_front">Cedula Identidad</label><br>
                                     
                                        <div class="row">
                                            <div class="col-md-6">
                                                   <img src="archivos/<?php echo $row['cedula_front'];?>" width="250">
                                            </div>
                                            <div class="col-md-6" style="padding-left:50px">
                                                <label>Actualizar Imagen:</label><br>
                                                
                                                <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                    <input name="cedula_front"type="file" class="form-control mt-2" id="foto">
                                                </div>
                                                
                                            </div>
                                            <label class="ml-2">fecha de expiracion:</label>
                                            <input name="f_f"type="date" class="form-control mt-2 ml-2" placeholder="fecha de expiracion: " value="<?php echo $row['cedula_v'];?>">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <?php if($cargo[0]['licencia'] == 1){?>
                            <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                        <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
                                        
                                       <label for="hoja_vida">Licencia Conducir </label><br>
                                     
                                        <div class="row">
                                            <div class="col-md-6">
                                                   <img src="archivos/<?php echo $row['licencia'];?>" width="250">
                                            </div>
                                            <div class="col-md-6" style="padding-left:50px">
                                                <label>Actualizar Imagen:</label><br>
                                                
                                                <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                     <input name="hoja_vida"type="file" class="form-control mt-2" id="foto">
                                                </div>
                                                
                                            </div>
                                            <label class="ml-2">fecha de expiracion:</label>
                                            <input name="f_f"type="date" class="form-control mt-2 ml-2" placeholder="fecha de expiracion: " value="<?php echo $row['licencia'];?>">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                                
                            <?php } ?>  
                            
                            <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                        
                                        <label for="antecedentes">Certifado de Antecedente</label><br>
                                        <div class="row">
                                            <div class="col-md-6">
                                                 <img src="archivos/<?php echo $row['antecedentes'];?>" width="250">
                                            </div>
                                            <div class="col-md-6" style="padding-left:50px">
                                                <label>Actualizar Imagen:</label><br>
                                                
                                                <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                    <input name="antecedentes"type="file" class="form-control mt-2" id="foto">
                                                </div>
                                                
                                            </div>
                                            <label class="ml-2">fecha de expiracion:</label>
                                            <input name="f_a"type="date" class="form-control mt-2 ml-2" placeholder="fecha de expiracion: " value="<?php echo $row['antecedentes_v'];?>">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="col-md-6">
                            
                       <!-- <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                        
                                        <label for="cedula_back">Cedula back</label><br>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img src="archivos/<?php echo $row['cedula_back'];?>" width="250">
                                            </div>
                                            <div class="col-md-6" style="padding-left:50px">
                                                <label>Actualizar Imagen:</label><br>
                                                
                                                <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                    <input name="cedula_back"type="file" class="form-control mt-2" id="foto">
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>-->

                            <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                        
                                        <label for="finiquito">Finiquito</label><br>
                                        <div class="row">
                                                <div class="col-md-6">
                                                     <img src="archivos/<?php echo $row['certificado_salud'];?>" width="250">
                                                </div>
                                                <div class="col-md-6" style="padding-left:50px">
                                                    <label>Actualizar Imagen:</label><br>
                                                    
                                                    <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                        <input name="finiquito"type="file" class="form-control mt-2" id="foto">
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                    </div>
                                </div>

                            </div>
                            
                             <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                         <label for="comprobante_domicilio">Comprobante Domicilio</label><br>
                                         <div class="row">
                                            <div class="col-md-6">
                                                 <img src="archivos/<?php echo $row['comprobante_domicilio'];?>" width="250">
                                            </div>
                                            <div class="col-md-6" style="padding-left:50px">
                                                <label>Actualizar Imagen:</label><br>
                                                
                                                <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                    <input name="comprobante_domicilio"type="file" class="form-control mt-2" id="foto">
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            
                            <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                        <label for="AFP">Certificado AFP</label><br>
                                        
                                        <div class="row">
                                                <div class="col-md-6">
                                                     <img src="archivos/<?php echo $row['AFP'];?>" width="250">
                                                </div>
                                                <div class="col-md-6" style="padding-left:50px">
                                                    <label>Actualizar Imagen:</label><br>
                                                    
                                                    <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                        <input name="AFP"type="file" class="form-control mt-2" id="foto">
                                                    </div>
                                                    
                                                </div>

                                        
                                    </div>
                                </div>

                            </div>
                            
                            <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                        <label for="AFP">Certificado Salud</label><br>
                                        
                                        <div class="row">
                                                <div class="col-md-6">
                                                     <img src="archivos/<?php echo $row['AFP'];?>" width="250">
                                                </div>
                                                <div class="col-md-6" style="padding-left:50px">
                                                    <label>Actualizar Imagen:</label><br>
                                                    
                                                    <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                        <input name="AFP"type="file" class="form-control mt-2" id="foto">
                                                    </div>
                                                    
                                                </div>
                                              
                                            </div>
                                        
                                    </div>
                                </div>

                            </div>
                            
                            
                            <?php if($cargo[0]['hojaVida'] == 1){?>
                             <div class="form-group">
                                <div class="card">
                                    <div class="card-body">
                                        <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
                                        
                                       <label for="hoja_vida">Hoja de vida conductor </label><br>
                                     
                                        <div class="row">
                                            <div class="col-md-6">
                                                   <img src="archivos/<?php echo $row['hoja_vida'];?>" width="250">
                                            </div>
                                            <div class="col-md-6" style="padding-left:50px">
                                                <label>Actualizar Imagen:</label><br>
                                                
                                                <div id="e-foto" class="glyphicon glyphicon-download-alt">
                                                     <input name="hoja_vida"type="file" class="form-control mt-2" id="foto">
                                                </div>
                                                
                                            </div>
                                            <label class="ml-2">fecha de expiracion:</label>
                                            <input name="f_f"type="date" class="form-control mt-2 ml-2" placeholder="fecha de expiracion: " value="<?php echo $row['cedula_v'];?>">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <?php } ?>  
                        <?php }?>

                        </div>

                    </div>
                    <button type="submit" class="btn btn-block btn-bapp">Actualizar</button>
                </form>
            </div>
        </div>
    </section>

<?php }?>

<?php include('templates/footer.php');?>