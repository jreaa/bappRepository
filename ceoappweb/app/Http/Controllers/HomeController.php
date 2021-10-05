<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mantencion;
use App\Models\Notificacion;
use App\Models\Test;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        //$notificaciones = Notificacion::all()->where('id_postulante', \Auth::user()->id_postulante);
        //$tests = test::paginate(5)->where('id_postulante', \Auth::user()->id_postulante);
        $mentenciones = Mantencion::paginate(5)->where('id_postulante', \Auth::user()->id_postulante);
        return view('home', compact('mentenciones'));
    }
    
    public function auth()
    {
        if (\Auth::check()){
           if(\Auth::user()->etapa == 1){
              return view('layouts.main');   
           }
           else{
              return view('home');
           }
        }
    }
}
