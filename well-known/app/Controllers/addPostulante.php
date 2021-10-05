<?php
session_start();
include('../../vendor/autoload.php');
include('../Postulante/Postulante.php');
include('../Documentaria/Documentaria.php');
include('../Database/Database.php');
include('../Notificaciones/Notificaciones.php');
use Illuminate\Database\Capsule\Manager as DB;




if(isset($_POST['btn'])){
	$email = strtolower($_POST['email']);
	$date_born = $_POST['date_born'];
	$name = strtolower($_POST['name']);
	$lastname = strtolower($_POST['lastname']);
	$rut = $_POST['rut'];
	$genere = strtolower($_POST['genere']);
	$address = strtolower($_POST['address']);
	$country = strtolower($_POST['country']);
	$phone = $_POST['phone'];
	$city = strtolower($_POST['city']);
	$writer = strtolower($_POST['writer']);
	$date = $_POST['date'];
	$cargo_postular = strtolower($_POST['cargo_postular']);
	$nive_estudio = strtolower($_POST['nive_estudio']);
}else{
	echo "<script>alert('Algo esta mal')</script>";
}

if($_POST['email_send'] == "1"){
    $name = ucwords($name." ".$lastname);
    $template = 
    '
<div style="display: flex;justify-content:center;width: 100%;">
        <table >
             <tr style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif">
                <td style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;margin:0 auto;padding:0;text-align:center;width:570px">
                    <div style="background: #edf2f7;width:100%;box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;max-width:100vw;padding:32px">
                        <a href="#" style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;color:#3d4852;font-size:19px;font-weight:bold;text-decoration:none;display:inline-block">
                            Bapp
                        </a>
                    </div>
                </td>
             </tr>
             
            <tr>
                <td>
                    <div>
                        <br>
                        <h3 style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;color:#3d4852;font-size:18px;font-weight:bold;margin-top:0;text-align:left">Hola!</h3>
                        <p style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;font-size:16px;line-height:1.5em;margin-top:0;text-align:left">Estimado,<br>
                        Se le notifica que usted esta participando en el proceso de admision.</p>

                        <br>
                    

                        <p style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;font-size:16px;line-height:1.5em;margin-top:0;text-align:left">Saludos Cordiales.<br>
    Equipo Bapp.</p>

                        <hr>
                        <br>
                        <p style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;font-size:16px;line-height:1.5em;margin-top:0;text-align:left">Para mas informacion por favor comunicarse con las oficinas</p>
                        <br><br>
                        <img src="http://oca.soporbapp.cl/archivos/image004.jpg" height="147" width="588">
                    </div>
                </td>
            </tr>
            <tr style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif">
                <td style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;margin:0 auto;padding:0;text-align:center;width:570px">
                    <div style="background: #edf2f7;width:100%;box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;max-width:100vw;padding:32px">
                        <span style="box-sizing:border-box;font-family:-apple-system,BlinkMacSystemFont,Roboto,Helvetica,Arial,sans-serif;line-height:1.5em;margin-top:0;color:#b0adc5;font-size:12px;text-align:center">© 2021 Bapp. Todos los derechos reservados.</span>
                    </div>
                </td>
             </tr>
        </table>
    </div>
    
    
    
    
    ';
    
    // título
    $título = 'Proceso de admision';
    
    // Cabeceras adicionales
    $cabeceras .= 'To: '.$name.' <'.$email.'>' . "\r\n";
    $cabeceras .= 'From: Bapp <no-reply@bapp.cl>' . "\r\n";
    $cabeceras .= "Content-type:text/html;charset=UTF-8";
    
    mail($email, $título, $template, $cabeceras);
    
    $n = new Notificaciones();
    $n->Notificacion("Se ha creado un nuevo postulante: $name ", $name);
    
    //Mail::sendMail($email, $postulante, '', 'CITA BAPP', $template);
    $_SESSION['cita'] = 'Se ha agregado una nueva cita';

}

$cargo = json_decode(json_encode(DB::table('cargo_postular')->where('name','=',$cargo_postular)->get()),True);
foreach ($cargo as $row) {
	$examen = $row['examen_adicional'];
}
if ($examen === 1) {
	$e = 'No realizado';
}else if ($examen === 0) {
	$e = '';
}
try{
    $postulante = new Postulante;
    $postulante->addPostulante($rut,$name,$lastname,$email,$date_born,$genere,$address,$phone,$country,$city,$date,$writer,$cargo_postular,$examen,$disponible='En Proceso',$nive_estudio);
    
    $documentaria = new Documentaria;
    $documentaria->uploadDoc($name,$e);
    

    
    
    $_SESSION['p'] = "Se ha agregado satisfactoriamente el nuevo postulante";
    header('Location: ../../agregarPostulantes.php');
}catch(PDOException $e){
	echo $e;
}