<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Sanitizacion;


class sanoUpdateController extends Controller
{
    public function index(Request $request){
        Sanitizacion::where('id', $request->id)->update([
         "status"      => "realizado",
         'hora'   =>  Carbon::now()
        ]);
        return response()->json("Actualizado!");
     }
}
