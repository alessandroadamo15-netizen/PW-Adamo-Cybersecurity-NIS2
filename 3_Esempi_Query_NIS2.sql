-- 3_Esempi_Query_NIS2.sql
-- Casi d'uso reali per la gestione degli incidenti (Incident Response)
-- Studente: Alessandro Adamo

-- ESEMPIO 1: Identificare tutti gli asset critici legati a un fornitore specifico.
-- Utile se un Cloud Provider subisce un attacco e dobbiamo sapere cosa abbiamo esposto.
SELECT nome_asset, tipo_asset 
FROM asset_critici 
WHERE id_vendor = (SELECT id_fornitore FROM fornitori_terze_parti WHERE ragione_sociale = 'Esempio_Vendor');

-- ESEMPIO 2: Lista dei contatti di emergenza per gli asset ad alto rischio.
-- Fondamentale per attivare il piano di comunicazione verso l'ACN entro le 24 ore.
SELECT a.nome_asset, c.nominativo, c.email_diretta
FROM asset_critici a
JOIN anagrafica_contatti c ON a.id_responsabile = c.id_contatto
JOIN fornitori_terze_parti f ON a.id_vendor = f.id_fornitore
WHERE f.livello_criticita = 'Alta';

-- ESEMPIO 3: Report complessivo della distribuzione del rischio nella Supply Chain.
-- Richiesto per l'audit annuale di conformità NIS2.
SELECT livello_criticita, COUNT(*) as numero_fornitori
FROM fornitori_terze_parti
GROUP BY livello_criticita;