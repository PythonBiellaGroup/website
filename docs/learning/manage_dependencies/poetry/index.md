# Poetry

## Overview

Poetry è un nuovo modo di gestire progetti con Python che si adatta ai linguaggi e ai framework moderni più famosi (come ad esempio node con npm o nuget per .NET)

È a tutti gli effetti un **package and dependency management tool** che consente quindi di gestire pacchetti, dipendenze, versioni unendo sia la gestione della versione di python in un determinato progetto con le rispettive dipendenze oltre ad introdurre concetti molto più avanzati.

Le feature più importanti introdotte da Poetry sono:

- gestione del progetto e delle librerie in modo deterministico (e agile)
- facilità di costruire builds e package per il progetto con comandi configurabili
- pubblicare pacchetti velocemente su pypi
- traccia le dipendenze di progetto con un singolo comando

È un progetto nuovo, ci sono ancora diverse issue aperte, ma la community è veramente molto attiva e stanno proponendo soluzioni sempre migliori oltre ad essere già stabile (e sicuro) per essere usato anche in produzione.

## Come usare poetry

Il cuore di Poetry è il file **pyproject.toml** che viene creato all’interno del progetto al momento dell’inizializzazione.

Questo file consente di definire tutte le caratteristiche di progetto e di gestire l’intero progetto (come se usassimo un package.json su javascript per intenderci)

Vediamo quindi come usare Poetry in un nuovo progetto:

```bash
# Inizializzare poetry all'interno di una cartella
poetry init

# Oppure creare un nuovo progetto
poetry new <app_name>

# All'interno del progetto modificare il file: pyproject.tml come desiderate

# Se vuoi utilizzare un venv all'interno del progetto fare:
poetry config virtualenvs.in-project true
# Se non si usa questa impostazione rimarrà all'interno della cartella generale di poetry

# Compilare il file pyproject.toml per creare il venv di progetto
poetry shell

# Aggiungere nuove dipendenze (al pyproject.toml)
poetry add pandas

# Installare dipendenze (in automatico aggiunte al pyproject.toml)
poetry install

# lanciare un file
poetry run <script>

# Visualizzare il path di dove si trova il venv di quel progetto (e anche l'elenco delle librerie)
poetry show -v

#Uscire da una shell lanciata da poetry
exit
```

Attenzione: su windows utilizzando PowerShell quando fate: poetry shell in automatico vi butta fuori da powershell e vi farà usare cmd.

È un bug noto e comunque c’è un modo per risolverlo (un workaround)

[https://github.com/python-poetry/poetry/issues/2030](https://github.com/python-poetry/poetry/issues/2030)

Come usare poetry in un progetto già esistente?

Magari che contiene già un **requirements.txt** file

```bash
# Inizializzare poetry all'interno di una directory
poetry init

# Se vuoi mantenere il .venv all'interno della cartella di progetto fare:
poetry config virtualenvs.in-project true

## Import requirements.txt libraries all'interno di poetry
poetry add $( cat requirements.txt )

# Se non esiste un requirements.txt continuare con classico format
```

Generate poetry requirements.txt

```bash
#Creare un file requirements.txt dalla configurazione di poetry
poetry export -f requirements.txt --output requirements.txt
```

### Esempio di pyproject.toml

```toml
[tool.poetry]
name = "poetry-tutorial-project"
version = "0.1.0"
description = "Simple python project built with poetry"
authors = ["Andrea Guzzo <andrea.guzzo92@gmail.com>"]
maintainers = ["Andrea Guzzo <andrea.guzzo92@gmail.com>"]
license = "MIT"
readme = "README.md"
homepage = "http://localhost:5000"
repository = "https://github.com/jeydi/"
documentation = "https://github.com/jeydi/"
keywords = [
        "Poetry",
        "Venv",
        "Virtual enviroments",
        "Packages",
        "Packaging"
]

[tool.poetry.dependencies]
python = "^3.7"
loguru = "*"
psutil = "*"
pandas = "*"
numpy = "*"
fastapi = "*"
typer = "^0.3.2"

[tool.poetry.dev-dependencies]
pytest = "^5.2"

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.core.masonry.api"

[tool.poetry.scripts]
run = "wsgi:main"

[tool.poetry.urls]
issues = "https://github.com/jeydi/"
```

**Attenzione**:

Per alcune librerie (ad esempio pandas), potrebbero esserci dei problemi di versionamento rispetto alle librerie dipendenti. A tal proposito si consiglia di installare anche pip come dipendenza e aggiornarlo all’ultima versione.

```bash
#Installare pip
poetry add pip

#Oppure aggiornare pip una volta creato il .venv con poetry
#Importante avere prima il .venv
pip install --upgrade pip
```

Questo è un workaround per superare problemi di installazione molto lunga.

Poetry è sicuramente più lento di virtualenv, ma è molto più sicuro e più severo in quanto prima controlla tutte le dipendenze verificando che siano sicure
