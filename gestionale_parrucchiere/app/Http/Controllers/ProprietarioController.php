<?php

namespace App\Http\Controllers;


use App\Models\Proprietario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash; // Fondamentale per la sicurezza
use Illuminate\Support\Facades\Mail;
use App\Mail\BenvenutoProprietario;

class ProprietarioController extends Controller{

    public function register(Request $request){

        // 1. Validazione base dei dati in entrata
        $request->validate([
            'cognome_nome' => 'required|string|max:100',
            'email'=> 'required|email|unique:PROPRIETARI,email',
            'password'=>'required|min:8',
        ]);
    
        // 2. Creazione (con password criptata)
        $proprietario= Proprietario::create([
            'cognome_nome'=>$request-> cognome_nome,
            'cf_piva'     => $request->cf_piva,
            'email'       => $request->email,
            'telefono'    => $request->telefono,
            'password'    => Hash::make($request->password), //Criptazione
        ]);

        // Dopo il salvataggio:
        Mail::to($proprietario->email)->send(new BenvenutoProprietario($proprietario));
        return response()->json(['message'=> 'Proprietario creato con successo!'],201);
    }

    public function updatePassword(Request $request){

        $request->validate([
            'old_password'=>'required',
            'new_password'=>'required|min:8|confirmed', //// 'confirmed' cerca un campo 'new_password_confirmation'

        ]);

        /** @var \App\Models\Proprietario $proprietario */
        $proprietario = Auth::user();

        // DEBUG: Se questo stampa "Non sei autenticato", abbiamo trovato il problema!
        if (!$proprietario) {
            return response()->json(['message' => 'Non sei autenticato'], 401);
        }

        if(!Hash::check($request->old_password,$proprietario->password)){
            return response()->json(['message'=>'Password attuale errata'],403);
        }

        $proprietario->password = Hash::make($request->new_password);
        $proprietario->save();

        return response()->json(['message'=> 'Password aggiornata!']);


    }



}


