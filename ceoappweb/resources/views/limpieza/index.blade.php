@extends('layouts.main', ['activePage' => 'limpieza', 'titlePage' => 'Limpieza'])

@section('content')
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Limpieza</h4>
                                <p class="card-category">Ultimas Limpiezas Agregadas</p>
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
                                            @foreach($limpiezas as $limpieza)
                                            <tr>
                                                <td>{{ $limpieza->date }}</td>
                                                
                                                <td>{{ strtoupper($limpieza->status) }}</td>
                                                <td>{{ $limpieza->hora }}</td>

                                                <td class="td-actions ">
                                                    @if($limpieza->status == 'no realizado')
                                                    <form action="{{ route('limpieza.update', $limpieza->id) }}" method="post" style="display:inline-block">
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

                                                    
                                                <form action="{{ route('limpieza.delete', $limpieza->id) }}" method="post" style="display:inline-block">
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