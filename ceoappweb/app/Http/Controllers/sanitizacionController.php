<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Sanitizacion;


class sanitizacionController extends Controller
{
    public function index(Request $request)
    {
        $sanitizaciones = DB::table('sanitizacion')->where('id_postulante', $request->id)->orderBY('date','DESC')->take(10)->get() ;
        return response()->json($sanitizaciones);
    }
}
//Sanitizacion::all()->where('id_postulante', $request->id)