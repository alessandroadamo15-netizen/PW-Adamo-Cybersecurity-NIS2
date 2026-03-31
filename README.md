# PW-Adamo-Cybersecurity-NIS2
Questo repository contiene l'implementazione tecnica a supporto del Project Work sulla cybersecurity e la conformità alla Direttiva (UE) 2022/2555 (NIS2). Il sistema è progettato per mappare gli asset critici, i servizi digitali e le dipendenze da fornitori terzi, facilitando il reporting verso l'ACN.
# Progetto Gestione Asset Critici e Supply Chain - NIS2/ACN
**Candidato:** Alessandro Adamo  
**Repository:** PW-Adamo-Cybersecurity-NIS2

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
