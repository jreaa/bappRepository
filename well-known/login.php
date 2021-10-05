<?php
include('vendor/autoload.php');
include('app/Database/Database.php');
session_start();
$url = 'index.php';
use Illuminate\Database\Capsule\Manager as DB;
?>


<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Jekyll v4.1.1">
	<title>Bapp [Servicio de Transporte]</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

	<style>
		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			user-select: none;
		}
		label{
            color: #c1c1c1;
            float:left;
        }
        .btn-bapp{
            color: #fff;
            text-transform: uppercase;
            background: linear-gradient(to top, #009ed8, #6e5192)!important;
        }
        #your_col { border-left: 1px solid black; }
		@media (max-width: 700px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
            #fondo {
                height: auto!important;
            }

            #logo{
                width: 60%!important;
                height: 100px!important;
                padding-top: 0px!important;
                padding-left: 0px!important;
                margin-top: 0px!important;
                padding-right: 0px!important;
            }
            #hr {
                display: none!important;
            }
		}
	</style>

</head>
<body class="text-center">

 <section>
        <div class="row">
            <img id="fondo" src="http://oca.soporbapp.cl/archivos/fondo2.png" alt="" style="width: 100%;height: 500px;padding: 0px;">
        </div>
        <div class="row">
            <div class="col-md-5 mt-4">
                <div class="container">
                    <img id="logo" style="width: 80%;height: 170px;padding-top: 50px;padding-left: 170px;margin-top:15px;
                    padding-right: 70px;" src="http://oca.soporbapp.cl/archivos/Bapp.png" alt="Imagen logo bapp">
                </div>
            </div>
            <div class="col-md-7" style="padding: 40px;display:flex">
                <div id="hr" style="border-left: 1px solid #ccc;height: 210px;margin-top: 30px;padding-right: 20px;"></div>
                <div class="container">
                    
                    <form method="post">
                        <div class="container">
                            	<?php 
                            	if (isset($_POST['btn'])) {
                            		$user=DB::table('privileges')->where('usuario', '=', $_POST['User'])->get();
                            		$array = json_decode(json_encode($user), True);
                            		if(empty($array)){ ?>
                            			<div class="alert alert-danger">
                            				El usuario no existe
                            			</div>
                            
                            		<?php }else{
                            			foreach($array as $row){
                            				$user = $row['usuario'];
                            				$privileges = $row['privileges'];
                            				$password = $row['password'];
                            				$position = $row['position'];
                            				$name = $row['name'];
                            				$lastname = $row['lastname'];
                            				$img = $row['img'];
                            				$id = $row['id'];
                            			}
                            			$checkpassword = password_verify($_POST['password'], $password);
                            
                            			if(!$checkpassword){ ?>
                            				<div class="alert alert-danger">
                            					La contraseña es incorrecta
                            				</div>
                            			<?php }else{ 
                                            $_SESSION['name'] = $name." ".$lastname;
                                            $_SESSION['privileges'] = $privileges;
                                            $_SESSION['img'] = $img;
                                            $_SESSION['position'] = $position;
                            				$_SESSION['admin'] = $user;
                            				$_SESSION['id'] = $id;
                            				header('Location: '.$url);
                            			}
                            		}
                            			
                            	}
                            
                            	?>
                            <div class="form-group mt-4">
                                <label for="">Usuario</label>
                                <input type="text" class="form-control" name="User" required autofocus>
                            </div>
                        </div>
                        <div class="container">
                            <div class="form-group">
                                <label for="">Contrase&ntilde;a</label>
                                <input type="password"  class="form-control" name="password" required>
                            </div>
                        
                            <button style="float: right;" class="mt-3 btn btn-bapp" type="submit" name="btn">Iniciar Sesion</button>
                        </div>
                        
                        
                    </form>

                    <!--end::Form-->
                </div>
            </div>
        </div>
    </section>

</body>
</html>


