<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Documentaria;

class DocumentariaController extends Controller
{
    public function index()
    {
        $documentaria = Documentaria::all()->where('id_postulante', \Auth::user()->id_postulante);
        return view('documentaria.index', compact('documentaria'));
    }

    public function update(Request $request, $id)
    {
        $documentaria = Documentaria::findOrFail($id);

        $request->validate([
            'file' => "image|max:2048"
        ]);
        
        $imagen = $request->file('file')->store('public');
        $url = Storage::url($imagen);
        

        $documentaria->update([
            'cedula_front' => $url
        ]);
    }
}
