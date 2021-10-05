<?php
include('../../vendor/autoload.php');
include('../Cita/Cita.php');
include('../Database/Database.php');
include('../Mail/Mail.php');
include('../Examenes/Examenes.php');
include('../Notificaciones/Notificaciones.php');

session_start();

use Illuminate\Database\Capsule\Manager as DB;


if(isset($_POST['btn'])){
	$date = $_POST['date_cita'];
	$time = $_POST['time_cita'];
	$postulante = $_POST['person'];
	$link = $_POST['link'];
	$message = $_POST['message'];
}else{
	echo "<script>alert('Algo esta mal')</script>";
}





$p = DB::table('postulante')
->where('id', '=', $postulante)
->get();
$array = json_decode(json_encode($p), True);

foreach ($array as $key) {
	$id_postulante = $key['id'];
	$email = $key['email'];
	$n = $key['name'];
	$lastname = $key['lastname'];
}

$name = ucwords($n);


if ($link == 'FormatoDisc') {
	$e = new Examenes;
	$e->formatDisc($id_postulante);
	$url = 'http://oca.soporbapp.cl/formatoDisc.php';
}

$cita = new Cita;
$cita->addCitaTelefonica($date,$time,$email,$link,$id_postulante);
$_SESSION['c'] = "Usted ha agreado un cita telefonica satisfactoriamente";

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
                        A continuación se agregan los datos recopilados en la cita:<br><br>

                          <strong>Nombre:</strong>'.$name.'<br>
                           <strong>Fecha de cita:</strong> '.$date.'<br>
                           <strong>Hora:</strong>'.$time.'<br>
                           <strong>Link de examen:</strong> <a href='.$url.'>Rendir Examen Aqui</a><br><br>

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
$título = 'Entrevista Bapp - Telefonica';

// Cabeceras adicionales
$cabeceras .= 'To: '.$name.' <'.$email.'>' . "\r\n";
$cabeceras .= 'From: Bapp <no-reply@bapp.cl>' . "\r\n";
$cabeceras .= "Content-type:text/html;charset=UTF-8";


mail($email, $título, $template, $cabeceras);
$n = new Notificaciones();
$n->Notificacion("Se ha creado una nueva entrevista telefonica para el usuario $name ", $name);


//Mail::sendMail($email, $postulante.' '.$lastname, '', 'CITA BAPP', $template);
$_SESSION['cita'] = 'Se ha agregado una nueva cita';

header('Location: ../../agendarCita.php');
