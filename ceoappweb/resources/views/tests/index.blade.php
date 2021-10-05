@extends('layouts.main', ['activePage' => 'test', 'titlePage' => 'Examenes'])

@section('content')
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Examenes</h4>
                                <p class="card-category">Ultimos Examenes Agregados</p>
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
                                            <th>Titulo</th>
                                            <th>Descripcion</th>
                                            <th>Link</th>
                                            <th>Estatus</th>
                                            <th class="text-right"></th>
                                        </thead>
                                        <tbody>
                                            @foreach($tests as $test)
                                            <tr>
                                                <td>{{ $test->title }}</td>
                                                <td>{{ $test->description }}</td>
                                                <td><a href="{{ $test->link }}">{{ $test->link }}</a></td>
                                                <td>{{ strtoupper($test->status) }}</td>
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