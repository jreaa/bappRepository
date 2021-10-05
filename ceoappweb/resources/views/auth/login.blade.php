@extends('layouts.main', ['class' => 'off-canvas-sidebar', 'activePage' => 'login', 'title' => __('CEO - BAPP')])

@section('content')
<div class="container" style="height: auto;">
  <div class="row align-items-center">
    <div class="col-md-9 ml-auto mr-auto mb-3 text-center">
      <h3>{{ __('Bienvenido') }} </h3>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-8 ml-auto mr-auto">
      <form class="form" method="POST" action="{{ route('login') }}">
        @csrf

        <div class="card card-login card-hidden mb-3">
          <div class="card-header card-header-primary text-center" style="background:#bbbb">
            <h4 class="card-title"><strong style="color:#496CAD">{{ __('Inicio de Sesion') }}</strong></h4>
            <img src="{{ asset('img/Bapp.png') }}" alt="bapp logo" style="width:90%; height:80px">
          </div>
          <div class="card-body">
            <p class="card-description text-center">{{ __('Entrar con sus credenciales, rut: ') }} <strong>12345678-9</strong> {{ __(' y contraseña. ') }}</p>
            <div class="bmd-form-group{{ $errors->has('email') ? ' has-danger' : '' }}">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="material-icons">face</i>
                  </span>
                </div>
                <input type="text" name="rut" class="form-control" placeholder="{{ __('12345678-9') }}" value="{{ old('rut', null) }}" required autofocus>
              </div>
              @if ($errors->has('rut'))
                <div id="rut-error" class="error text-danger pl-3" for="rut" style="display: block;">
                  <strong>{{ $errors->first('rut') }}</strong>
                </div>
              @endif
            </div>
            <div class="bmd-form-group{{ $errors->has('password') ? ' has-danger' : '' }} mt-3">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="material-icons">lock_outline</i>
                  </span>
                </div>
                <input type="password" name="password" id="password" class="form-control" placeholder="{{ __('Password...') }}" required>
              </div>
              @if ($errors->has('password'))
                <div id="password-error" class="error text-danger pl-3" for="password" style="display: block;">
                  <strong>{{ $errors->first('password') }}</strong>
                </div>
              @endif
            </div>
            <div class="form-check mr-auto ml-3 mt-3">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> {{ __('Mantener Sesion') }}
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
          </div>
          <div class="card-footer justify-content-center">
            <button type="submit" class="btn btn-primary btn-link btn-lg">{{ __('Iniciar Sesion') }}</button>
          </div>
        </div>
      </form>
      <div class="row">
        <div class="col-6">
            @if (Route::has('password.request'))
                <a href="{{ route('password.request') }}" class="text-light">
                    <small>{{ __('Olvido su contraseña?') }}</small>
                </a>
            @endif
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
