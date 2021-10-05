<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SeguimientoMantencion extends Model
{
    use HasFactory;

    protected $table = 'seguimiento_mantencion';
    protected $primaryKey = 'id';
    

    protected $fillable = [
        'e_taller',
        'e_vehiculo',
        'i_taller',
        'r_conductor',
        'id_mantencion'
    ];
}
