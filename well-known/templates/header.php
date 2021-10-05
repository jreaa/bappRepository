<?php 
session_start();

include('vendor/autoload.php');
include('app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;

$privileges = DB::table('privileges')->select()->where("id","=",$_SESSION['id'])->get();
$array = json_decode(json_encode($privileges), True);

foreach($array as $row){
    $img = $row['img'];
    $name = $row['name']." ".$row['lastname'];
    $position = $row['position'];
    $p = $row['privileges'];
}

//$p = $_SESSION['privileges'];

$notificacion = json_decode(json_encode(DB::table('notificaciones')->get()), True);

$not = array_slice($notificacion, 0, 7);

?>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="icon" href="images/favicon.ico" type="image/ico" />

  <title>Bapp [Servicio de Transporte]</title>
  
  <!--style--->
  <link href="css/style.css" rel="stylesheet">

  <!-- Bootstrap -->
  <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Font Awesome -->
  <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
  <!-- iCheck -->
  <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">

  <!-- bootstrap-progressbar -->
  <link href="vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
  <!-- JQVMap -->
  <link href="vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
  <!-- bootstrap-daterangepicker -->
  <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A==" crossorigin="anonymous" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw==" crossorigin="anonymous" />

  <!-- Custom Theme Style -->
  <link href="build/css/custom.min.css" rel="stylesheet">
  <!--Jqury-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"></script>
  <!--tagify-->
  <link href="css/tagify.css" rel="stylesheet">
  <script src="js/tagify.js"></script>
  
  <!--Plugin imagenes--->
  <link rel="stylesheet" href="venobox/venobox.css" type="text/css" media="screen" />
  <script type="text/javascript" src="venobox/venobox.min.js"></script>

  
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  
    <!--Exportar Excel-->

<script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>

  <!--FULLCALNDAR-->
  
    <script src="js/moment.min.js"></script>

    <link rel="stylesheet" href="css/fullcalendar.min.css">
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/es.js"></script>
    
    
  <!--ChartJs-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.min.js" integrity="sha512-SuxO9djzjML6b9w9/I07IWnLnQhgyYVSpHZx0JV97kGBfTIsUYlWflyuW4ypnvhBrslz1yJ3R+S14fdCWmSmSA==" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.css" integrity="sha512-/zs32ZEJh+/EO2N1b0PEdoA10JkdC3zJ8L5FTiQu82LR9S/rOQNfQN7U59U9BC12swNeRAz3HSzIL2vpp4fv3w==" crossorigin="anonymous" />

  <style type="text/css">
    @media (max-width: 900px){
      #bg-cita{
        display: none;
      }
    }
    .dropdown-menu{
      width: 100%!important;
    }
    #e-foto{
        padding: 20px;
        margin: 20px;
        font-size: 25px;
        position: relative;
    }
    #foto{
        left: -100px;
        top: 0;
        right: 0;
        bottom: 0;
        width: 100%;
        height: 100%;
        position: absolute;
        opacity: 0;
    }
  </style>   
</head>
<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
            <a href="index.php" class="site_title" style="padding-left: 5px"><img src="img/logo.png" alt="logo bapp" width="200" style="height: 100%;margin-bottom: 20px"></a>
          </div>

          <div class="clearfix"></div>

          <!-- menu profile quick info -->
          <div class="profile clearfix">
            <div class="profile_pic">
              <img src="archivos/<?php echo $img; ?>" alt="..." class="img-circle profile_img" style="padding:0px!important">
            </div>
            <div class="profile_info">
              <span>Bienvenido,</span>
              <h2><?php echo ucwords($position); ?></h2>
            </div>
          </div>
          <!-- /menu profile quick info -->

          <br />
          
          
          <?php
          if($p == 2){
            $privileges = json_decode(json_encode(DB::table('privileges_modulos')->where("id_user","=",$_SESSION['id'])->get()),True);
              foreach($privileges as $row){
                  $u = $row['1'];
                  $d = $row['2'];
                  $t = $row['3'];
                  $c = $row['4'];
                  $c1 = $row['5'];
                  $s = $row['6'];
                  $s1 = $row['7'];
                  $o = $row['8'];
              }
              
          }

          ?>

          <!-- sidebar menu -->
          <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
              <h3>General</h3>
              <ul class="nav side-menu">
                <?php if($u == '1' || $p == 1 || $p == 3){?>
                <li><a><i class="fa fa-users"></i> Recluting <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="privileges.php">Privilegios</a></li>
                    <li><a href="addCargos.php">Añadir Cargos</a></li>
                    <li><a href="addExamen.php">Examen</a></li>
                    <li><a href="index.php">Postulantes</a></li>
                    
                    <li><a href="resultados.php">Entrevistas</a></li>
                 
                    <li><a href="formatoDisc.php">Formato Disco (Examen)</a></li>
                  </ul>
                </li>
                <?php } if($d == '1' || $p == 1 || $p == 3){ ?>
                <li><a><i class="fa fa-edit"></i> Formacion <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="inductivo.php">Inductivo</a></li>
                    <li><a href="test.php">Tests</a></li>
                    <li><a href="informativo.php">Informativo</a></li>
                  </ul>
                </li>
                <?php } if($t == '1' || $p == 1 || $p == 3){ ?>
                <li><a><i class="fa fa-exclamation-triangle"></i> Prevencion & Riesgo <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="mutualidad.php">Mutualidad</a></li>
                    <li><a href="preventivo.php">Examen ACHS</a></li>
                    <li><a href="seguros.php">Seguros</a></li>
                    <li><a href="mantencion_siniestro.php">Mantencion/Siniestro</a></li>
                    <li><a href="seguimiento_msiniestro.php">Seguimiento Mantencion/Siniestro</a></li>
                    <li><a href="accidente.php">Accidente</a></li>
                    <li><a href="seguimiento_accidente.php">Seguimiento Accidente</a></li>
                    <li><a href="control_temperatura.php">Control de Temperatura</a></li>
                    <li><a href="sanitizacion.php">Sanitizacion</a></li>
                    <li><a href="limpieza.php">Limpieza</a></li>
                  </ul>
                </li>
                
                <?php } if($c == '1' || $p == 1 || $p == 3){ ?>
                <li><a><i class="fa fa-tasks"></i>Gestion Persona<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="centro_costo.php">Centro de Costo</a></li>
                    <li><a href="clasificacion.php">Clasificacion</a></li>
                    <li><a href="permisos.php">Permisos</a></li>
                    <li><a href="permisosAgregados.php">Permisos Agregados</a></li>
                    <li><a href="control_hora.php">Control Hora</a></li>
                    <li><a href="seguimiento_ch.php">Seguimiento Control Hora</a></li>
                  
                  </ul>
                </li>
                <?php } if($c1 == '1' || $p == 1 || $p == 3){ ?>
                <li><a><i class="fa fa-random"></i>Servicios Generales<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="convenios.php">Convenios</a></li>
                    <li><a href="conveniosAgregados.php">Convenios Agregados</a></li>
                    <li><a href="caja_compesacion.php">Caja Compesacion</a></li>
                    <li><a href="ccAgregados.php">C.C Agregados</a></li>
                  </ul>
                </li>
                <?php } if($s == '1' || $p == 1|| $p == 3){ ?>
                <li><a><i class="fa fa-briefcase"></i>Relaciones Laborales<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="contratos.php">Contratos</a></li>
                    <li><a href="vincular_personal.php">Vincular Personal-Activo</a></li>
                    <li><a href="verificar_persona.php">Verificar Personal</a></li>
                    <li><a href="historial_personal.php">Historial Usuarios</a></li>
                    <li><a href="personal_inactivo_proceso.php">Personal Inactivo</a></li>
                  </ul>
                </li>
                <?php } if($s1 == '1' || $p == 1 || $p == 3){ ?>
                
                <li><a><i class="fa fa-clone"></i>Operaciones<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="comunicado.php">Comunicados</a></li>
                    <li><a href="monestacion.php">Carta de Amonestacion - Felicitaciones</a></li>
                    
                  </ul>
                </li>
                
                <?php } if($s1 == '1' || $p == 1 || $p == 3){ ?>
                
                <li><a><i class="fa fa-car" aria-hidden="true"></i>Procesos<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="vehiculos.php">Vehiculos</a></li>
                    <li><a href="vinculacion.php">Vinculaciones</a></li>
                    
                  </ul>
                </li>
                <?php } ?>
              </ul>
            </div>

          </div>
          <!-- /sidebar menu -->

          <!-- /menu footer buttons -->
          <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
              <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
              <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout" href="logOut.php">
              <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
          </div>
          <!-- /menu footer buttons -->
        </div>
      </div>

      <!-- top navigation -->
      <div class="top_nav">
        <div class="nav_menu">
          <div class="nav toggle">
            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
          </div>
          <nav class="nav navbar-nav">
            <ul class=" navbar-right">
              <li class="nav-item dropdown open" style="padding-left: 15px;">
                <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                  <img src="archivos/<?php echo $img; ?>" alt=""><?php echo ucwords($name); ?>
                </a>
                <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item"  href="editPrivileges.php?id=<?php echo $_SESSION['id']; ?>"> Perfil</a>
                  <a class="dropdown-item"  href="logOut.php"><i class="fa fa-sign-out pull-right"></i> Deslogueo</a>
                </div>
              </li>

              <li role="presentation" class="nav-item dropdown open">
                <a href="javascript:;" class="dropdown-toggle info-number" id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
                  <i class="fa fa-envelope-o"></i>
                  <span class="badge bg-green"><?php echo sizeof($not);?></span>
                </a>
                <ul class="dropdown-menu list-unstyled msg_list" role="menu" aria-labelledby="navbarDropdown1">
                    
                <?php foreach($not as $n){ ?>
                  <li class="nav-item">
                    <a class="dropdown-item">
                      <span>
                        <span><?php echo $n['usuario']; ?></span>
                        <span class="time"><?php echo $n['fecha']; ?></span>
                      </span>
                      <span class="message">
                        <?php echo $n['description']; ?> 
                      </span>
                    </a>
                  </li>
                <?php } ?>
                <li class="nav-item">
                    <a class="dropdown-item" href="mensajes.php">
                        <span style="text-decoration:underline;color:#0000ffad">Ver Listado </span>
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    
    <div class="right_col" role="main">