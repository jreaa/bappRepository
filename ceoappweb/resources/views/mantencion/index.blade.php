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
                                <h4 class="card-title">Mantenciones</h4>
                                <p class="card-category">Ultimas Mantenciones Agregadas</p>
                            </div>
                            <div class="card-body">
                                @if(session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                                @endif
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="text-primary">
                                            
                                            <th>Patente</th>
                                            <th>Modelo V</th>
                                            <th>Fecha de Solicitud</th>
                                            <th>N° reserva</th>
                                            <th>Taller</th>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Estatus</th>
                                            <th>Realizar <br> Mantencion</th>
                                            <th class="text-right"></th>
                                        </thead>
                                        <tbody>
                                            @foreach($mentenciones as $mantencion)
                                            <tr>
                                                <td>{{ $mantencion->patente }}</td>
                                                <td>{{ $mantencion->modelo_v }}</td>
                                                <td>{{ $mantencion->fecha_solicitud }}</td>
                                                <td>{{ $mantencion->n_reserva }}</td>
                                                <td>{{ strtoupper($mantencion->taller) }}</td>
                                                <td>{{ $mantencion->fecha }}</td>
                                                <td>{{ $mantencion->hora }}</td>
                                                <td class="td-actions">
                                                @if($mantencion->status == 'no realizado')
                                                <button type="submit" class="btn btn-danger">
                                                    <i class="material-icons">close</i>
                                                </button>
                                                @else
                                                <button type="submit" class="btn btn-success">
                                                    <i class="material-icons">check_circle</i>
                                                </button>
                                                @endif
                                                
                                                </td>
                                                <td class="td-actions"><a href="{{ route('mantencion.edit', $mantencion->id) }}" class="btn btn-primary"><i class="material-icons">car_repair</i></a></td>

                                                <td class="td-actions text-right">

                                                    
                                                <form action="route('mantencion.delete',$mantencion->id)" method="post" style="display:inline-block">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Desea Eliminar ')">
                                                            <i class="material-icons">restore_from_trash</i>
                                                    </button>
                                                 </form>
                                                 </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
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