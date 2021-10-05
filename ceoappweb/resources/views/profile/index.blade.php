@extends('layouts.main', ['activePage' => 'profile', 'titlePage' => 'Profile'])

@section('content')
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Profile</h4>
                                <p class="card-category">Datos de Pefil</p>
                            </div>
                            <div class="card-body">
                                @if(session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                                @elseif(session('danger'))
                                <div class="alert alert-danger">
                                    {{ session('danger') }}
                                </div>
                                @endif
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="card">
                                        <div class="card-header card-header-primary">
                                            <h4 class="card-title">Cambiar Contraseña</h4>
                                            <p class="card-category">Ingresar los datos</p>
                                        </div>
                                        <form action="{{ route('profile.update') }}" method="post">
                                        @csrf
                                        @method('PUT')

                                        <div class="card-body ">
                                            <div class="row">
                                                
                                                
                                                <label class="col-sm-2 col-form-label" for="input-current-password">Contraseña Actual</label>
                                                <div class="col-sm-7">
                                                    <div class="form-group bmd-form-group">
                                                    <input class="form-control" input="" type="password" name="old_password" id="input-current-password" placeholder="Contraseña Actual" value="" required="">
                                                                        </div>
                                                </div>
                                                </div>
                                                <div class="row">
                                                <label class="col-sm-2 col-form-label" for="input-password">Nueva Contraseña</label>
                                                <div class="col-sm-7">
                                                    <div class="form-group bmd-form-group">
                                                    <input class="form-control" name="password" id="input-password" type="password" placeholder="Nueva Contraseña" value="" required="">
                                                                        </div>
                                                </div>
                                                </div>
                                                <div class="row">
                                                <label class="col-sm-2 col-form-label" for="input-password-confirmation">Confirmar Contraseña</label>
                                                <div class="col-sm-7">
                                                    <div class="form-group bmd-form-group">
                                                    <input class="form-control" name="password_confirmation" id="input-password-confirmation" type="password" placeholder="Confirmar Contraseña" value="" required="">
                                                    </div>
                                                </div>
                                                
                                                
                                                </div>
                                                <br>
                                                <button type="submit" class="btn btn-success ">Actualizar</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card card-user">
                                            <div class="card-body">
                                                @foreach($profiles as $profile)
                                                <p class="card-text">
                                                    <div class="auth">
                                                        <a href="#">
                                                            <div style="padding:10px">
                                                                <img src="http://oca.soporbapp.cl/archivos/{{ $profile->img }}" alt=""  class="avatar img-circle img-thumbnail" style="width: 75%;margin-left: 30px;height: 200px;">
                                                            </div>
                                                            <h5 class="title mt-3">
                                                                <span style="font-weight: bold">Nombre:</span> {{$profile->name.' '.$profile->lastname}} 
                                                            </h5>
                                                        </a>
                                                        <p class="description">
                                                        <span style="font-weight: bold">Email:</span> {{ $profile->email }} <br>
                                                        <span style="font-weight: bold"> Direccion:</span> {{ $profile->address }} <br>
                                                        <span style="font-weight: bold">Fecha de nacimiento: </span>{{ $profile->date_born }} <br>
                                                        <span style="font-weight: bold">Telefono: </span> +56 {{ $profile->phone }}
                                                        </p>
                                                    </div>
                                                </p>
                                                <div class="card-description"></div>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer mr-auto">
                               
                            </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
@endsection