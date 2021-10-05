<?php 

session_start();
if(isset($_POST['btn'])){
    $name    = $_POST['name'];
    $email   = $_POST['email'];
    $subject = $_POST['subject'];
    $message = $_POST['message'];
    $me = 'Jose Era Programador';
    $myEmail = 'jera@joseera.com';

    if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        $msg = "El email es invalido";
    }

    if(!var_dump(strlen($name) > 30 || $name == "")){
        $template = 
        "
        Jose,<br>

        A continuacion se agregaran los datos recopilados:<br> 

            <strong>Nombre:</strong> $name <br>
            <strong>Mesaje:</strong> <br><br>
                $subject
        <br><br>
        Eres el mejor.<br>
        ";

        // título
        $título = 'Contacto Mi Sitio Web';

        // Cabeceras adicionales
        $cabeceras = 'To: '.$name.' <'.$myEmail.'>' . "\r\n";
        $cabeceras .= 'From: '.$name.' '.$email. "\r\n";
        $cabeceras .= "Content-type:text/html;charset=UTF-8";


        mail($myEmail, $título, $template, $cabeceras);

    }
    
        $_SESSION['mail'] = "Gracias, pronto me contactare contigo!!";
 
    header("Location: index.php");

}else{
    header("Location: index.com");
    $_SESSION['mail'] = "Su mensaje no ha podido ser enviado";
}