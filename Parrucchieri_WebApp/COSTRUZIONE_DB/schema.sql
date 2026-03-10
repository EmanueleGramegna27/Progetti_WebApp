-- 1. PROPRIETARI
CREATE TABLE PROPRIETARI (
    id_proprietario INT AUTO_INCREMENT PRIMARY KEY,
    cognome_nome VARCHAR(100) NOT NULL,
    cf_piva VARCHAR(16),
    email VARCHAR(100),
    telefono VARCHAR(20)
);

-- 6. CLIENTI
CREATE TABLE CLIENTI (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cognome_nome VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    scheda_tecnica TEXT
);

-- 9. SERVIZI
CREATE TABLE SERVIZI (
    id_servizio INT AUTO_INCREMENT PRIMARY KEY,
    nome_servizio VARCHAR(100) NOT NULL,
    prezzo_listino DECIMAL(10,2) NOT NULL
);

-- 14. PRODOTTI
CREATE TABLE PRODOTTI (
    id_prodotto INT AUTO_INCREMENT PRIMARY KEY,
    nome_prodotto VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    fornitore_note VARCHAR(100)
);

-- 2. NEGOZI (Collega a PROPRIETARI)
CREATE TABLE NEGOZI (
    id_negozio INT AUTO_INCREMENT PRIMARY KEY,
    id_proprietario INT,
    nome_salone VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(200),
    citta VARCHAR(50),
    telefono VARCHAR(20),
    FOREIGN KEY (id_proprietario) REFERENCES PROPRIETARI(id_proprietario)
);

-- 3. STAFF (Collega a NEGOZI)
CREATE TABLE STAFF (
    id_staff INT AUTO_INCREMENT PRIMARY KEY,
    id_negozio INT,
    cognome_nome VARCHAR(100) NOT NULL,
    ruolo VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(20),
    FOREIGN KEY (id_negozio) REFERENCES NEGOZI(id_negozio)
);

-- 10. PRENOTAZIONE (Collega a CLIENTI)
CREATE TABLE PRENOTAZIONE (
    id_prenotazione INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_ora_appuntamento DATETIME NOT NULL,
    stato VARCHAR(20) DEFAULT 'Confermata',
    FOREIGN KEY (id_cliente) REFERENCES CLIENTI(id_cliente)
);