<?php 
session_start();
include('../../vendor/autoload.php');
include('../AddUser/AddUsers.php');
include('../PrivilegesModulo/PrivilegesModulo.php');

include('../Database/Database.php');
use Illuminate\Database\Capsule\Manager as DB;


if(isset($_POST['btn'])){
    

    $name = strtolower($_POST['name']);
    $lastname= strtolower($_POST['lastname']);
    $position= strtolower($_POST['position']);
    $usuario= strtolower($_POST['usuario']);
    $password= strtolower($_POST['password']);
    $privileges= (int) $_POST['privileges'];
    
    
     try{
        
        $addUser = new AddUser;
        $addUser->addNewUser($name, $lastname, $position, $privileges,$usuario,$password);
        
        if($privileges = "2"){
             //añadiento los permisos
        
            if(isset($_POST['1'])){
                $mod1 = true;
            }else{
                $mod1 = false;
            }
            
            if(isset($_POST['2'])){
                $mod2 = true;
            }else{
                $mod2 = false;
            }
            
            if(isset($_POST['3'])){
                $mod3 = true;
            }else{
                $mod3 = false;
            }
            
            if(isset($_POST['4'])){
                $mod4 = true;
            }else{
                $mod4 = false;
            }
            if(isset($_POST['5'])){
                $mod5 = true;
            }else{
                $mod5 = false;
            }
            
            if(isset($_POST['6'])){
                $mod6 = true;
            }else{
                $mod6 = false;
            }
            
            if(isset($_POST['7'])){
                $mod7 = true;
            }else{
                $mod7 = false;
            }
            
            $privilegesModulo = new PrivilegesModulo;
            $privilegesModulo->addPrivileges($mod1,$mod2,$mod3,$mod4,$mod5,$mod6,$mod7);
            //fin
        }
        
        $_SESSION['u'] = "Usted ha agreado un nuevo usuario satisfactoriamente";
        header("Location: ../../../privileges.php");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }

}else{
    header("Location: ../../../privileges.php");
}