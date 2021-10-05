<?php

namespace App\Http\Controllers;
use App\Models\ControlTemperatura;


use Illuminate\Http\Request;

class ControlUpdate extends Controller
{
    public function index(Request $request){
        ControlTemperatura::where('id', $request->id)->update([
         "temperatura" => $request->temperatura,
         "status"      => "realizado"
        ]);
        return response()->json("Actualizado!");
     }
}
