<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ControlTemperatura extends Model
{
    use HasFactory;

    protected $table = 'control_temp';
    protected $primaryKey = 'id';
    

    protected $fillable = [
        'date',
        'jornada',
        'status',
        'temperatura',
        'hora',
        'id_postulante'
    ];
    public $timestamps = 'false';
}
