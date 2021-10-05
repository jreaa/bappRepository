<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Limpieza;
use Carbon\Carbon;

class LimpiezaController extends Controller
{
    public function index()
    {
        $limpiezas = Limpieza::paginate(5)->where('id_postulante', \Auth::user()->id_postulante);
        return view('limpieza.index', compact('limpiezas'));
    }

    public function update(Request $request, $id)
    {
       $limpiezas = Limpieza::findOrFail($id);

       $limpiezas->update([
           'status' => 'realizado',
           'hora'   =>  Carbon::now()
       ]);
        return redirect()->back()->with('success', 'Datos Actualizados');
    }

    public function destroy(Request $request, $id)
    {
        $limpiezas = Limpieza::findOrFail($id);
        $limpiezas->delete();
        return redirect()->back();
    }
}
