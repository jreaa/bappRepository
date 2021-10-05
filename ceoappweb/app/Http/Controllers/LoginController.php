<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Login;

class LoginController extends Controller
{
    public function index(Request $request)
    {
        $rut = $request->rut;
        $password = $request->password;

        $users = Login::where('rut', $rut)->get();
        

        if(!empty($users[0])){
            foreach($users as $user ){
                $pass = $user->password;
                $id_u = $user->id;
                
            }
            $person = DB::table('postulante')->where('rut', '=',$rut )->get();

            foreach($person as $per){
                $n = $per->name;
                $lastname = $per->lastname;
                $img = $per->img;
                $cargo = $per->cargo_postular;
                $email = $per->email;
                $cel = $per->phone;
                $direccion = $per->address;
                $id = $per->id;
            }
            
            
            $name = $n;
            
            
            $v = DB::table('vinculacion')->where("id_postulante", "=", $id)->get();
            
            if(!empty($v[0])){
                foreach($v as $vi){ $id_vehiculo = $vi->id_vehiculo; }
            
    
                $vehiculo = DB::table('vehiculo')->where('id', '=', $id_vehiculo)->get();
                
                
                foreach($vehiculo as $ve){
                    $vehiculo = $ve->nvehiculo;
                    $placa = $ve->nplaca;
                    $modelo = $ve->modelo;
                    $color = $ve->color;
                    $marca = $ve->marca;
                    $anio = $ve->año;
                }
                
            }else{
                 $vehiculo =  "Sin Asignar"; $placa = "Sin Asignar";$modelo = "Sin Asignar"; $color = "Sin Asignar";$marca = "Sin Asignar"; $anio = "Sin Asignar";
            }
            

            if (password_verify($password,$pass)) {
                
                $json = ["response" => "ok", "user_id" => $id_u, "name" => $name, "img" => $img, "cargo" => $cargo, "email" => $email, "cel" => $cel, "direccion" => $direccion, "vehiculo" => $vehiculo, "placa" => $placa, "modelo" => $modelo, "color" => $color, "marca" => $marca, "anio" => $anio];
                return response()->json($json);

            }else{
                return response()->json('false');
            }
        }else{
            return response()->json('false1');
        }
        
    }
}
