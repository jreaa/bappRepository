<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Profile;
use App\Models\User;

class ProfileController extends Controller
{
    public function index()
    {
        $profiles = Profile::paginate(5)->where('id', \Auth::user()->id_postulante);
        return view('profile.index', compact('profiles'));
    }

    public function update(Request $request)
    {

        $profiles = User::all()->where('id', \Auth::user()->id_postulante);
        foreach($profiles as $profile){
            $pass = $profile['password'];
        }

        if(password_verify($request->old_password, $pass)){
            if($request->password == $request->password_confirmation){
                $user = User::FindOrFail(\Auth::user()->id_postulante);
                $user->update([
                    'password' => bcrypt($request->password)
                ]);
            }else {
                return redirect()->back()->with('danger', 'Las contraseñas no coinciden');
            }
        }else{
            return redirect()->back()->with('danger', 'La contraseña anterior no coincide');
        }

        return redirect()->back()->with('success', 'Datos Actualizados');;
    }
}
