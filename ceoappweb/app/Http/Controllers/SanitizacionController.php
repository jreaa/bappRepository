<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sanitizacion;
use Carbon\Carbon;

class SanitizacionController extends Controller
{
    public function index()
    {
        $sanitizaciones = Sanitizacion::all()->where('id_postulante', \Auth::user()->id);
        return view('sanitizacion.index', compact('sanitizaciones'));
    }

    public function update(Request $request, $id)
    {
       $sanitizaciones = Sanitizacion::findOrFail($id);

       $sanitizaciones->update([
           'status' => 'realizado',
           'hora'   =>  Carbon::now()
       ]);
        return redirect()->back()->with('success', 'Datos Actualizados');
    }

    public function destroy(Request $request, $id)
    {
        $sanitizaciones = Sanitizacion::findOrFail($id);
        $sanitizaciones->delete();
        return redirect()->back();
    }
}
