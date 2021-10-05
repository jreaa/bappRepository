<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;
use App\Models\Limpieza;

class limpiezaController extends Controller
{
     public function index(Request $request)
    {
        $date = date('d-m-Y');
        
        $limpieza = DB::table('limpieza')->where('id_postulante', $request->id)->orderBY('date','DESC')->take(10)->get() ;
        return response()->json($limpieza);
    }
}
//Limpieza::all()->where('id_postulante', $request->id)