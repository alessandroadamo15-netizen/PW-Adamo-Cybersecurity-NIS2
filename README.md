# PW-Adamo-Cybersecurity-NIS2

Questo repository contiene l'implementazione tecnica a supporto del Project Work sulla cybersecurity e la conformità alla Direttiva (UE) 2022/2555 (NIS2). Il sistema è progettato per mappare gli asset critici, i servizi digitali e le dipendenze da fornitori terzi, facilitando il reporting verso l'ACN.

# Progetto Gestione Asset Critici e Supply Chain - NIS2/ACN

**Candidato:** Alessandro Adamo  
**Repository:** PW-Adamo-Cybersecurity-NIS2

---

## Data Dictionary (Dizionario dei Dati)

Il seguente dizionario descrive la struttura e le finalità delle tabelle implementate per la conformità alla Direttiva NIS2 e ai requisiti di segnalazione ACN.

### 1. Tabella: `anagrafica_contatti`
*Scopo: Censimento dei referenti per la notifica tempestiva degli incidenti (Punti di Contatto).*
* **id_contatto (PK)**: Chiave primaria univoca del referente.
* **nominativo**: Nome e cognome del responsabile tecnico/amministrativo.
* **email_diretta**: Indirizzo email per comunicazioni urgenti (obbligatorio NIS2).
* **ruolo_aziendale**: Posizione (es. CISO, IT Manager) per definire le responsabilità.

### 2. Tabella: `fornitori_terze_parti`
*Scopo: Monitoraggio della sicurezza della Supply Chain (Art. 21 NIS2).*
* **id_fornitore (PK)**: Identificativo univoco del vendor.
* **ragione_sociale**: Nome legale dell'azienda fornitrice.
* **servizio_gestito**: Tipologia di servizio fornito (es. Cloud, SaaS, Maintenance).
* **livello_criticita**: Valutazione del rischio (Alta, Media, Bassa) basata sull'impatto operativo.

### 3. Tabella: `asset_critici`
*Scopo: Inventario degli asset strategici e mappatura delle dipendenze.*
* **id_asset (PK)**: Identificativo univoco della risorsa tecnologica.
* **nome_asset**: Nome descrittivo dell'asset (es. Server SAP, Database Core).
* **tipo_asset**: Categoria (Hardware, Software, Virtual Asset).
* **id_responsabile (FK)**: Collegamento all'anagrafica contatti.
* **id_vendor (FK)**: Collegamento al fornitore (gestione rischio catena approvvigionamento).

### 4. Tabella: `servizi_erogati`
*Scopo: Analisi dell'impatto sul business e sui servizi finali.*
* **id_servizio (PK)**: Identificativo del servizio erogato all'utente.
* **nome_servizio**: Nome del servizio finale (es. Portale Clienti, Gestione Pagamenti).
* **descrizione_funzionale**: Dettaglio delle operazioni svolte dal servizio.
* **id_asset_collegato (FK)**: Relazione tecnica con l'asset che supporta il servizio.

---

## Profilo ACN

Nel repository è presente un esempio di generazione del profilo di cybersecurity conforme alla metodologia ACN.

- `03_seed_dati_test.sql`: dati simulati utilizzati per testare il sistema  
- `04_query_profilo_acn.sql`: vista SQL per la costruzione del profilo  
- `profilo_acn.md`: esempio di output finale del profilo  
- `05_valutazione_profilo_acn.md`: modello strutturato di valutazione del profilo di sicurezza  

Il profilo integra asset, servizi, fornitori e punti di contatto, con assegnazione di un livello di criticità derivato dai dati del database.

Caso di studio: organizzazione operante nel settore dei servizi digitali, caratterizzata da servizi esposti verso l’esterno e dipendenze da fornitori cloud.

---

### Esempio di profilo generato

| Asset | Servizio | Fornitore | Responsabile | Criticità fornitore | Livello profilo |
|------|---------|----------|-------------|---------------------|----------------|
| Server Web | Portale aziendale | Hosting Cloud Srl | Mario Rossi | Alta | Alta |
| Database Clienti | Sistema CRM | CRM Provider Spa | Giulia Bianchi | Alta | Alta |
| VPN Aziendale | Accesso remoto | Net Access Italia | Luca Verdi | Media | Media |

Il profilo è ottenuto tramite la vista SQL `vista_profilo_acn`, che integra i dati relativi ad asset, servizi, fornitori e contatti.

La determinazione del livello di criticità avviene considerando l'integrazione di più fattori: la tipologia dell’asset, l’impatto del servizio associato e il livello di rischio del fornitore. In questo modo il profilo non è una semplice aggregazione di dati, ma una rappresentazione sintetica della postura di sicurezza dell’organizzazione.

Il risultato ottenuto rappresenta una porzione del profilo ACN, utile per supportare attività di analisi del rischio, reporting e gestione degli incidenti, in linea con i requisiti della Direttiva NIS2.

