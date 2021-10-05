<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*
Route::get('/', function () {
    return view('layouts.main');
});
*/


Route::get('/', [App\Http\Controllers\HomeController::class, 'auth']);


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/tests', [App\Http\Controllers\TestController::class, 'index'])->name('test');

//Mantencion
Route::get('/mantenciones', [App\Http\Controllers\MantencionController::class, 'index'])->name('mantencion');
Route::get('/mantenciones/{mantencion}/edit', [App\Http\Controllers\MantencionController::class, 'edit'])->name('mantencion.edit');
Route::put('/mantenciones/{mantencion}', [App\Http\Controllers\MantencionController::class, 'update'])->name('mantencion.update');
Route::delete('/mantenciones/{mantencion}', [App\Http\Controllers\MantencionController::class, 'destroy'])->name('mantencion.delete');

//Seguimiento
Route::put('/Seguimiento1/{seguimiento}', [App\Http\Controllers\SeguimientoMantencionController::class, 'upadteSeguimiento1'])->name('seguimiento1.update');
Route::put('/Seguimiento2/{seguimiento}', [App\Http\Controllers\SeguimientoMantencionController::class, 'upadteSeguimiento2'])->name('seguimiento2.update');
Route::put('/Seguimiento3/{seguimiento}', [App\Http\Controllers\SeguimientoMantencionController::class, 'upadteSeguimiento3'])->name('seguimiento3.update');
Route::put('/Seguimiento4/{seguimiento}', [App\Http\Controllers\SeguimientoMantencionController::class, 'upadteSeguimiento4'])->name('seguimiento4.update');


//Route::get('/notificaciones', [App\Http\Controllers\NotificacionController::class, 'index'])->name('notificacion');

//Control Temperatura
Route::get('/control-temperatura', [App\Http\Controllers\ControlTemperaturaController::class, 'index'])->name('control_temp');
Route::get('/control-temperatura/{control}/edit', [App\Http\Controllers\ControlTemperaturaController::class, 'edit'])->name('control_temp.edit');
Route::put('/control-temperatura/{control}', [App\Http\Controllers\ControlTemperaturaController::class, 'update'])->name('control_temp.update');
Route::delete('/control-temperatura/{control}', [App\Http\Controllers\ControlTemperaturaController::class, 'destroy'])->name('control_temp.delete');

//Limpieza
Route::get('/limpieza', [App\Http\Controllers\LimpiezaController::class, 'index'])->name('limpieza');
Route::put('/limpieza/{limpieza}', [App\Http\Controllers\LimpiezaController::class, 'update'])->name('limpieza.update');
Route::delete('/limpieza/{limpieza}', [App\Http\Controllers\LimpiezaController::class, 'destroy'])->name('limpieza.delete');

//Sanitizacion
Route::get('/sanitizacion', [App\Http\Controllers\SanitizacionController::class, 'index'])->name('sanitizacion');
Route::put('/control-sanitizacion/{sanitizacion}', [App\Http\Controllers\SanitizacionController::class, 'update'])->name('sanitizacion.update');
Route::delete('/control-sanitizacion/{sanitizacion}', [App\Http\Controllers\SanitizacionController::class, 'destroy'])->name('sanitizacion.delete');

//Documentaria
Route::get('/documentaria', [App\Http\Controllers\DocumentariaController::class, 'index'])->name('documentaria');
Route::put('/documentarian/{documento}', [App\Http\Controllers\DocumentariaController::class, 'update'])->name('documentaria.update');

//Perfil
Route::get('/profile', [App\Http\Controllers\ProfileController::class, 'index'])->name('profile');
Route::put('/profile', [App\Http\Controllers\ProfileController::class, 'update'])->name('profile.update');

