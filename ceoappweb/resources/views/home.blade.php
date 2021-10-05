@extends('layouts.main', ['activePage' => 'dashboard', 'titlePage' => __('Dashboard')])

@section('content')
<div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-3 col-md-6 col-sm-6">
          <div class="card card-stats">
            <div class="card-header card-header-danger card-header-icon">
              <div class="card-icon">
               <a href="#" style="color:#fff"><i class="material-icons">circle_notifications</i></a> 
              </div>
              <p class="card-category">Notificaciones</p>
              <h3 class="card-title">0
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
          <div class="card card-stats">
            <div class="card-header card-header-info card-header-icon">
              <div class="card-icon">
                <a href="#" style="color:#fff"><i class="material-icons">edit</i></a>
              </div>
              <p class="card-category">Examenes</p>
              <h3 class="card-title">0</h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
          <div class="card card-stats">
            <div class="card-header card-header-warning card-header-icon">
              <div class="card-icon">
                <a href="#" style="color:#fff"><i class="material-icons">car_repair</i></a>
              </div>
              <p class="card-category">Mantenimientos</p>
              <h3 class="card-title">0</h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
          <div class="card card-stats">
            <div class="card-header card-header-success card-header-icon">
              <div class="card-icon">
              <i class="material-icons">message</i>
              </div>
              <p class="card-category">Mensajes</p>
              <h3 class="card-title">+245</h3>
            </div>
          </div>
        </div>

        
      </div>
    </div>
  </div>
@endsection
