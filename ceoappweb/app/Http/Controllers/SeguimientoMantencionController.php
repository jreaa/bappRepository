<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SeguimientoMantencion;

class SeguimientoMantencionController extends Controller
{
    public function upadteSeguimiento1(Request $request, $id)
    {
        $seguimiento = SeguimientoMantencion::findOrFail($id);

        $seguimiento->update([
            'e_taller' => 1,
        ]);
         return redirect()->back()->with('success', 'Datos Actualizados');
    }
    public function upadteSeguimiento2(Request $request, $id)
    {
        $seguimiento = SeguimientoMantencion::findOrFail($id);

        $seguimiento->update([
            'e_vehiculo' => 1,
        ]);
         return redirect()->back()->with('success', 'Datos Actualizados');
    }
    public function upadteSeguimiento3(Request $request, $id)
    {
        $seguimiento = SeguimientoMantencion::findOrFail($id);

        $seguimiento->update([
            'i_taller' => 1,
        ]);
         return redirect()->back()->with('success', 'Datos Actualizados');
    }
    public function upadteSeguimiento4(Request $request, $id)
    {
        $seguimiento = SeguimientoMantencion::findOrFail($id);

        $seguimiento->update([
            'r_conductor' => 1,
        ]);
         return redirect()->back()->with('success', 'Datos Actualizados');
    }
}
