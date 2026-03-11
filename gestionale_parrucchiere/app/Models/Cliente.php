<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    /*PROTECTED:Questa informazione serve solo a me (il Modello Cliente) e ai miei eredi (classi che estendono il Modello)
    Se la rendessimo public, chiunque nel sistema potrebbe, per errore o per un bug, cambiare la tabella di riferimento mentre il programma sta girando. protected la mette al sicuro.
    */

    // Diciamo a Laravel che questo file gestisce la tabella 'clienti'
    protected $table = 'CLIENTI';
    protected $primaryKey = 'id_cliente'; // La tua chiave primaria
    public $timestamps = false; // Diciamo a Laravel di ignorare le colonne data per cerca automaticamente di popolare colonne che ha di preefinito dove segna quando è stata fatta l'operazione , ma sequeste colonne non sono presenti nella tabella , va in errore 
    // Diciamo quali colonne possono essere compilate
    protected $fillable = ['cognome_nome','telefono','email','scheda-tecnica'];
}
