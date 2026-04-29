PW-Adamo-Cybersecurity-NIS2

Questo repository raccoglie la parte tecnica del Project Work sulla cybersecurity e sulla conformità alla Direttiva (UE) 2022/2555 (NIS2).

L’obiettivo del progetto è rappresentare in modo strutturato asset critici, servizi digitali e dipendenze da fornitori, così da costruire una base dati utile alla definizione di un profilo di cybersecurity coerente con quanto richiesto dall’ACN.

---

## Progetto: Gestione Asset Critici e Supply Chain - NIS2/ACN

**Candidato:** Alessandro Adamo
**Repository:** PW-Adamo-Cybersecurity-NIS2

---

## Data Dictionary (Dizionario dei Dati)

Il seguente dizionario descrive le principali tabelle utilizzate nel progetto.

### 1. Tabella: `anagrafica_contatti`

Scopo: gestione dei referenti per comunicazioni e notifiche.

* **id_contatto (PK):** identificativo univoco
* **nominativo:** nome e cognome
* **email_diretta:** contatto diretto
* **ruolo_aziendale:** ruolo nell’organizzazione

---

### 2. Tabella: `fornitori_terze_parti`

Scopo: gestione dei fornitori e della supply chain.

* **id_fornitore (PK):** identificativo del fornitore
* **ragione_sociale:** nome azienda
* **servizio_gestito:** tipologia servizio
* **livello_criticita:** livello di rischio

---

### 3. Tabella: `asset_critici`

Scopo: censimento degli asset principali.

* **id_asset (PK):** identificativo
* **nome_asset:** nome risorsa
* **tipo_asset:** tipologia
* **id_responsabile (FK):** riferimento contatto
* **id_vendor (FK):** riferimento fornitore

---

### 4. Tabella: `servizi_erogati`

Scopo: rappresentazione dei servizi offerti.

* **id_servizio (PK):** identificativo
* **nome_servizio:** nome servizio
* **descrizione_funzionale:** descrizione operativa
* **id_asset_collegato (FK):** asset associato

---

## Estensione: gestione dei profili ACN

Per rendere il modello coerente con la metodologia del Framework Nazionale per la Cybersecurity, è stata introdotta un’estensione dedicata alla gestione dei profili.

In questa logica, il profilo non è soltanto una classificazione degli asset, ma un insieme di subcategorie del Framework Core applicabili all’organizzazione.

Sono quindi state introdotte ulteriori strutture dati per gestire:

* subcategorie del Framework
* profilo target (situazione desiderata)
* profilo attuale (situazione reale)
* priorità di intervento
* livello di maturità
* livello di copertura dei controlli

Questa estensione consente di collegare la parte tecnica del database (asset, servizi, fornitori) alla logica di assessment prevista dalla normativa.

---

## File principali del repository

* `03_seed_dati_test.sql` → dati simulati
* `04_query_profilo_acn.sql` → costruzione profilo base
* `05_valutazione_profilo_acn.md` → modello di valutazione
* `06_query_supporto_profilo.sql` → query di analisi (asset, servizi, fornitori)
* `07_profili_acn.sql` → gestione profili ACN (subcategorie, maturità, copertura)
* `profilo_acn.md` → esempio di output

---

## Costruzione del profilo

Il profilo viene costruito a partire dai dati del database, mettendo in relazione:

* asset
* servizi
* fornitori
* punti di contatto

Queste informazioni rappresentano la base per contestualizzare il profilo.

A partire da questa base, vengono poi considerate le subcategorie del Framework, a cui sono associati:

* livello di priorità
* livello di maturità
* livello di copertura

---

## Caso di studio

Organizzazione operante nel settore dei servizi digitali, con:

* servizi esposti verso l’esterno
* utilizzo di infrastrutture cloud
* dipendenza da fornitori terzi

---

## Esempio di profilo generato

| Asset            | Servizio          | Fornitore         | Responsabile   | Criticità fornitore | Livello profilo |
| ---------------- | ----------------- | ----------------- | -------------- | ------------------- | --------------- |
| Server Web       | Portale aziendale | Hosting Cloud Srl | Mario Rossi    | Alta                | Alta            |
| Database Clienti | Sistema CRM       | CRM Provider Spa  | Giulia Bianchi | Alta                | Alta            |
| VPN Aziendale    | Accesso remoto    | Net Access Italia | Luca Verdi     | Media               | Media           |

Il profilo è ottenuto tramite query SQL che integrano le informazioni disponibili.

Il livello di criticità non è assegnato automaticamente, ma deriva da una valutazione complessiva che tiene conto di più fattori: tipologia di asset, impatto del servizio e dipendenza dal fornitore.

---

## Considerazioni finali

Il modello proposto rappresenta una base dati utile per supportare attività di analisi del rischio e costruzione del profilo di cybersecurity.

L’introduzione della gestione delle subcategorie e dei profili consente di avvicinare il modello alla logica del Framework ACN, rendendo possibile non solo la raccolta dei dati, ma anche il loro utilizzo all’interno del processo di assessment.
