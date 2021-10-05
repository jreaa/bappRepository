<?php
session_start();
include('../../vendor/autoload.php');
include('../Database/Database.php');
include('../Mail/Mail.php');
include('../Notificaciones/Notificaciones.php');

use Illuminate\Database\Capsule\Manager as DB;


$id = $_POST['id'];
$id_postulante = $_POST['id_postulante'];
$db = $_POST['db'];
$status = $_POST['status'];
$date = $_POST['date'];
$coments = $_POST['comentario'];
$comments_add = $_POST['comentario_add'];



if($date == ""){
    $date = "00-00-0000";
}


if($db == 0){
    $path = "calificarEntrevistaPresencial.php?id=$id&id_postulante=$id_postulante";
	$database = 'tblcita_presencial';
	
	require_once('../StatusPresencial/StatusPresencial.php');
	
	$s = new StatusPresencial;
	$s->addComentarios($id,$comments_add);
	
	
}else if($db == 1){
	$database = 'tblcita_telefonica';
	$path = "calificarEntrevistaTelefonica.php?id=$id&id_postulante=$id_postulante";
	
	require_once('../StatusTelefonica/StatusTelefonica.php');
	
	$s = new StatusTelefonica;
	$s->addComentarios($id,$comments_add);
	
}



$postulante = DB::table('postulante')->where('id', '=', $id_postulante)->get();
$array = json_decode(json_encode($postulante), True);

foreach ($array as $row ) {
	$n = $row['name'];
	$lastname = $row['lastname'];
	$email = $row['email'];
	$id_p = $row['id'];
	$rut = $row['rut'];
}
$name = ucwords($n);
DB::table($database)->where('id', '=', $id)->update([
	'status' => 'calificado',
	'comentario' => $coments,
	'start_date' => $date
]);
if ($status == '1') {
	$pass = "12345678";
	$password = password_hash($pass, PASSWORD_DEFAULT, ['cost => 12']);
	DB::table('users')->insert([
		'name'=> $name,
		'email'=> $email,
		'password'=> $password,
		'id_postulante' => $id_p,
		'rut' => $rut
	]);
	
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

                       	<strong>Nombre:</strong> '.$name.' <br>
                    	Usted ha sido aceptado en el proceso de seleccion.<br>
                    	Fecha de ingreso:'.$date.' <br>
                    
                    	Comentarios de su interes:<br>
                    		'.$coments.'<br>
                    	    <br>
                    
                    		A continuacion se agregaran las credenciales que necesitara para ingresar al portal de usuarios:<br>
                    			Usuario: '.$rut.'<br>
                    			Password:'.$pass.'<br>
                    			<a href="http://ceo.soporbapp.cl">Portal Ceo</a><br>
                    			<a href="http://oca.soporbapp.cl/ceoDownload/">Descargar CeoApp</a>
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

$n = new Notificaciones();
$n->Notificacion("El ha calificado al usuario $name , el cual ha sido aceptado ", $name);



}else{
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

                       		<strong>Nombre:</strong> '.$name.' <br>
                        	Usted ha sido rechazado en el proceso de seleccion.<br>
                        	Agredecemos el tiempo invertido en nosotros. <br>
                        
                        	Comentarios de su interes: <br>
                        		'.$coments.'<br>
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

$n = new Notificaciones();
$n->Notificacion("El ha calificado al usuario $name , el cual ha sido rechazado ", $name);

}
if($status == '1'){
    $status = 'Activo';
}elseif($status == '2'){
    $status = 'Rechazado';
}
DB::table('postulante')->where('id','=', $id_postulante)->update([
	'disponible' => $status
]);


// título
$título = 'Entrevista Bapp';

// Cabeceras adicionales
$cabeceras .= 'To: '.$name.' <'.$email.'>' . "\r\n";
$cabeceras .= 'From: Bapp <no-reply@bapp.cl>' . "\r\n";
$cabeceras .= "Content-type:text/html;charset=UTF-8";


mail($email, $título, $template, $cabeceras);
$_SESSION['p'] = 'Se ha enviado correctamente el email';


//Mail::sendMail($email, $name.' '.$lastname, '', 'CITA BAPP', $template);
//$_SESSION['cita'] = 'Se ha agregado una nueva cita';



header("Location: ../../$path");