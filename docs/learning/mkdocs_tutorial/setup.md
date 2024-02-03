---
title: Setup
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

## Installazione

In questa guida e tutorial utilizzeremo principalmente `poetry` come gestore delle librerie, per diverse motivazioni che potete guardare nella nostra serie: `Modern Python Development` e nel nostro [template python chiamato Bear](https://github.com/PythonBiellaGroup/Bear).

In particolare vi ricordiamo di:

1. Installare Poetry
2. Inizializzare un nuovo progetto: `poetry init` oppure clonare il nostro template `Bear`.
3. Ricordarsi di aggiungere il file `pyproject.toml` con il flag `in-project = true` per creare un nuovo virtualenv `.venv` direttamente nella cartella di progetto.

Puoi installare mkdocs come ogni altra libreria di python ma ovviamente il consiglio é di utilizzare un dependencies manager come pdm o poetry.

```shell
poetry add mkdocs
```

Oltre all' installazione base di mkdocs puoi usare diversi template che vanno ad arricchire la configurazione e il layout iniziale di mkdocs.
La libreria che preferiamo e suggeriamo é [mkdocs material](https://squidfunk.github.io/mkdocs-material/) che é tra le più usate ed apprezzate.
Alcune delle features che mette a disposizione le vedremo in questo tutorial.

```shell
poetry add mkdocs-material
```

Con mkdocs abbiamo la possibilità di ampliare le funzionalità con tantissime estensioni interessanti e molto utili che permettono di fornire una migliore esperienza d'uso all'utente.

## Inizializzazione

Una volta che avrai finito di sviluppare il tuo codice potrai lanciare questo comando

```shell
poetry mkdocs new .
```

Il risultato di questa istruzione é la creazione di:

- **cartella docs**: in questa folder potrai mettere tutti i markdown che andranno a costituire la documentazione.
- **mkdocs.yml**: é il file di configurazione principale di mkdocs in cui impostare tutte le proprietà del sito documentale.

## mkdocs.yml

Questo file é il più importante in mkdocs e fornisce tutte le informazioni per poter creare e personalizzare il sito finale.

Ecco alcune delle sezioni principali:

| Sezione      | Attributi                          | Descrizione |
| ----------- | ------------------------------------ |-----------------|
| project information | site_name, site_url, author, site_description |  informazioni di base per il sito  |
| repo information | repo_name, repo_url | é possibile linkare la repository al sito in modo da poter permettere ai visitatori di visionare il codice sorgente  |
| nav | -- | definisce l'alberatura del sito ed é possibile costruirla su più livelli |
| extra css | extra_css | é possibile estendere alcuni aspetti del sito con dei css custom|
| theme | -- | sono tutte le proprietà del tema scelto nel nostro caso mkdocs-material |
| markdown_extensions | -- | qui possiamo specificare le proprietà dei nostri markdown che di fatto andranno a determinare il layout delle singole pagine all'interno del sito|
| plugins | -- | in questa sezione andiamo a specificare tutti i plugin che abbiamo installato con le opzioni richieste da ciascuno|
| extra | analytics, social, consent, alternate | in questa sezione possiamo specificare funzionalità ulteriori per il nostro sito tra cui: collegamento a google analytics, social link nel footer del sito, consenso ad utilizzare cookie, switcher per siti multilingua|

## Run in locale

Quando avremo compilato il file mkdocs.yml e creato i markdown all'interno della cartella docs possiamo verificare in locale il risultato finale eseguendo:

```shell
poetry run mkdocs serve
```

MkDocs genererà tutti gli artefatti all'interno della folder **site** e metterà a disposizione il sito all'indirizzo **http://127.0.0.1:8000/**