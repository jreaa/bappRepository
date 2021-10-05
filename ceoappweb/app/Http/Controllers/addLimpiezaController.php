<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Limpieza;

class addLimpiezaController extends Controller
{
     public function index(Request $request)
    {
        $date = date('d-m-Y');
        
        Limpieza::create([
            'date' => $date,
            'status'      => "realizado",
            'hora'   =>  Carbon::now(),
            'id_postulante' => $request->id
        ]);
        return response()->json(['ok' => 'Limpieza creada satisfactoriamente']);
    }
}
