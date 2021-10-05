<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sanitizacion extends Model
{
    use HasFactory;

    protected $table = 'sanitizacion';
    protected $primaryKey = 'id';
    

    protected $fillable = [
        'date',
        'hora',
        'status',
        'id_postulante'
    ];

    public $timestamps = 'false';
}
