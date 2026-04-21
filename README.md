# PW-Adamo-Cybersecurity-NIS2

Questo repository raccoglie la parte tecnica del Project Work sulla cybersecurity e la conformità alla Direttiva (UE) 2022/2555 (NIS2).  
L’obiettivo è rappresentare in modo strutturato asset critici, servizi digitali e dipendenze da fornitori, così da supportare la costruzione di un profilo utile ai fini ACN.

# Progetto Gestione Asset Critici e Supply Chain - NIS2/ACN

**Candidato:** Alessandro Adamo  
**Repository:** PW-Adamo-Cybersecurity-NIS2

---

## Data Dictionary (Dizionario dei Dati)

Il seguente dizionario descrive la struttura e le finalità delle tabelle utilizzate nel progetto.

### 1. Tabella: `anagrafica_contatti`
Scopo: gestione dei referenti per le comunicazioni e le notifiche di sicurezza.
- **id_contatto (PK)**: identificativo univoco del referente  
- **nominativo**: nome e cognome  
- **email_diretta**: contatto diretto per comunicazioni  
- **ruolo_aziendale**: ruolo all’interno dell’organizzazione  

### 2. Tabella: `fornitori_terze_parti`
Scopo: gestione dei fornitori e della supply chain.
- **id_fornitore (PK)**: identificativo del fornitore  
- **ragione_sociale**: nome dell’azienda  
- **servizio_gestito**: tipo di servizio fornito  
- **livello_criticita**: livello di rischio associato  

### 3. Tabella: `asset_critici`
Scopo: censimento degli asset principali.
- **id_asset (PK)**: identificativo dell’asset  
- **nome_asset**: nome della risorsa  
- **tipo_asset**: tipologia (server, database, ecc.)  
- **id_responsabile (FK)**: collegamento al referente  
- **id_vendor (FK)**: collegamento al fornitore  

### 4. Tabella: `servizi_erogati`
Scopo: rappresentare i servizi offerti.
- **id_servizio (PK)**: identificativo del servizio  
- **nome_servizio**: nome del servizio  
- **descrizione_funzionale**: descrizione operativa  
- **id_asset_collegato (FK)**: asset che supporta il servizio  

---

## Profilo ACN

Nel repository è presente un esempio di costruzione di una porzione del profilo di cybersecurity, coerente con la logica richiesta dall’ACN.

- `03_seed_dati_test.sql`: dati simulati per testare il sistema  
- `04_query_profilo_acn.sql`: vista SQL utilizzata per costruire il profilo  
- `profilo_acn.md`: esempio di output finale  
- `05_valutazione_profilo_acn.md`: modello di valutazione del profilo  

Il profilo è costruito a partire dai dati del database, mettendo in relazione asset, servizi, fornitori e punti di contatto, e assegnando un livello di criticità.

Caso di studio: organizzazione operante nel settore dei servizi digitali, con servizi esposti verso l’esterno e utilizzo di fornitori cloud.

---

### Esempio di profilo generato

| Asset | Servizio | Fornitore | Responsabile | Criticità fornitore | Livello profilo |
|------|---------|----------|-------------|---------------------|----------------|
| Server Web | Portale aziendale | Hosting Cloud Srl | Mario Rossi | Alta | Alta |
| Database Clienti | Sistema CRM | CRM Provider Spa | Giulia Bianchi | Alta | Alta |
| VPN Aziendale | Accesso remoto | Net Access Italia | Luca Verdi | Media | Media |

Il profilo è ottenuto tramite la vista SQL `vista_profilo_acn`, che unisce i dati relativi ad asset, servizi, fornitori e contatti.

Il livello di criticità non è assegnato in modo automatico, ma deriva dall’analisi combinata di più fattori: tipo di asset, impatto del servizio e dipendenza dal fornitore.

In questo modo si ottiene una prima porzione del profilo ACN, utile per avere una visione sintetica della sicurezza dell’organizzazione e supportare attività di analisi del rischio.
