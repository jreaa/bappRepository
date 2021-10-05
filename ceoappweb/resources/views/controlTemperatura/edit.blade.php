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
                                <p class="card-category">Temperatura</p>
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
                                        <tbody>
                                            <tr>
                                                <td>{{ $control->date }}</td>
                                                <td>{{ strtoupper($control->jornada) }}</td>
                                                <td>{{ $control->hora }}</td>
                                                <td>{{ strtoupper($control->status) }}</td>

                                                <form action="{{ route('control_temp.update', $control->id) }}" method="post" style="display:inline-block">
                                                 @csrf
                                                 @method('PUT')
                                                <td class="td-actions">
                                                    <input type="number" name="temperatura" step="0.01" required style="border: 0;border-bottom: 1px solid #496cad;width: 100%;padding: 1px;margin: 1px;font-size:15px">
                                                </td>

                                                <td class="td-actions text-right">
                                                   
                                                    <button type="submit" class="btn btn-success" onclick="return confirm('Esta seguro que desea guardar? ')">
                                                        Guardar
                                                    </button>
                                                
                                                </td>
                                                </form>
                                            </tr>
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