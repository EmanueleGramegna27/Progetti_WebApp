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

-- 11. LAVORAZIONE (Il centro del sistema)
CREATE TABLE LAVORAZIONE (
    id_lavorazione INT AUTO_INCREMENT PRIMARY KEY,
    id_prenotazione INT UNIQUE,
    data_esecuzione DATETIME NOT NULL,
    prezzo_finale DECIMAL(10,2),
    sconto DECIMAL(10,2),
    note_interne TEXT,
    metodo_pagamento VARCHAR(30),
    importo_pagato DECIMAL(10,2),
    data_pagamento DATETIME,
    FOREIGN KEY (id_prenotazione) REFERENCES PRENOTAZIONE(id_prenotazione)
);

-- 12. COMPOSIZIONE_LAVORAZIONE (Collega Lavorazione a Servizi)
CREATE TABLE COMPOSIZIONE_LAVORAZIONE (
    id_composizione INT AUTO_INCREMENT PRIMARY KEY,
    id_lavorazione INT,
    id_servizio INT,
    note_specifiche VARCHAR(255),
    FOREIGN KEY (id_lavorazione) REFERENCES LAVORAZIONE(id_lavorazione),
    FOREIGN KEY (id_servizio) REFERENCES SERVIZI(id_servizio)
);

-- 13. CONSUMAZIONE_STOCK (Collega Lavorazione a Stock)
CREATE TABLE CONSUMAZIONE_STOCK (
    id_consumo INT AUTO_INCREMENT PRIMARY KEY,
    id_lavorazione INT,
    id_stock INT,
    quantita_usata DECIMAL(10,3),
    unita_misura VARCHAR(10),
    note_specifiche VARCHAR(255),
    FOREIGN KEY (id_lavorazione) REFERENCES LAVORAZIONE(id_lavorazione),
    FOREIGN KEY (id_stock) REFERENCES STOCK(id_stock)
);

-- 15. STOCK (Collega Negozi a Prodotti)
CREATE TABLE STOCK (
    id_stock INT AUTO_INCREMENT PRIMARY KEY,
    id_negozio INT,
    id_prodotto INT,
    quantita_attuale DECIMAL(10,3),
    soglia_minima DECIMAL(10,3),
    FOREIGN KEY (id_negozio) REFERENCES NEGOZI(id_negozio),
    FOREIGN KEY (id_prodotto) REFERENCES PRODOTTI(id_prodotto)
);