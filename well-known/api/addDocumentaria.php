<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

include('../vendor/autoload.php');
include('../app/Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;


$id = $_POST['id'];

$usuario = DB::table('users')->where('id', $id)->get();
$postulante = DB::table('postulante')->where('id', $usuario[0]->id_postulante)->get();

$name = $_FILES['file']['name'];
$tmp_name = $_FILES['file']['tmp_name'];
$docs = $_POST['doc'];


//$upload = new Upload;
//$upload->addDocs($name,$tmp_name,$docs,$usuario[0]->id_postulante);

if (!file_exists('../archivos')) {
	mkdir('../archivos',0777, true);
	if (file_exists('../archivos')) {
		if (move_uploaded_file($tmp_name, '../archivos/'.$name)) {
			echo 'El archivo se ha guardado correctamente';
		}else{
			echo 'El archivo no se ha guardado correctamente';
		}
	}
}else{
	if (move_uploaded_file($tmp_name, '../archivos/'.$name)) {
		echo 'El archivo se ha guardado correctamente';
	}else{
		echo 'El archivo no se ha guardado correctamente';
	}
}

//email 

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
                        A continuación se agregan los datos recopilados en la subida de archivos:<br><br>

                       <strong>Nombre usuario:</strong> '.$usuario[0]->name.'<br>
                       <strong>Rut usuario:</strong> '.$postulante[0]->rut.'<br>
                       <strong>Nombre documento:</strong> '.$docs.'<br>
                       <strong>Archivo:</strong> <a href="http://oca.soporbapp.cl/archivos/'.$name.'">Archivo</a><br>
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
$título = 'Subida - Archivo';

// Cabeceras adicionales
$cabeceras .= 'To: Bapp <calarcon@bapp.cl>' . "\r\n";
$cabeceras .= 'From: Bapp <no-reply@bapp.cl>' . "\r\n";
$cabeceras .= "Content-type:text/html;charset=UTF-8";

mail($email, $título, $template, $cabeceras);

//email 2

$template2 = 
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
                        A continuación se agregan los datos recopilados en la subida de archivos:<br><br>

                       <strong>Datos:</strong> Usted ha proporcionado un documento que sera revisado<br>
                       
                       <strong>Documento:</strong>'.$docs.'<br>

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

// Cabeceras adicionales
$cabeceras2 .= 'To: Bapp <'.$postulante[0]->email.'>' . "\r\n";
$cabeceras2 .= 'From: Bapp <no-reply@bapp.cl>' . "\r\n";
$cabeceras2 .= "Content-type:text/html;charset=UTF-8";

mail($postulante[0]->email, $título, $template2, $cabeceras2);

$json = json_encode(['data' => "http://oca.soporbapp.cl/archivos/$name"]);

echo $json;