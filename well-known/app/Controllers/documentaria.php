<?php 
include('../Upload/Upload.php');
include('../../vendor/autoload.php');
include('../Database/Database.php');

use Illuminate\Database\Capsule\Manager as DB;

$id = $_POST['id'];
$f_f = $_POST['f_f'];
$f_c = $_POST['f_c'];
$f_a = $_POST['f_a'];

if(isset($_POST['cedula'])){
    $cedula = $_POST['cedula'];
    DB::table('postulante')->where('id', '=',$id)->update([
        'cedula' => $cedula
    ]);
    if (isset($_POST['licencia'])) {
        $licencia = $_POST['licencia'];
        DB::table('postulante')->where('id', '=',$id)->update([
            'cedula' => $cedula,
            'numero_licencia' => $licencia
        ]);
    }
}
if(isset($_POST['f_f'])){
    DB::table('documentaria')->where('id_postulante','=',$id)->update([
		'cedula_v' => $f_f,
		'antecedentes_v' => $f_a,
		'afp_v' => $f_c
    ]);
}

if(isset($_FILES)){
    foreach($_FILES as $doc => $detalles)
    {
        if ($detalles['name'] == '') {
            header('Location:../../documentaria.php?id='.$id);
        }else{
            $name = $detalles['name'];
            $tmp_name = $detalles['tmp_name'];

            $upload = new Upload;
            $upload->addDocs($name,$tmp_name,$doc,$id);
        }
    }

} 