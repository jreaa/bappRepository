@extends('layouts.main', ['activePage' => 'sanitizacion', 'titlePage' => 'Sanitizaciones'])

@section('content')
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Sanitizaciones</h4>
                                <p class="card-category">Ultimas Sanitizaciones Agregadas</p>
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
                                            <th>Estatus</th>
                                            <th>Hora</th>
                                            <th>Marcar</th>
                                            <th class="text-right"></th>
                                        </thead>
                                        <tbody>
                                            @foreach($sanitizaciones as $sanitizacion)
                                            <tr>
                                                <td>{{ $sanitizacion->date }}</td>
                                                
                                                <td>{{ strtoupper($sanitizacion->status) }}</td>
                                                <td>{{ $sanitizacion->hora }}</td>

                                                <td class="td-actions ">
                                                    @if($sanitizacion->status == 'no realizado')
                                                    <form action="{{ route('sanitizacion.update', $sanitizacion->id) }}" method="post" style="display:inline-block">
                                                        @csrf
                                                        @method('PUT')
                                                        <button type="submit" class="btn btn-danger">
                                                                <i class="material-icons">close</i>
                                                        </button>
                                                    </form>
                                                    @else
                                                    <button class="btn btn-success"><i class="material-icons">check_circle</i></button>
                                                    @endif
                                                    
                                                </td>
                                        
                                                <td class="td-actions text-right">

                                                    
                                                <form action="{{ route('sanitizacion.delete', $sanitizacion->id) }}" method="post" style="display:inline-block">
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