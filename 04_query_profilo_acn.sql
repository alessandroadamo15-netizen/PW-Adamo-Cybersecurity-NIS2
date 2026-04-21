CREATE OR REPLACE VIEW vista_profilo_acn AS
SELECT
    a.nome_asset,
    s.nome_servizio,
    f.ragione_sociale AS fornitore,
    c.nominativo AS responsabile,
    c.email_diretta,
    f.livello_criticita AS criticita_fornitore,
    CASE
        WHEN a.nome_asset = 'Server Web' THEN 'Alta'
        WHEN a.nome_asset = 'Database Clienti' THEN 'Alta'
        WHEN a.nome_asset = 'VPN Aziendale' THEN 'Media'
        ELSE 'Media'
    END AS livello_criticita_profilo
FROM asset_critici a
JOIN servizi_erogati s ON a.id_asset = s.id_asset_collegato
JOIN fornitori_terze_parti f ON a.id_vendor = f.id_fornitore
JOIN anagrafica_contatti c ON a.id_responsabile = c.id_contatto;
