<?php 


$nombre = $_POST['nombre'];
$correo = $_POST['email'];
$asunto = $_POST['asunto'];


// título
$título = 'Entrevista Bapp';

// mensaje
$mensaje = '
<html>
<head>
  <title>Entrevista Bapp</title>
</head>
<body>
  <p>¡Estos es un asusto '.$asunto.'!</p>

</body>
</html>
';

// Cabeceras adicionales
$cabeceras .= 'To: '.$nombre.' <'.$correo.'>' . "\r\n";
$cabeceras .= 'From: Bapp <no-reply@bapp.cl>' . "\r\n";

// Enviarlo

if(mail($correo, $título, $mensaje, $cabeceras)){
    echo "enviado";
}

