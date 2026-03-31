-- 2_Vista_e_Export_CSV.sql
-- Implementazione della Vista logica per monitoraggio NIS2
-- Studente: Alessandro Adamo

-- Creazione di una Vista che aggrega Asset, Fornitore e Punto di Contatto
-- Questa vista risponde ai requisiti di trasparenza richiesti dall'ACN
CREATE VIEW vista_conformita_acn AS
SELECT 
    a.nome_asset AS 'Asset_Critico',
    s.nome_servizio AS 'Servizio_Digitale',
    f.ragione_sociale AS 'Vendor_Supply_Chain',
    f.livello_criticita AS 'Rischio_Fornitore',
    c.nominativo AS 'Responsabile_Asset',
    c.email_diretta AS 'Punto_Contatto_H24'
FROM asset_critici a
INNER JOIN servizi_erogati s ON a.id_asset = s.id_asset_collegato
INNER JOIN fornitori_terze_parti f ON a.id_vendor = f.id_fornitore
INNER JOIN anagrafica_contatti c ON a.id_responsabile = c.id_contatto;

-- COMANDO PER GENERARE IL FILE FISICO CSV (Richiesto per i profili ACN)
-- Nota: In un ambiente reale, il database salva il file nel percorso specificato
SELECT * FROM vista_conformita_acn
INTO OUTFILE '/var/lib/mysql-files/report_nis2_adamo.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';