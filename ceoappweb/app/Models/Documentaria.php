<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Documentaria extends Model
{
    protected $table = 'documentaria';
    protected $primaryKey = 'id';
    

    protected $fillable = [
        'cedula_front',
        'cedula_back',
        'antecedentes',
        'comprobante_domicilio',
        'AFP',
        'certificado_salud',
        'finiquito',
        'examen_achs',
        'hoja_vida',
        'id_postulante',
    ];
}
