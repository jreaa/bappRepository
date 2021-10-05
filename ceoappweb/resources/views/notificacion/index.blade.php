@extends('layouts.main', ['activePage' => 'notificacion', 'titlePage' => 'notificaciones'])

@section('content')
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Notificaciones</h4>
                                <p class="card-category">Ultimos Notificaciones Agregadas</p>
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
                                            <th>Descripcion</th>
                                            <th>Fecha</th>
                                            <th class="text-right"></th>
                                        </thead>
                                        <tbody>
                                            @foreach($notificaciones as $notificacion)
                                            <tr>
                                                <td>{{ strtoupper($notificacion->description) }}</td>
                                                <td>{{ $notificacion->fecha }}</td>
                                                <td class="td-actions text-right">

                                                    
                                                <form action="#" method="post" style="display:inline-block">
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