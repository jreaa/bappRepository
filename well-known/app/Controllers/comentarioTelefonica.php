<?php
session_start();
require_once('../ComentarioTelefonica/ComentarioTelefonica.php');
include('../../vendor/autoload.php');
include('../Database/Database.php');


$coments = $_POST['comentario'];
$id_entrevista = $_POST['id_entrevista'];


$s = new ComentarioTelefonica;
$s->addComentarios($id_entrevista,$coments);



$path = "comentariosTelefonica.php?id=$id_entrevista";

header("Location: ../../$path");