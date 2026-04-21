INSERT INTO anagrafica_contatti (id_contatto, nominativo, email_diretta, ruolo_aziendale) VALUES
(1, 'Mario Rossi', 'mario.rossi@example.com', 'Responsabile IT'),
(2, 'Giulia Bianchi', 'giulia.bianchi@example.com', 'Responsabile CRM'),
(3, 'Luca Verdi', 'luca.verdi@example.com', 'Responsabile accessi');

INSERT INTO fornitori_terze_parti (id_fornitore, ragione_sociale, servizio_gestito, livello_criticita) VALUES
(1, 'Hosting Cloud Srl', 'Hosting cloud', 'Alta'),
(2, 'CRM Provider Spa', 'Gestione CRM', 'Alta'),
(3, 'Net Access Italia', 'Accesso rete', 'Media');

INSERT INTO asset_critici (id_asset, nome_asset, tipo_asset, id_responsabile, id_vendor) VALUES
(1, 'Server Web', 'Server', 1, 1),
(2, 'Database Clienti', 'Database', 2, 2),
(3, 'VPN Aziendale', 'Rete', 3, 3);

INSERT INTO servizi_erogati (id_servizio, nome_servizio, descrizione_funzionale, id_asset_collegato) VALUES
(1, 'Portale aziendale', 'Servizio web pubblico', 1),
(2, 'Sistema CRM', 'Gestione dati clienti', 2),
(3, 'Accesso remoto', 'Accesso interno', 3);
