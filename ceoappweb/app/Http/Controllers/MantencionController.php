<?php

namespace App\Http\Controllers;

use App\Models\Mantencion;
use App\Models\SeguimientoMantencion;
use Illuminate\Http\Request;

class MantencionController extends Controller
{
    public function index()
    {
        $mentenciones = Mantencion::paginate(5)->where('id_postulante', \Auth::user()->id_postulante);
        return view('mantencion.index', compact('mentenciones'));
    }

    public function edit(Mantencion $mantencion)
    {
        $seguimiento = SeguimientoMantencion::all()->where('id_mantencion', $mantencion->id);
        return view('mantencion.edit', compact('mantencion', 'seguimiento'));
    }

    public function update(Request $request, $id)
    {
        $mantencion = Mantencion::findOrFail($id);

        $mantencion->update([
            'status' => 'realizado',
        ]);
        return redirect()->route('mantencion')->with('success', 'Datos Actualizados');
    }
    public function destroy(Request $request, $id)
    {
        $mantencion = Mantencion::findOrFail($id);
        $mantencion->delete();
        return redirect()->back();
    }
}
