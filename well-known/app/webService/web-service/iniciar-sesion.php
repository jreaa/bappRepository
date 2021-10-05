<?php


    if (isset($_POST["rut"])){
        $rut = $_POST["rut"];
    }else{
        $rut = "";
    }
    
    if (isset($_POST["clave"])){
        $clave = $_POST["clave"];
    }else{
        $clave = "";
    }

    $respuesta = null;
    
    if ( ! isset($_POST["rut"])){
         $respuesta = array(
             "estado"=>"error",
             "datos"=>""
         );
         echo json_encode($respuesta);
         exit();
    }
    
    
    require_once '../negocio/Sesion.clase.php';
    $objSesion = new Sesion();
    
    if ($objSesion->iniciarSesion($rut, $clave)){
        $respuesta = array(
            "estado"=>"exito",
            "datos"=>array(
                "nombre"=>$objSesion->obtenerNombreUsuario($rut),
                "rut"=>$rut,
                "id"=>$objSesion->obtenerCodigoUsuario($rut),
                "email"=>$objSesion->obtenerEmailUsuario($rut),
                "direccion"=>$objSesion->obtenerDireccionUsuario($rut),
                "telefono"=>$objSesion->obtenerTelefonoUsuario($rut)

            )
        );
    }else{
        $respuesta = array(
            "estado"=>"error",
            "datos"=>""
        );
    }
    
    echo json_encode($respuesta);
    
?>