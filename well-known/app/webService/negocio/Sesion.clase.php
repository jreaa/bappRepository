<?php
    
    require_once '../datos/conexion.php';
    
    class Sesion extends Conexion {
        
        public function iniciarSesion($rut, $clave) {
            $sql = "select * from user where name = :em";
            
            $sentencia = $this->dblink->prepare($sql);
            $sentencia->bindParam(":em", $rut);
            $sentencia->execute();
            
            if ($sentencia->rowCount()<=0){
                return FALSE;
            }
            
            $resultado = $sentencia->fetchObject();
            
            if (password_verify($clave,$resultado->password)){
                return TRUE;
            }
            
            return FALSE;

        }
        
        public function obtenerNombreUsuario($rut){
            $sql = "select name from postulante where rut = :em";
            
            $sentencia = $this->dblink->prepare($sql);
            $sentencia->bindParam(":em", $rut);
            $sentencia->execute();
            
            $resultado = $sentencia->fetchObject();
            
            return $resultado->name;
        }
  
  public function obtenerCodigoUsuario($rut){
            $sql = "select id from postulante where rut = :em";
            
            $sentencia = $this->dblink->prepare($sql);
            $sentencia->bindParam(":em", $rut);
            $sentencia->execute();
            
            $resultado = $sentencia->fetchObject();
            
            return $resultado->id;
        }
        public function obtenerEmailUsuario($rut){
            $sql = "select email from postulante where rut = :em";
            
            $sentencia = $this->dblink->prepare($sql);
            $sentencia->bindParam(":em", $rut);
            $sentencia->execute();
            
            $resultado = $sentencia->fetchObject();
            
            return $resultado->email;
        }
        public function obtenerTelefonoUsuario($rut){
            $sql = "select phone from postulante where rut = :em";
            
            $sentencia = $this->dblink->prepare($sql);
            $sentencia->bindParam(":em", $rut);
            $sentencia->execute();
            
            $resultado = $sentencia->fetchObject();
            
            return $resultado->phone;
        }
        public function obtenerDireccionUsuario($rut){
            $sql = "select address from postulante where rut = :em";
            
            $sentencia = $this->dblink->prepare($sql);
            $sentencia->bindParam(":em", $rut);
            $sentencia->execute();
            
            $resultado = $sentencia->fetchObject();
            
            return $resultado->address;
        } 
    }
?>