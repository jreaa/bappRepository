@extends('layouts.main', ['activePage' => 'documentaria', 'titlePage' => 'Documentaria'])

@section('css')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.6/dropzone.min.css" integrity="sha512-jU/7UFiaW5UBGODEopEqnbIAHOI8fO6T99m7Tsmqs2gkdujByJfkCbbfPSN4Wlqlb9TGnsuC0YgUgWkRBK7B9A==" crossorigin="anonymous" />
@endsection

@section('content')
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Documentaria</h4>
                                <p class="card-category">Mis Documentos</p>
                            </div>
                            <div class="card-body">
                            @foreach($documentaria as $documento)
                            <form action="{{ route('documentaria.update', $documento->id) }}"
                                class="dropzone"
                                id="my-awesome-dropzone"
                                method="post">
                                
                            </form>
                            @endforeach
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

@section('js')
<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.6/min/dropzone.min.js" integrity="sha512-KgeSi6qqjyihUcmxFn9Cwf8dehAB8FFZyl+2ijFEPyWu4ZM8ZOQ80c2so59rIdkkgsVsuTnlffjfgkiwDThewQ==" crossorigin="anonymous"></script>
<script>
Dropzone.options.myAwesomeDropzone = {
    header:{
        'X-CSRF-TOKEN' : "{{ csrf_token() }}"
    },
    method:"put",
};
</script>
@endsection