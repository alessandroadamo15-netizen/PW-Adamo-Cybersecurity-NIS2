-- Query 1: asset con fornitore ad alta criticità
SELECT
    a.nome_asset,
    a.tipo_asset,
    f.ragione_sociale,
    f.livello_criticita
FROM asset_critici a
JOIN fornitori_terze_parti f ON a.id_vendor = f.id_fornitore
WHERE f.livello_criticita = 'Alta';

-- Query 2: servizi associati agli asset più critici
SELECT
    s.nome_servizio,
    a.nome_asset,
    f.livello_criticita
FROM servizi_erogati s
JOIN asset_critici a ON s.id_asset_collegato = a.id_asset
JOIN fornitori_terze_parti f ON a.id_vendor = f.id_fornitore
ORDER BY f.livello_criticita DESC, s.nome_servizio;

-- Query 3: referenti degli asset critici
SELECT
    a.nome_asset,
    c.nominativo,
    c.email_diretta,
    c.ruolo_aziendale
FROM asset_critici a
JOIN anagrafica_contatti c ON a.id_responsabile = c.id_contatto
JOIN fornitori_terze_parti f ON a.id_vendor = f.id_fornitore
WHERE f.livello_criticita IN ('Alta', 'Media');

-- Query 4: vista finale del profilo
CREATE OR REPLACE VIEW vista_profilo_acn AS
SELECT
    a.nome_asset,
    a.tipo_asset,
    s.nome_servizio,
    f.ragione_sociale AS fornitore,
    c.nominativo AS responsabile,
    c.email_diretta,
    f.livello_criticita AS criticita_fornitore,
    CASE
        WHEN a.nome_asset IN ('Server Web', 'Database Clienti') THEN 'Alta'
        WHEN a.nome_asset IN ('VPN Aziendale', 'Sistema Backup') THEN 'Media'
        ELSE 'Bassa'
    END AS livello_criticita_profilo
FROM asset_critici a
JOIN servizi_erogati s ON a.id_asset = s.id_asset_collegato
JOIN fornitori_terze_parti f ON a.id_vendor = f.id_fornitore
JOIN anagrafica_contatti c ON a.id_responsabile = c.id_contatto;
