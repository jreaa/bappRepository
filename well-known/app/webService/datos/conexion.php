<?php

    class Conexion {

        protected $dblink;
                
        function __construct() {
            $servidor = "mysql:host=localhost;dbname=sopo77862_oca2";
            $usuario = "sopo77862_oca_test";
            $clave = "NBUSJI1%hWQ-";
            
            $this->dblink = new PDO($servidor, $usuario, $clave);
            $this->dblink->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->dblink->exec("SET NAMES utf8");
        }
        
}

?>