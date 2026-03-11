<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Proprietario extends Authenticatable{

    use HasFactory; // Ti aiuta a gestire i dati
    
    protected $table= 'PROPRIETARI';
    protected $primaryKey = 'id_roprietario';
    public $timestamps = false;

    protected $fillable = ['cognome_nome','cf_piva','email','telefono','password','remember_token'];
    protected $hidden = ['password','remeber_token'];
    /*
    Quando Laravel trasforma il tuo modello in un JSON o
    in un Array (ad esempio quando invii dati a una vista o crei un'API),
    esclude automaticamente i campi elencati in hidden.
    Serve a evitare fughe di dati involontarie.
    */ 
}