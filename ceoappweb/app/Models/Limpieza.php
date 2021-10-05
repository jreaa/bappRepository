<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Limpieza extends Model
{
    use HasFactory;

    protected $table = 'limpieza';
    protected $primaryKey = 'id';
    

    protected $fillable = [
        'date',
        'hora',
        'status',
        'id_postulante'
    ];
}
