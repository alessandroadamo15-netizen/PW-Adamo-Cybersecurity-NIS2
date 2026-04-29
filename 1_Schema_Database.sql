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
-- Tabella per gestire i profili ACN (Target vs Attuale)
-- Implementazione livelli maturità CMMI e soglia copertura 0-1
CREATE TABLE assessment_postura (
    id_assessment SERIAL PRIMARY KEY,
    id_asset INT REFERENCES asset_critici(id_asset),
    codice_framework_acn VARCHAR(20), 
    
    -- Configurazione Profilo Target
    maturita_target VARCHAR(20), -- Iniziale, Ripetibile, Definito, Gestito, Ottimizzato
    priorita_intervento INT CHECK (priorita_intervento BETWEEN 1 AND 5),
    
    -- Rilevazione Profilo Attuale
    maturita_attuale VARCHAR(20),
    livello_copertura DECIMAL(3,2) CHECK (livello_copertura BETWEEN 0 AND 1),
    
    data_valutazione DATE DEFAULT CURRENT_DATE
);

-- Vista per Gap Analysis: verifica conformità su soglia 0.6
CREATE OR REPLACE VIEW vista_gap_analisi_acn AS
SELECT 
    a.nome_asset,
    ap.codice_framework_acn,
    ap.maturita_target,
    ap.maturita_attuale,
    ap.livello_copertura,
    CASE 
        WHEN ap.livello_copertura < 0.6 THEN 'CRITICO: Sotto soglia 0.6'
        ELSE 'CONFORME'
    END AS stato_valutazione
FROM assessment_postura ap
JOIN asset_critici a ON ap.id_asset = a.id_asset;
