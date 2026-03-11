<?php
namespace App\Mail;
use App\Models\Proprietario;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class BenvenutoProprietario extends Mailable{

    use Queueable, SerializesModels;
    public $proprietario;

    public function __construct(Proprietario $proprietario)
    {
        $this->proprietario = $proprietario;
    }

    public function build(){
        return $this->subject('Benvenuto nel nostro Gestionale!')
                    ->view('emails.benvenuto');
    }
}