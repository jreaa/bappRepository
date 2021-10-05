<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    use HasFactory;
    protected $table = 'postulante';
    protected $primaryKey = 'id';
    

    protected $fillable = [
        'rut',
        'name',
        'lastname',
        'date_born',
        'address',
        'img',
        'email'
    ];
}
