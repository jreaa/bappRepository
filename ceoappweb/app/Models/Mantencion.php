<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mantencion extends Model
{
    use HasFactory;

    protected $table = 'mantencion_siniestro';
    protected $primaryKey = 'id';
    

    protected $fillable = [
        'fecha_solicitud',
        'patente',
        'modelo_v',
        'n_reserva',
        'taller',
        'fecha',
        'hora',
        'status',
        'direccion',
        't_servicio',
        'observaciones',
        'fecha_entrega',
        'resultado'
    ];
}
