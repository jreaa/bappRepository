<?php

namespace App\Http\Controllers;

use App\Models\Test;
use Illuminate\Http\Request;

class TestController extends Controller
{
    public function index()
    {
        $tests = test::paginate(5)->where('id_postulante', \Auth::user()->id_postulante);
        return view('tests.index', compact('tests'));
    }
}
