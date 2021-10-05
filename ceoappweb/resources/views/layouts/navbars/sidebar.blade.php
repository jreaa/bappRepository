<div class="sidebar" data-color="orange" data-background-color="white" data-image="{{ asset('material') }}/img/sidebar-1.jpg">
  <!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

      Tip 2: you can also add an image using data-image tag
  -->
  <div class="logo">
    <a href="#" class="simple-text logo-normal">
      <img src="{{ asset('img/Bapp.png') }}" alt="Logo Bapp" style="width:80%;height:60px">
    </a>
  </div>
  <div class="sidebar-wrapper">
    <ul class="nav">
      <li class="nav-item{{ $activePage == 'dashboard' ? ' active' : '' }}">
        <a class="nav-link" href="{{ route('home') }}">
          <i class="material-icons">dashboard</i>
            <p>{{ __('Panel de Control') }}</p>
        </a>
      </li>
      <li class="nav-item {{ ($activePage == 'profile' || $activePage == 'user-management') ? ' active' : '' }}">
        <a class="nav-link" data-toggle="collapse" href="#laravelExample" aria-expanded="true">
          <i><img style="width:25px" src="{{ asset('img/laravel.svg') }}"></i>
          <p>{{ __('Protocolos') }}
            <b class="caret"></b>
          </p>
        </a>
        <div class="collapse show" id="laravelExample">
          <ul class="nav">
            <li class="nav-item{{ $activePage == 'controlTemp' ? ' active' : '' }}">
              <a class="nav-link" href="{{ route('control_temp') }}">
                <span class="sidebar-mini"> CT </span>
                <span class="sidebar-normal">{{ __('Control Temperatura') }} </span>
              </a>
            </li>
            <li class="nav-item{{ $activePage == 'sanitizacion' ? ' active' : '' }}">
              <a class="nav-link" href="{{ route('sanitizacion') }}">
                <span class="sidebar-mini"> SN </span>
                <span class="sidebar-normal"> {{ __('Sanitizacion ') }} </span>
              </a>
            </li>
            <li class="nav-item{{ $activePage == 'limpieza' ? ' active' : '' }}">
              <a class="nav-link" href="{{ route('limpieza') }}">
                <span class="sidebar-mini"> LP </span>
                <span class="sidebar-normal"> {{ __('Limpieza') }} </span>
              </a>
            </li>
          </ul>
        </div>
      </li>
      <!--
      <li class="nav-item{{ $activePage == 'test' ? ' active' : '' }}">
        <a class="nav-link" href="#">
          <i class="material-icons">edit</i>
            <p>{{ __('Examenes') }}</p>
        </a>
      </li>
      <li class="nav-item{{ $activePage == 'notificacion' ? ' active' : '' }}">
        <a class="nav-link" href="#">
          <i class="material-icons">circle_notifications</i>
            <p>{{ __('Notificaciones') }}</p>
        </a>
      </li>
      <li class="nav-item{{ $activePage == 'mantenciones' ? ' active' : '' }}">
        <a class="nav-link" href="{{ route('mantencion') }}">
          <i class="material-icons">car_repair</i>
            <p>{{ __('Mantenimiento') }}</p>
        </a>
      </li>
      <li class="nav-item{{ $activePage == 'documentaria' ? ' active' : '' }}">
        <a class="nav-link" href="{{ route('documentaria') }}">
          <i class="material-icons">file_present</i>
            <p>{{ __('Documentaria') }}</p>
        </a>
      </li>
      <li class="nav-item{{ $activePage == 'typography' ? ' active' : '' }}">
        <a class="nav-link" href="#">
          <i class="material-icons">message</i>
            <p>{{ __('Mensajes') }}</p>
        </a>
      </li>
      -->
    </ul>
  </div>
</div>
