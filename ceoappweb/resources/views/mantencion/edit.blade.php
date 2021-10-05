@extends('layouts.main', ['activePage' => 'mantenciones', 'titlePage' => 'Mantenciones'])

@section('content')
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Mantencion</h4>
                                <p class="card-category">Mantencion</p>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <h4>Fecha de Solicitud</h4>
                                                        <p>{{ $mantencion->fecha_solicitud }}</p>
                                                        <h4>Patente</h4>
                                                        <p>{{ $mantencion->patente }}</p>
                                                        <h4>Modelo de Vehiculo</h4>
                                                        <p>{{ $mantencion->modelo_v }}</p>
                                                        <h4>Numero de Reserva</h4>
                                                        <p>{{ $mantencion->n_reserva }}</p>
                                                        <h4>Hora</h4>
                                                        <p>{{ $mantencion->hora }}</p>
                                                        <h4>Taller</h4>
                                                        <p>{{ $mantencion->taller }}</p>
                                                    </div>
                                                    <div class="col-md-6">
                                                    <h4>Fecha</h4>
                                                    <p>{{ $mantencion->fecha }}</p>
                                                    <h4>Direccion</h4>
                                                    <p>{{ $mantencion->direccion }}</p>
                                                    <h4>Tipo de Servicio</h4>
                                                    <p>{{ $mantencion->t_servicio }}</p>
                                                    <h4>Observaciones</h4>
                                                    <p>{{ $mantencion->observaciones }}</p>
                                                    <h4>Fecha de Entrega</h4>
                                                    <p>{{ $mantencion->fecha_entrega }}</p>
                                                    <h4>Resultado</h4>
                                                    <p>{{ $mantencion->resultado }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                    <div class="card">
                                            @foreach($seguimiento as $seg)
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead class="text-primary">
                                                            
                                                            <th>Llevo el vehiculo en el taller</th>
                                                            <th>Entrego el vehiculo en el taller</th>
                                                            <th>Ingreso el vehiculo en el taller</th>
                                                            <th>Recibio el vehiculo en el taller</th>
                                                            <th class="text-right"></th>
                                                        </thead>
                                                        <tbody>
                                                            
                                                            <tr>
                                                                <td class="td-actions">
                                                                @if($seg->e_taller == 0)
                                                                <form action="{{route('seguimiento1.update', $seg->id)}}" method="post">
                                                                    @csrf
                                                                    @method('PUT')
                                                                    <button type="submit" class="btn btn-danger">
                                                                        <i class="material-icons">close</i>
                                                                    </button>
                                                                </form>
                                                                
                                                                @else
                                                                <button type="submit" class="btn btn-success">
                                                                    <i class="material-icons">check_circle</i>
                                                                </button>
                                                                @endif
                                                                </td>
                                                                
                                                                <td class="td-actions">
                                                                @if($seg->e_vehiculo == 0)
                                                                <form action="{{route('seguimiento2.update', $seg->id)}}" method="post">
                                                                    @csrf
                                                                    @method('PUT')
                                                                    <button type="submit" class="btn btn-danger">
                                                                        <i class="material-icons">close</i>
                                                                    </button>
                                                                </form>
                                                                @else
                                                                <button type="submit" class="btn btn-success">
                                                                    <i class="material-icons">check_circle</i>
                                                                </button>
                                                                @endif
                                                                </td>

                                                                <td class="td-actions">
                                                                @if($seg->i_taller == 0)
                                                                <form action="{{route('seguimiento3.update', $seg->id)}}" method="post">
                                                                    @csrf
                                                                    @method('PUT')
                                                                    <button type="submit" class="btn btn-danger">
                                                                        <i class="material-icons">close</i>
                                                                    </button>
                                                                </form>
                                                                @else
                                                                <button type="submit" class="btn btn-success">
                                                                    <i class="material-icons">check_circle</i>
                                                                </button>
                                                                @endif
                                                                </td>

                                                                <td class="td-actions">
                                                                @if($seg->r_conductor == 0)
                                                                <form action="{{route('seguimiento4.update', $seg->id)}}" method="post">
                                                                    @csrf
                                                                    @method('PUT')
                                                                    <button type="submit" class="btn btn-danger">
                                                                        <i class="material-icons">close</i>
                                                                    </button>
                                                                </form>
                                                                @else
                                                                <button type="submit" class="btn btn-success">
                                                                    <i class="material-icons">check_circle</i>
                                                                </button>
                                                                @endif
                                                                </td>
                                                            </tr>
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                @if($seg->e_taller == 1 && $seg->e_vehiculo == 1 && $seg->i_taller == 1 && $seg->r_conductor == 1)
                                                    <form action="{{ route('mantencion.update', $mantencion->id)}}" method="post">
                                                        @csrf 
                                                        @method('PUT')

                                                        <button type="submit" class="btn btn-primary">Actualizar</button>
                                                    </form>
                                                @endif
                                            </div>
                                            @endforeach
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
