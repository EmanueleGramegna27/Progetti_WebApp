<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProprietarioController;

// Rotte che NON richiedono login
Route::post('/register', [ProprietarioController::class, 'register']);
Route::post('/login', [ProprietarioController::class, 'login']);

// Rotte che RICHIEDONO login
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/update-password', [ProprietarioController::class, 'updatePassword']);
});