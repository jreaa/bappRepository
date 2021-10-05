<?php

namespace App\Http\Controllers;
use App\Models\ControlTemperatura;


use Illuminate\Http\Request;

class ControlTmpController extends Controller
{
    public function index(Request $request)
    {
        $date = date('d-m-Y');
        
        $control = ControlTemperatura::latest()->where('id_postulante', $request->id)->where('date',$date)->get();
        return response()->json($control);
    }
/*
    public function update(Request $request){
       ControlTmp::where('id', $request->id)->update([
        "temperatura" => $request->temperatura
       ]);
       return response()->json("Actualizado!");
    }
    */
}
