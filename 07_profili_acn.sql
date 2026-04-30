-- =========================================
-- ESTENSIONE MODELLO: PROFILI ACN
-- =========================================
-- Questo script estende il database introducendo
-- la gestione dei profili secondo Framework ACN

-- =========================================
-- 1. SUBCATEGORIE FRAMEWORK
-- =========================================
CREATE TABLE subcategorie_framework (
    id_subcat SERIAL PRIMARY KEY,
    codice VARCHAR(20),
    descrizione TEXT,
    funzione VARCHAR(50),
    categoria VARCHAR(100)
);

-- =========================================
-- 2. PROFILI (TARGET / ATTUALE)
-- =========================================
CREATE TABLE profili (
    id_profilo SERIAL PRIMARY KEY,
    tipo_profilo VARCHAR(20), -- target / attuale
    descrizione TEXT
);

-- =========================================
-- 3. COLLEGAMENTO PROFILO-SUBCATEGORIE
-- =========================================
CREATE TABLE profilo_subcategorie (
    id SERIAL PRIMARY KEY,
    id_profilo INT REFERENCES profili(id_profilo),
    id_subcat INT REFERENCES subcategorie_framework(id_subcat),
    priorita VARCHAR(20),
    maturita_target VARCHAR(30),
    maturita_attuale VARCHAR(30),
    copertura NUMERIC(3,2)
);

-- =========================================
-- DATI DI ESEMPIO
-- =========================================

-- Subcategorie (estratto semplificato)
INSERT INTO subcategorie_framework (codice, descrizione, funzione, categoria) VALUES
('GV.RR02','Ruoli e responsabilità definiti e comunicati','Govern','Ruoli'),
('ID.AM01','Inventario degli asset','Identify','Asset Management'),
('ID.RA01','Valutazione del rischio','Identify','Risk Assessment');

-- Profili
INSERT INTO profili (tipo_profilo, descrizione) VALUES
('target','Situazione desiderata'),
('attuale','Situazione reale rilevata');

-- Associazione profili-subcategorie
INSERT INTO profilo_subcategorie (
id_profilo, id_subcat, priorita, maturita_target, maturita_attuale, copertura
) VALUES
(1,1,'Alta','Definito','Iniziale',0.40),
(1,2,'Alta','Gestito','Definito',0.70),
(2,1,'Alta','Definito','Iniziale',0.40),
(2,3,'Media','Definito','Incompleto',0.50);

-- =========================================
-- QUERY OUTPUT PROFILO
-- =========================================
-- Output utile per costruzione profilo ACN

SELECT 
    s.codice,
    s.descrizione,
    ps.priorita,
    ps.maturita_target,
    ps.maturita_attuale,
    ps.copertura
FROM profilo_subcategorie ps
JOIN subcategorie_framework s 
    ON ps.id_subcat = s.id_subcat;

-- Collegamento logico tra sottocategorie del Framework e tabelle del database
CREATE TABLE mappatura_subcategorie_database (
    id_mappatura SERIAL PRIMARY KEY,
    id_subcat INT REFERENCES subcategorie_framework(id_subcat),
    tabella_riferimento VARCHAR(100),
    campo_riferimento VARCHAR(100),
    motivazione TEXT
);

INSERT INTO mappatura_subcategorie_database (
    id_subcat,
    tabella_riferimento,
    campo_riferimento,
    motivazione
) VALUES
(1, 'anagrafica_contatti', 'ruolo_aziendale', 'La sottocategoria GV.RR02 riguarda ruoli e responsabilità, quindi viene collegata ai referenti interni censiti nel database.'),
(2, 'asset_critici', 'nome_asset', 'La sottocategoria ID.AM01 riguarda l’inventario degli asset, quindi viene collegata alla tabella degli asset critici.'),
(3, 'asset_critici / servizi_erogati / fornitori_terze_parti', 'livello_criticita', 'La sottocategoria ID.RA01 riguarda la valutazione del rischio, quindi viene collegata alle informazioni su asset, servizi e fornitori.');

-- Vista per mostrare come le sottocategorie del Framework sono collegate al database
CREATE VIEW vista_mappatura_subcategorie AS
SELECT
    s.codice,
    s.descrizione,
    m.tabella_riferimento,
    m.campo_riferimento,
    m.motivazione
FROM mappatura_subcategorie_database m
JOIN subcategorie_framework s ON m.id_subcat = s.id_subcat;
