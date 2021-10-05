<?php
include('../../vendor/autoload.php');
include('../Database/Database.php');
include('../Mail/Mail.php');

use Illuminate\Database\Capsule\Manager as DB;

try{
	if(isset($_POST['btn'])){
		$id = $_POST['postulante'];
		$title_id = $_POST['title_id'];
	}
}catch(PDOException $p){
	echo $e;
}

$test_postulante = DB::table('test_postulante')->insert([
	'id_postulante' => $id,
	'id_test' => $title_id
]);

$postulante = DB::table('postulante')->where('id', '=', $id)->get();
$array = json_decode(json_encode($postulante), True);

foreach ($array as $row ) {
	$name = $row['name'];
	$lastname = $row['lastname'];
	$email = $row['email'];
}


$template = 
'
<div style="background-color: #f5f5f5;">
	<main style="margin:50px;padding: 20px;border: 1px solid #dee2e6;background-color: #fff;border-radius: 5px;text-align: center;">
		<div style="padding: 50px">
			<h3 style="margin-bottom: 10px;font-size: 50px;margin-bottom: 10px;">Saludos Cordiales!</h3>
			<p style="font-size: 25px;margin-bottom: 50px;color: #666666;">A continuacion se agregaran los datos recopilados en la cita: </p>

			<h4>Nombre: '.$name.' '.$lastname.'</h4>
			<h4>¡Ya se ha registrado su prueba diagnostica!</h4>
			<h4>Por favor rendirla para poder verificar sus conocimientos en el tema</h4>

			<h3 style="margin-bottom: 50px;">Comentarios de su interes: </h3>
			<p style="font-size: 25px;margin-bottom: 50px;color: #666666;"> Instrucciones: <br> 1.-Ingresar con su usuario y contraseña <br> 2.-Seleccionar el del buzon <br> A continuacion se le mostrara la prueba a presentar ¡Suerte!</p>
		</div>

		<div style="padding: 50px">
			<img src="https://www.bapp.cl/images/LogoPX_Bapp_web.png" width="250">
		</div>
	</main>

</div>
';

Mail::sendMail($email, $name.' '.$lastname, '', 'CITA BAPP', $template);

header('Location: ../../test.php');