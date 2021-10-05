<?php 
session_start();
include('../../vendor/autoload.php');
include('../AddUser/AddUsers.php');
include('../Upload/Upload.php');
include('../PrivilegesModulo/PrivilegesModulo.php');

var_dump($_POST);

if(isset($_POST['btn'])){
    
    
    $id = strtolower($_POST['id']);
    $name = strtolower($_POST['name']);
    $lastname = strtolower($_POST['lastname']);
    $usuario = strtolower($_POST['usuario']);
    $position = strtolower($_POST['position']);
    $privileges = strtolower($_POST['privileges']);
    
    if(!$_FILES['img']['name'] == ""){
        $namefile = $_FILES['img']['name'];
        $tmp_name = $_FILES['img']['tmp_name'];
        //Importando img al servidor y base de datos
        $upload = new Upload;
        $upload->addImg($namefile,$tmp_name,"privileges",$id);
    }
     
    try{
        $addUser = new AddUser;
        $addUser->updateUser($id, $name,$lastname,$usuario,$position,$privileges);
            if($privileges = "2"){
             //a単adiento los permisos
        
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
            $privilegesModulo->updatePrivileges($mod1,$mod2,$mod3,$mod4,$mod5,$mod6,$mod7,$id);
            //fin
        }
        
        if(!$_POST['password'] == ""){
            $password = $_POST['password'];
            $addUser->updatePassword($id, $password);
        }

        $_SESSION['u'] = "Usted ha editado un usuario satisfactoriamente";
        header("Location: ../../../editPrivileges.php?id=$id");

    }catch(PDOExecption $e){
        echo "Ha ocurrido el siguiente error: $e; <br> Por favor comunicarse con el administrador";
    }
}else{
    header("Location: ../../../privileges.php");
}