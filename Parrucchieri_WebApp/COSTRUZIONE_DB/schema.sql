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