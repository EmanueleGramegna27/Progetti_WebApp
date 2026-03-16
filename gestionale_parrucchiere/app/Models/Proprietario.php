<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Proprietario extends Authenticatable{

    use HasApiTokens, HasFactory, Notifiable; // Ti aiuta a gestire i dati
    
    protected $table= 'PROPRIETARI';
    protected $primaryKey = 'id_proprietario';
    public $timestamps = false;

    protected $fillable = ['cognome_nome','cf_piva','email','telefono','password','remember_token'];
    protected $hidden = ['password','remember_token'];
    /*
    Quando Laravel trasforma il tuo modello in un JSON o
    in un Array (ad esempio quando invii dati a una vista o crei un'API),
    esclude automaticamente i campi elencati in hidden.
    Serve a evitare fughe di dati involontarie.
    */ 

    // Criptazione automatica della password
    protected $casts = ['password' => 'hashed',];
}