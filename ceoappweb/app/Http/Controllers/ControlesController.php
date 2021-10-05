<?php

namespace App\Http\Controllers;
use App\Models\ControlTemperatura;
use Illuminate\Support\Facades\DB;


use Illuminate\Http\Request;

class ControlesController extends Controller
{
    public function index(Request $request)
    {
        $control = json_encode(DB::table('control_temp')->where('id_postulante', $request->id)->orderBY('date','DESC')->take(10)->get());
        return $control;
    }

}
//ControlTemperatura::latest()->where('id_postulante', $request->id)->orderBY('created_at','DESC')->take(10)