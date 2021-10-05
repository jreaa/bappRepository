@extends('layouts.main', ['activePage' => 'controlTemp', 'titlePage' => 'Control Temperatura'])

@section('content')
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Control Temperatura</h4>
                                <p class="card-category">Control Temperatura, Agregados</p>
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
                                            <th>Fecha</th>
                                            <th>Jornada</th>
                                            <th>Hora</th>
                                            <th>Estatus</th>
                                            <th>Temperatura</th>
                                            <th class="text-right"></th>
                                        </thead>
                                         @foreach($controlesTemperatura as $control)
                                      
                                        <tbody>
                                           
                                            <tr>
                                                <td>{{ $control->date }}</td>
                                                <td>{{ strtoupper($control->jornada) }}</td>
                                                <td>{{ $control->hora }}</td>
                                                <td>{{ strtoupper($control->status) }}</td>
                                                <td class="td-actions ">
                                                    @if($control->temperatura == 0)
                                                
                                                    <a href="{{ route('control_temp.edit', $control->id) }}" type="submit" class="btn btn-danger text-center" style="color:#fff">
                                                        <i class="material-icons">thermostat</i>
                                                    </a>
                                                    @else
                                                    {{ $control->temperatura }} 
                                                    <button class="btn btn-success ml-2"><i class="material-icons">check_circle</i></button>
                                                    
                                                    @endif
                                                    
                                                </td>

                                                <td class="td-actions text-right">

                                                <form action="{{ route('control_temp.delete', $control->id) }}" method="post" style="display:inline-block">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Desea Eliminar ')">
                                                        <i class="material-icons">restore_from_trash</i>
                                                    </button>
                                                </form>
                                                </td>
                                            </tr>
                                            
                                        </tbody>
                                        @endforeach
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