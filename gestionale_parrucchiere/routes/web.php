<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;
use App\Models\Proprietario;
use Illuminate\Support\Facades\Hash;
Route::get('/clienti', [ClienteController::class, 'index']);


Route::get('/test-registrazione', function () {
    $proprietario = Proprietario::create([
        'cognome_nome' => 'Gramegna Emanuele',
        'cf_piva'      => 'TESTPIVA12345',
        'email'        => 'test@test.it',
        'telefono'     => '123456789',
        'password'     => Hash::make('password123'),
    ]);

    return "Proprietario creato! ID: " . $proprietario->id;
});

// In routes/web.php
Route::get('/test-login', function () {
    return '
        <form action="/api/login" method="POST">
            <input type="email" name="email" placeholder="Email" value="test@test.it">
            <input type="password" name="password" placeholder="Password" value="password123">
            <button type="submit">Testa Login</button>
        </form>
    ';
});