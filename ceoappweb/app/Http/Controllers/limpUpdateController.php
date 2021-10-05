<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Limpieza;
use Carbon\Carbon;

class limpUpdateController extends Controller
{
    public function index(Request $request){
        Limpieza::where('id', $request->id)->update([
         "status"      => "realizado",
         'hora'   =>  Carbon::now()
        ]);
        return response()->json("Actualizado!");
    }
}
