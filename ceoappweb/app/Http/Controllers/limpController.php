<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Limpieza;

class limpController extends Controller
{
    public function index(Request $request)
    {
        $date = date('d-m-Y');
        
        $limpieza = Limpieza::all()->where('id_postulante', $request->id)->where('date',$date);
        return response()->json($limpieza);
    }
}
