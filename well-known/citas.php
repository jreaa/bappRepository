<?php 
session_start();
$_SESSION['url'] = $_SERVER['REQUEST_URI'];

if(!isset($_SESSION['admin'])){
  header('Location: login.php');
}
include 'templates/header.php';?>
<main class="mt-5" >
  <div class="container">
    <div class="mt-3 row">
        <div class="col-lg-6">
          <div class="row">
            <div class="col-8">
              <div class="banner3">
                <div class="text-center" style="width: 300px; max-width: 100%;">
                      <span class="text-white txtFont">AGENDAR ENTREVISTA</span><br> 
                      <div class="mt-5">
                        <div class="mt-3">
                          <a href="agendarCita.php" class="btn btn-link button button1">AGENDAR ENTREVISTA</a>
                        </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="col-4" style="background-image: url(../img/agendar-cita.png); transition: background-position 0.8s; background-size: cover;background-repeat: none;background-position: center;">
            </div>
          </div>
          
        </div>

        <div class="col-lg-6">
          <div class="row">
            <div class="col-8">
              <div class="banner4">
                <div class="text-center" style="width: 300px; max-width: 100%;">
                      <span class="text-white txtFont">RESULTADOS ENTREVISTAS</span><br> 
                      <div class="mt-5">
                        <div class="mt-3">
                          <a href="resultados.php" class="btn btn-link button button1">RESULTADOS ENTREVISTAS</a>
                        </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="col-4" style="background-image: url(../img/entrevista.jpg); transition: background-position 0.8s; background-size: cover;background-repeat: none;background-position: center;">
            </div>
          </div>
          
        </div>

      </div>
  </div>
</main>
<?php include 'templates/footer.php' ?>