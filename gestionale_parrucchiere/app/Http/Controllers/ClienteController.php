<?php

namespace App\Http\Controllers;
use App\Models\Cliente;// Diciamo al controller di usare il modello che hai appena configurato

class ClienteController extends Controller{
    public function index(){
        // Usiamo il modello per leggere la tabella
        $clienti = Cliente::all();
        // Per ora li stampiamo a video per vedere che funzionano
        return view('clienti.lista', ['clienti' => $clienti]);
    }
}
