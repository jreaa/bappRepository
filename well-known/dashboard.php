<?php 
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
  header('Location: login.php');
}
include 'templates/header.php';

?>
          <div class="container">
            <div class="row">
              <div class="col-lg-6">
                <div class="row">
                  <div class="col-8">
                    <div class="banner1">
                      <div class="text-center" style="width: 300px; max-width: 100%;">
                        <span class="text-white txtFont">VER POSTULANTES</span><br> 
                        <div class="mt-5">
                          <div class="mt-3">
                            <a href="postulantes.php" class="btn btn-link button button1">VER POSTULANTES</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-4" style="background-image: url(img/ver.png); transition: background-position 0.8s; background-size: cover;background-repeat: none;">
                  </div>
                </div>

              </div>
              <div class="col-lg-6">
                <div class="row">
                  <div class="col-8">
                    <div  class="banner2">
                      <div class="text-center" style="width: 300px; max-width: 100%;">
                       <span class="text-white txtFont">AÑADIR NUEVO POSTULANTE</span><br> 
                       <div class="mt-5">
                        <div class="mt-3">
                          <a href="agregarPostulantes.php" class="btn btn-link button button2">AÑADIR NUEVO POSTULANTE</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-4" style="background-image: url(img/add3.png); transition: background-position 0.8s; background-size: cover;background-repeat: none;background-position-x: center;">
                </div>
              </div>
            </div>
          </div>
        </div>
<?php include 'templates/footer.php';?>