<?php 
include('../../vendor/autoload.php');
include('../Examenes/Examenes.php');
include('../Notificaciones/Notificaciones.php');

session_start();


$id = $_SESSION['id_postulante']; 
unset($_SESSION['postulante']);

$mas1 = $_POST['mas1'];
$menos1 = $_POST['menos1'];

$mas2 = $_POST['mas2'];
$menos2 = $_POST['menos2'];

$mas3 = $_POST['mas3'];
$menos3 = $_POST['menos3'];

$mas4 = $_POST['mas4'];
$menos4 = $_POST['menos4'];

$mas5 = $_POST['mas5'];
$menos5 = $_POST['menos5'];

$mas6 = $_POST['mas6'];
$menos6 = $_POST['menos6'];

$mas7 = $_POST['mas7'];
$menos7 = $_POST['menos7'];

$mas8 = $_POST['mas8'];
$menos8 = $_POST['menos8'];

$mas9 = $_POST['mas9'];
$menos9 = $_POST['menos9'];

$mas10 = $_POST['mas10'];
$menos10 = $_POST['menos10'];

$mas11 = $_POST['mas11'];
$menos11 = $_POST['menos11'];

$mas12 = $_POST['mas12'];
$menos12 = $_POST['menos12'];

$mas13 = $_POST['mas13'];
$menos13 = $_POST['menos13'];

$mas14 = $_POST['mas14'];
$menos14 = $_POST['menos14'];

$mas15 = $_POST['mas15'];
$menos15 = $_POST['menos15'];

$mas16 = $_POST['mas16'];
$menos16 = $_POST['menos16'];

$mas17 = $_POST['mas17'];
$menos17 = $_POST['menos17'];

$mas18 = $_POST['mas18'];
$menos18 = $_POST['menos18'];

$mas19 = $_POST['mas19'];
$menos19 = $_POST['menos19'];

$mas20 = $_POST['mas20'];
$menos20 = $_POST['menos20'];

$mas21 = $_POST['mas21'];
$menos21 = $_POST['menos21'];

$mas22 = $_POST['mas22'];
$menos22 = $_POST['menos22'];

$mas23 = $_POST['mas23'];
$menos23 = $_POST['menos23'];

$mas24 = $_POST['mas24'];
$menos24 = $_POST['menos24'];

$mas25 = $_POST['mas25'];
$menos25 = $_POST['menos25'];

$mas26 = $_POST['mas26'];
$menos26 = $_POST['menos26'];

$mas27 = $_POST['mas27'];
$menos27 = $_POST['menos27'];

$mas28 = $_POST['mas28'];
$menos28 = $_POST['menos28'];

$g1 = $mas1.'-'.$menos1;
$g2 = $mas2.'-'.$menos2;
$g3 = $mas3.'-'.$menos3;
$g4 = $mas4.'-'.$menos4;
$g5 = $mas5.'-'.$menos5;
$g6 = $mas6.'-'.$menos6;
$g7 = $mas7.'-'.$menos7;
$g8 = $mas8.'-'.$menos8;
$g9 = $mas9.'-'.$menos9;
$g10 = $mas10.'-'.$menos10;
$g11 = $mas11.'-'.$menos11;
$g12 = $mas12.'-'.$menos12;
$g13 = $mas13.'-'.$menos13;
$g14 = $mas14.'-'.$menos14;
$g15 = $mas15.'-'.$menos15;
$g16 =  $mas16.'-'.$menos16;
$g17 = $mas17.'-'.$menos17;
$g18 = $mas18.'-'.$menos18;
$g19 = $mas19.'-'.$menos19;
$g20 = $mas20.'-'.$menos20;
$g21 = $mas21.'-'.$menos21;
$g22 = $mas22.'-'.$menos22;
$g23 = $mas23.'-'.$menos23;
$g24 = $mas24.'-'.$menos24;
$g25 = $mas25.'-'.$menos25;
$g26 = $mas26.'-'.$menos26;
$g27 = $mas27.'-'.$menos27;
$g28 = $mas28.'-'.$menos28;


$examen = new Examenes;
$examen->updateFormatDisc($id,$g1,$g2,$g3,$g4,$g5,$g6,$g7,$g8,$g9,$g10,$g11,$g12,$g13,$g14,$g15,$g16,$g17,$g18,$g19,$g20,$g21,$g22,$g23,$g24,$g25,$g26,$g27,$g28);

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
                        Se le comunica que ha redido la prueba satisfactoriamente.
<br><br>

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
$título = 'Examen Bapp - Formato Disco';

// Cabeceras adicionales
$cabeceras .= 'To: '.$SESSION['postulante'].$SESSION['lastname'].' <'.$SESSION['email'].'>' . "\r\n";
$cabeceras .= 'From: Bapp <no-reply@bapp.cl>' . "\r\n";
$cabeceras .= "Content-type:text/html;charset=UTF-8";

mail($_SESSION['email'], $título, $template, $cabeceras);

$name = ucwords($SESSION['postulante']." ".$SESSION['lastname']);

$n = new Notificaciones();
$n->Notificacion("El usuario $name ha realizado el examen, formato disco satisfactoriamente ", $name);

header('Location: ../../formatoDisc.php');