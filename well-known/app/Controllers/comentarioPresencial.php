<?php
session_start();
require_once('../ComentarioPresencial/ComentarioPresencial.php');
include('../../vendor/autoload.php');
include('../Database/Database.php');


$coments = $_POST['comentario'];
$id_entrevista = $_POST['id_entrevista'];


$s = new ComentarioPresencial;
$s->addComentarios($id_entrevista,$coments);



$path = "comentariosPresencial.php?id=$id_entrevista";

header("Location: ../../$path");