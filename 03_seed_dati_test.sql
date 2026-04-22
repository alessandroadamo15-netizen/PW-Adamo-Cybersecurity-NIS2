INSERT INTO anagrafica_contatti (id_contatto, nominativo, email_diretta, ruolo_aziendale) VALUES
(1, 'Mario Rossi', 'mario.rossi@example.com', 'Responsabile IT'),
(2, 'Giulia Bianchi', 'giulia.bianchi@example.com', 'Responsabile CRM'),
(3, 'Luca Verdi', 'luca.verdi@example.com', 'Responsabile accessi'),
(4, 'Anna Neri', 'anna.neri@example.com', 'Responsabile infrastruttura cloud'),
(5, 'Paolo Greco', 'paolo.greco@example.com', 'Responsabile backup');

INSERT INTO fornitori_terze_parti (id_fornitore, ragione_sociale, servizio_gestito, livello_criticita) VALUES
(1, 'Hosting Cloud Srl', 'Hosting cloud', 'Alta'),
(2, 'CRM Provider Spa', 'Gestione CRM', 'Alta'),
(3, 'Net Access Italia', 'Accesso rete', 'Media'),
(4, 'Secure Backup Srl', 'Backup remoto', 'Media'),
(5, 'Mail Services Spa', 'Posta elettronica', 'Bassa');

INSERT INTO asset_critici (id_asset, nome_asset, tipo_asset, id_responsabile, id_vendor) VALUES
(1, 'Server Web', 'Server', 1, 1),
(2, 'Database Clienti', 'Database', 2, 2),
(3, 'VPN Aziendale', 'Rete', 3, 3),
(4, 'Sistema Backup', 'Storage', 5, 4),
(5, 'Mail Server', 'Applicazione', 4, 5);

INSERT INTO servizi_erogati (id_servizio, nome_servizio, descrizione_funzionale, id_asset_collegato) VALUES
(1, 'Portale aziendale', 'Servizio web pubblico esposto verso l’esterno', 1),
(2, 'Sistema CRM', 'Gestione dati clienti e processi commerciali', 2),
(3, 'Accesso remoto', 'Accesso sicuro per utenti interni', 3),
(4, 'Backup dati', 'Conservazione e ripristino dati aziendali', 4),
(5, 'Posta elettronica', 'Servizio di comunicazione interna ed esterna', 5);
