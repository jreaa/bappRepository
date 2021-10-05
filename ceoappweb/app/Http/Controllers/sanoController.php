<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sanitizacion;

class sanoController extends Controller
{
    public function index(Request $request)
    {
        $date = date('d-m-Y');
        
        $sanitizaciones = Sanitizacion::all()->where('id_postulante', $request->id)->where('date',$date);
        return response()->json($sanitizaciones);
    }
}
