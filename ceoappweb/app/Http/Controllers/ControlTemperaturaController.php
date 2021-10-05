<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ControlTemperatura;
use Carbon\Carbon;

class ControlTemperaturaController extends Controller
{
    public function index()
    {
        $controlesTemperatura = ControlTemperatura::all()->where('id_postulante', \Auth::user()->id);
        return view('controlTemperatura.index', compact('controlesTemperatura'));
    }

    public function edit(ControlTemperatura $control)
    {
        return view('controlTemperatura.edit', compact('control'));
    }

    public function update(Request $request, $id)
    {
       
       $controlTemperatura = ControlTemperatura::findOrFail($id);
       $controlTemperatura->update([
           'status'      => 'realizado', 
           'hora'        =>  Carbon::now(),
           'temperatura' => $request->temperatura
       ]);
        return redirect()->route('control_temp')->with('success', 'Datos Actualizados');
    }

    public function destroy(Request $request, $id)
    {
        $controlTemperatura = ControlTemperatura::findOrFail($id);
        $controlTemperatura->delete();
        return redirect()->back();
    }

}
