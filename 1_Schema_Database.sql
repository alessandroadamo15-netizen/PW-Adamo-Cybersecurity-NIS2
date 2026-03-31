-- 1_Schema_Database.sql
-- Progetto: Gestione Asset Critici NIS2
-- Studente: Alessandro Adamo

-- Creazione tabella per i contatti responsabili (Punti di Contatto NIS2)
CREATE TABLE anagrafica_contatti (
    id_contatto INT PRIMARY KEY,
    nominativo VARCHAR(100) NOT NULL,
    email_diretta VARCHAR(100) UNIQUE NOT NULL,
    ruolo_aziendale VARCHAR(50)
);

-- Creazione tabella per la gestione dei fornitori (Supply Chain Security)
CREATE TABLE fornitori_terze_parti (
    id_fornitore INT PRIMARY KEY,
    ragione_sociale VARCHAR(100) NOT NULL,
    servizio_gestito VARCHAR(100),
    livello_criticita ENUM('Alta', 'Media', 'Bassa') DEFAULT 'Media'
);

-- Creazione tabella principale degli Asset Critici
CREATE TABLE asset_critici (
    id_asset INT PRIMARY KEY,
    nome_asset VARCHAR(100) NOT NULL,
    tipo_asset VARCHAR(50), 
    id_responsabile INT,
    id_vendor INT,
    FOREIGN KEY (id_responsabile) REFERENCES anagrafica_contatti(id_contatto),
    FOREIGN KEY (id_vendor) REFERENCES fornitori_terze_parti(id_fornitore)
);

-- Creazione tabella dei Servizi Digitali erogati
CREATE TABLE servizi_erogati (
    id_servizio INT PRIMARY KEY,
    nome_servizio VARCHAR(100) NOT NULL,
    descrizione_funzionale TEXT,
    id_asset_collegato INT,
    FOREIGN KEY (id_asset_collegato) REFERENCES asset_critici(id_asset)
);