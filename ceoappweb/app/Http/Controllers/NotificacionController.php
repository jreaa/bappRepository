<?php
/*

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Notificacion;

class NotificacionController extends Controller
{
    public function index()
    {
        $notificaciones = Notificacion::paginate(5)->where('id_postulante', \Auth::user()->id_postulante);
        return view('notificacion.index', compact('notificaciones'));
    }
}
