<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;
use App\Models\Proprietario;
use Illuminate\Support\Facades\Hash;
Route::get('/clienti', [ClienteController::class, 'index']);


Route::get('/test-registrazione', function () {
    $proprietario = Proprietario::create([
        'cognome_nome' => 'Test Nome',
        'cf_piva'      => 'TESTPIVA12345',
        'email'        => 'test@test.it',
        'telefono'     => '123456789',
        'password'     => Hash::make('password123'),
    ]);

    return "Proprietario creato! ID: " . $proprietario->id;
});
