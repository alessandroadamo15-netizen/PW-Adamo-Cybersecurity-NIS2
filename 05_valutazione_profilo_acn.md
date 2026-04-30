# Valutazione del profilo ACN

Caso di studio: organizzazione operante nel settore dei servizi digitali.

## Criteri di valutazione

Il profilo è stato costruito considerando:

* esposizione dell’asset
* impatto del servizio
* presenza di dati sensibili
* rischio del fornitore

## Matrice di valutazione

| Asset            | Esposizione | Impatto servizio | Dati sensibili | Rischio fornitore | Profilo risultante |
| ---------------- | ----------- | ---------------- | -------------- | ----------------- | ------------------ |
| Server Web       | Esterno     | Alto             | No             | Medio             | Alto               |
| Database Clienti | Interno     | Alto             | Sì             | Alto              | Alto               |
| VPN Aziendale    | Interno     | Medio            | No             | Medio             | Medio              |
| Sistema Backup   | Interno     | Medio            | Sì             | Medio             | Medio              |
| Mail Server      | Esterno     | Medio            | No             | Basso             | Basso              |

Il profilo risultante deriva dalla combinazione tra più fattori e non da un singolo elemento. In particolare, la variazione del rischio fornitore o dell’impatto del servizio consente di ottenere livelli di criticità differenti anche a parità di asset.

Questa matrice rappresenta una porzione del profilo ACN costruita a partire dai dati del database e dalle query del repository, e consente di ottenere una prima valutazione sintetica della postura di sicurezza dell’organizzazione.
