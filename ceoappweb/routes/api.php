<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\ControlTmpController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\ControlUpdate;
use App\Http\Controllers\ControlesController;

use App\Http\Controllers\sanitizacionController;
use App\Http\Controllers\sanoController;
use App\Http\Controllers\sanoUpdateController;
use App\Http\Controllers\addSanitizacionController;


use App\Http\Controllers\limpController;
use App\Http\Controllers\limpiezaController;
use App\Http\Controllers\limpUpdateController;
use App\Http\Controllers\addLimpiezaController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('controles', ControlTmpController::class);
Route::apiResource('controlesUpdate', ControlUpdate::class);
Route::apiResource('control', ControlesController::class);

Route::apiResource('login', LoginController::class);


Route::apiResource('sano', sanoController::class);
Route::apiResource('sanitizaciones', sanitizacionController::class);
Route::apiResource('sanoUpdate', sanoUpdateController::class);
Route::apiResource('addsano', addSanitizacionController::class);



Route::apiResource('limp', limpController::class);
Route::apiResource('limpiezas', limpiezaController::class);
Route::apiResource('limpUpdate', limpUpdateController::class);
Route::apiResource('addlimpieza', addLimpiezaController::class);

