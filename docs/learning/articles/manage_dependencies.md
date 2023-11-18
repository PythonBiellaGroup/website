---
title: Gestire le dipendenze in python
disquis: PythonBiellaGroup
timetoread: true
---
## Intro

Per gestire le dipendenze da Python 3.3 esiste un built-in module chiamato venv che consente di creare dei virtualenv all’interno del vostro progetto.

Questa ovviamente è la “vecchia maniera” però è sempre funzionante

```
python -m venv my-virtualenv
```

Il comando consente di creare una directory my-virtualenv che contiene:

* python binary
* pip/easy_install/wheel binary
* activation script
* binary files utilizzate da Python

Per attivare un virtualenv si può fare:

```
#Su Linux o Mac
source ./my-virtualenv/bin/activate

#Su windows
my-virtualenv\Scripts\activate.bat

#Disattivare virtualenv
deactivate
```

I virtualenv sono molto comodi e si possono usare in combinazione con i file **requirements.txt**

Certamente è un metodo molto comodo, tuttavia ci sono degli strumenti più potenti ed efficaci per gestire il proprio ambiente.

---

## Pyenv-virtualenv

Pyenv mette a disposizione uno strumento ancora più efficace per costruire ambienti virtuali attraverso un plugin **pyenv-virtualenv**

```
#Creare un virtualenv
pyenv virtualenv 3.7.4 my-project

#lista di tutti i virtual environments
pyenv virtualenvs

#attivare un virtualenv
pyenv activate my-project

#disattivare un virtualenv
pyenv deactivate
```

Oltre a virtualenv e pyenv-virtualenv ci sono altri strumenti molto utili e interessanti come:

* conda (che introduce anche il conda package manager) che è molto invasivo
* virtualfish
* virtualenvwrapper
* pipenv: molto citato in tantissimi tutorial, ma è veramente poco mantenuto (l’ultima versione risale al 2018 con 300+ issue aperte) e può causare diversi problemi in un progetto (oltre ad esserci diverse controversie legate al progetto: https://github.com/pypa/pipenv/issues/4058)
* pipx: per centralizzare alcune dipendenze


---

## Pipx

È vero che ogni progetto dovrebbe sempre avere le proprie dipendenze e vivere in maniera atomica e indipendente rispetto agli altri progetti.

Tuttavia ci sono alcune librerie che possono essere globali su tutta la macchina e su tutto il sistema.

Alcune di queste librerie sono quelle che servono per gestire la qualità del codice o lo stile, come ad esempio **black** o **flake8**

Ecco quindi che viene in soccorso **pipx** che consente di installare queste librerie globali e usarle globalmente su tutta la macchina.

[https://github.com/pipxproject/pipx](https://github.com/pipxproject/pipx)

Sostanzialmente quando volete installare delle librerie su tutta la macchina globalmente, invece di fare ```pip install my_package``` fate ```pipx install my_package```

```
#Lista di tutti i pacchetti
pipx list

# rimuovere un pacchetto
pipx uninstall my_package

# Lanciare una liberia o un comando
pipx run black my_file

# Si può anche specificare una determinata versione del pacchetto
pipx run --spec black==18.3a1 black --version
```

Ogni volta che viene lanciato pipx run my_package quello che succede è che viene creato temporaneamente un virtualenvironment dentro al quale viene eseguito il comando per poi essere distrutto.

Su visual studio è importante fare questo settaggio se si vuole usare pipx (lo si fa una volta sola)

```
# Installare il pacchetto
pipx install flake8

# visualizzare dove viene installato il pacchetto
which flake8
<path>

# Copiare il path e dire a visual studio quale binario prendere
# Dentro al file settings.json (vedere come si fa a prendere) inserire
"python.linting.flake8Path": "/Users/YOUR_USERNAME/.local/bin/flake8"
```

---

## Virtualenv

Pipenv vs virtualenv: [https://medium.com/@dakota.lillie/an-introduction-to-virtual-environments-in-python-ce16cda92853](https://medium.com/@dakota.lillie/an-introduction-to-virtual-environments-in-python-ce16cda92853)

Venv: [https://medium.com/@rahul3012_37725/a-very-basic-guide-to-python-virtual-environments-a53d1e191490](https://medium.com/@rahul3012_37725/a-very-basic-guide-to-python-virtual-environments-a53d1e191490)

```
# install virtualenv
pip install virtualenv

#Prima di lanciare il successivo comando controllare di essere su conda e fare:
conda activate development #la versione di conda che usate deve essere >= versione desiderata

# generate a new virtualenv in a specific path
virtualenv --python=3.6 <path_nome_env>

#### UNIX (mac and linux)
source <path_nome_env>/bin/activate

#### WINDOWS
<path_nome_env>\scripts\activate

#### Visual Studio Code 
#(install Microsoft Python Extension and then click on python in the bottom tab)
#Windows
navigate to -> <path_nome_env>\scripts\<python3.6>
#UNIX
navigate to -> <path_nome_env>/bin/<python3.6>

#Warning: if you are using another python version, change python3.6 to your current version

#Then install requirements.txt
pip install -r requirements.txt
```

Prevent conda to activate default base environment by default ```conda config --set auto_activate_base false```

PEP 518: introduce il pyproject.toml che rimpiazza quasi tutto.

Publish package to Pypi (old school)

[https://www.youtube.com/watch?v=GIF3LaRqgXo&ab_channel=CodingTech](https://www.youtube.com/watch?v=GIF3LaRqgXo&ab_channel=CodingTech)

Use uf PipEnv

[https://hackersandslackers.com/pipenv-python-environment-management/
](https://hackersandslackers.com/pipenv-python-environment-management/)

Differenze tra PipEnv, Pip e Conda (DevOps Concepts)

[https://towardsdatascience.com/devops-for-data-science-making-your-python-project-reproducible-f55646e110fa](https://towardsdatascience.com/devops-for-data-science-making-your-python-project-reproducible-f55646e110fa)

---


## Poetry

### Ovewrview

Poetry è un nuovo modo di gestire progetti con Python che si adatta ai linguaggi e ai framework moderni più famosi (come ad esempio node con npm o nuget per .NET)

È a tutti gli effetti un **package and dependency management tool** che consente quindi di gestire pacchetti, dipendenze, versioni unendo sia la gestione della versione di python in un determinato progetto con le rispettive dipendenze oltre ad introdurre concetti molto più avanzati.

Le feature più importanti introdotte da Poetry sono:

* gestione del progetto e delle librerie in modo deterministico (e agile)
* facilità di costruire builds e package per il progetto con comandi configurabili
* pubblicare pacchetti velocemente su pypi
* traccia le dipendenze di progetto con un singolo comando

È un progetto nuovo, ci sono ancora diverse issue aperte, ma la community è veramente molto attiva e stanno proponendo soluzioni sempre migliori oltre ad essere già stabile (e sicuro) per essere usato anche in produzione.

### Come usare poetry

Il cuore di Poetry è il file **pyproject.toml** che viene creato all’interno del progetto al momento dell’inizializzazione.

Questo file consente di definire tutte le caratteristiche di progetto e di gestire l’intero progetto (come se usassimo un package.json su javascript per intenderci)

Vediamo quindi come usare Poetry in un nuovo progetto:

```
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

```
# Inizializzare poetry all'interno di una directory
poetry init

# Se vuoi mantenere il .venv all'interno della cartella di progetto fare:
poetry config virtualenvs.in-project true

## Import requirements.txt libraries all'interno di poetry
poetry add $( cat requirements.txt )

# Se non esiste un requirements.txt continuare con classico format
```

Generate poetry requirements.txt
```
#Creare un file requirements.txt dalla configurazione di poetry
poetry export -f requirements.txt --output requirements.txt
```

Esempio di pyproject.toml

```
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

```
#Installare pip
poetry add pip

#Oppure aggiornare pip una volta creato il .venv con poetry
#Importante avere prima il .venv
pip install --upgrade pip
```

Questo è un workaround per superare problemi di installazione molto lunga.

Poetry è sicuramente più lento di virtualenv, ma è molto più sicuro e più severo in quanto prima controlla tutte le dipendenze verificando che siano sicure.


---


### Poetry avanzato

Poetry è il più sofisticato sistema di gestione delle dipendenze su Python disponibile (nel 2020).

Consente di andare al di là della semplice gestione delle dipendenze, con funzioni come: generare .lock files, consentire di fare scaffolding dei progetti con molte possibilità di personalizzazione, il tutto disponibile via CLI.


---

#### Installare poetry e includere l’installazione
Per installare Poetry è importante fare riferimento alla guida ufficiale che descrive i passi per i vari sistemi operativi.

Non riportiamo volutamente i passi necessari all’installazione siccome cambiano spesso con i nuovi aggiornamenti e le nuove versioni.

A tal proposito il sito di riferimento è: [documentazione ufficiale](https://python-poetry.org/docs/#installing-with-the-official-installer)

---

### Creare un progetto python utilizzando Poetry

```
poetry new poetry-tutorial-project
```

La ricetta segreta di ogni progetto costruito con poetry è la creazione di un file chiamato pyproject.toml . All’interno di questo file è possibile definire tutto quello che esiste all’interno del progetto: metadati, dipendenze, librerie, scripts e molto altro…

Se siete a vostro agio con node.js possiamo considerare il file pyproject.toml come un package.json del progetto.

**Composizione di poetry (file toml)**

Documentazione: [https://python-poetry.org/docs/pyproject/](https://python-poetry.org/docs/pyproject/)

* [tool.poetry] = semplice metadato informativo riguardo al package che state sviluppando (come il package name, descrizione, autore, dettagli, …). Alcune impostazioni sono utili solamente se pensate di pubblicare il vostro pacchetto su Pypi.
* [tool.poetry.dependencies] = Consente di definire le dipendenze dell’applicazione che sono assolutamente necessarie per lanciare il vostro programma. È anche possibile impostare una versione particolare del pacchetto che volete installare (such as Flask = “1.0.0”), Se invece si vuole semplicemente definire l’ultima versione è possibile inserire solamente “*”. È anche possibile specificare la versione di Python richiesta per lanciare il progetto e la vostra applicazione.
* [tool.poetry.dev-dependencies] = Le Dev dependencies sono tutte le librerie che servono agli sviluppatori per costruire e programmare il progetto, ma che non devono essere portare in produzione. Queste dipendenze non servono per lanciare l’applicazione e non verranno scaricate se l’applicazione viene “buildata” di default.
* [build-system] = Questa sezione è raramente utilizzata, modificatela solamente se avete intenzione di aggiornare Poetry.
* [tool.poetry.scripts] = Qui è dove si specificano gli entry point dell’applicazione, assegnando una funzione all’interno dei moduli necessaria a lanciare l’applicazione. L’esempio utilizza: run = “wsgi:main” che specifica che vogliamo creare un comando “run” che cercherà all’interno del file: “wsgi.py” una funzione chiamata: main(). Con questa impostazione è possibile lanciare l’applicazione utilizzando la CLI scrivendo: poetry run
* [tool.poetry.urls]: Questa impostazione è opzionale e può essere utilizzata per inserire link utili di risorse, documentazione o altro legato al progetto e importanti se volete rilasciare il vostro pacchetto.

---

### Installare e gestire le dipendenze

#### poetry shell
La prima volta che questo comando viene eseguito nella directory del tuo progetto, Poetry crea un ambiente virtuale Python che sarà per sempre associato a questo progetto. Invece di creare una cartella contenente le tue librerie di dipendenza (come fa virtualenv), Poetry crea un ambiente su un percorso di sistema globale, separando così il codice sorgente di dipendenza dal tuo progetto. Una volta che questo ambiente virtuale è creato, può essere attivato di nuovo in qualsiasi momento semplicemente eseguendo poetry shell nella directory del tuo progetto in futuro. Prova a confrontare l’output di python prima e dopo aver attivato la shell del tuo progetto per vedere come Poetry gestisce gli ambienti virtuali.

#### poetry install
Installa le dipendenze specificate in pyproject.toml. La prima volta che le dipendenze di un progetto vengono installate, viene creato un file .lock, che contiene i numeri di versione effettivi di ogni pacchetto che è stato installato (ad esempio: se Flask = “*” ha portato a scaricare Flask versione 1.0.0, il numero di versione effettivo verrebbe memorizzato in .lock). Se è presente un file .lock, i numeri di versione in .lock avranno sempre la priorità su quelli presenti in pyproject.toml.

#### poetry update
Imita la funzionalità di install, con l’eccezione che i numeri di versione in .lock NON saranno rispettati. Se esistono versioni più recenti per i pacchetti in pyproject.toml, saranno installate le versioni più recenti e .lock sarà aggiornato di conseguenza.

#### poetry add [package-name]
Una scorciatoia per aggiungere una dipendenza a pyproject.toml. Il pacchetto viene installato immediatamente dopo essere stato aggiunto.

#### poetry remove [package-name]
Comando per rimuovere una determinata dipendenza dalla lista delle dipendenze del progetto definite nel pyproject.toml

#### poetry export -f requirements.txt > requirements.txt
Esporta il contenuto del file .lock del tuo progetto in requirements.txt. È utile quando si passa il lavoro a sviluppatori che usano ancora requirements.txt per qualche motivo.

È anche possibile eseguire il seguente comando: **poetry export -f requirements.txt --output reqtest.txt --without-hashes** che consente di esportare le dipendenze in un file con un nome diverso (reqtest.txt) e senza gli hash che codificano i pacchetti. Questo comando può essere utile se con il comando normale ci sono dei problemi nell’installazione dei requirements.txt

#### poetry env list --full-path
Visualizzare il percorso e l’elenco dell’ambiente.

---

### Configurazioni

#### poetry config
“Config” si riferisce alla configurazione a livello di ambiente, come i percorsi dell’ambiente virtuale corrente o le variabili di ambiente. Passando l’opzione –list restituirà gli attuali valori di configurazione del tuo ambiente.

#### poetry check
Consente di controllare il file pyproject.toml per eventuali errori

#### poetry show
Restituisce una ripartizione di tutti i pacchetti attualmente installati nel progetto, comprese le dipendenze delle dipendenze.

---

### Esecuzione dell’applicazione

#### poetry run [script-name]
Esegue lo script definito all’interno della sezione: [tool.poetry.scripts] del pyproject.toml

#### Buildare e pubblicare il pacchetto (progetto)

#### poetry build
Consente di creare una build del codice sorgente e dell’archivio wheels

#### poetry publish
Pubblica l’output della build all’interno di una repository esterna (come ad esempio Pypi)

### Poetry Getting Started

Vediamo adesso come fare per inizializzare poetry all’interno di un nuovo progetto

```
##Inizializziamo poetry all'interno di una cartella
poetry init

#Oppure creiamo un nuovo progetto (crea anche una sotto cartella)
poetry new <app_name>

## Ora potete modificare il file: pyproject.toml come volete

#Se volete creare la cartella .venv all'interno del progetto fate:
poetry config virtualenvs.in-project true

#Ora occore compilare poetry per creare il venv
#E lanciare la shell con il venv che avete definito
poetry shell

#Se necessario aggiornare pip
python -m pip install --upgrade pip
# Questo può essere necessario se compaiono degli errori nell'installazione delle dipendenze

#Aggiungere una dipendenza e installarla
poetry add pandas

#Aggiungere una dipendenza di sviluppo e installarla
poetry add -D flake8

#Se avete definito le librerie all'interno del pyproject.toml
#È possibile installarle lanciando questo comando
poetry install

#Per lanciare un file definito nel pyproject.toml
poetry run <script>

#Visualizzare il path del virtual env all'interno del progetto (o fuori)
#Con anche la lista delle librerie installate
poetry show -v

# È sempre possibile visualizzare la versione di default di python in uso correntemente
which python

#Per uscire dalla shell di poetry e dall'ambiente creato
exit

#Rimuovere un ambiente virtuale (venv) utilizzanto poetry
poetry env remove <python>
```

### Aggiungere poetry ad un progetto esistente (con dei requirements.txt)

```
#inizializzare poetry all'interno di una directory
poetry init

#compilare le informazioni all'interno del pyproject.toml

#Se si vuole utilizzare un virtual env all'interno del progetto fare:
poetry config virtualenvs.in-project true

## Importare i requirements.txt (librerie) all'interno di poetry
poetry add $( cat requirements.txt )
# Non è "bellissimo" e potrebbe non funzionare
```

Generare da poetry un file: requirements.txt

```
poetry export -f requirements.txt > requirements.txt

#Un esempio più completo
poetry export -f requirements.txt --output reqtest.txt --without-hashes
#crea un file: reqtest.txt differente
#senza gli hash (ovvero senza la firma delle librerie) 
#è meno safe perchè con gli hash pip potrebbe avere problemi nell'installazione
```

Attenzione può accadere in alcune situazioni di dover aggiornare pip per installare alcune librerie, per farlo una volta creato e attivato il vostro virtualenvironment con python fare:

```
#Aggiornare pip
python -m pip install --upgrade pip
```

Questo problema può verificarsi appena lanciate un’installazione di una libreria oppure fate **poetry install** o **poetry update**.

ATTENZIONE: non chiamate nessun file o modulo, oppure il vostro progetto come un nome di una libreria che installerete utilizzando poetry.

Oltre ad essere un cattiva pratica in un progetto manderà in confusione poetry dandovi un **AssertionError**.

[https://github.com/python-poetry/poetry/issues/236](https://github.com/python-poetry/poetry/issues/236)

Se vi trovaste nella situazione di aver creato un modulo, una cartella o un file con lo stesso nome di una libreria il consiglio è quello di rinominare il file o cartella incriminata, eliminare il vostro virtualenvironment e lanciare nuovamente: poetry install per installare una versione pulita del virtualenv.

---

## Poetry in VSCode

Poetry non è ancora integrato all’interno di vscode e nell’estensione ufficiale di Python, quindi per utilizzarlo con vscode è necessario configurarlo manualmente.

Per consentire al progetto di utilizzare l’ambiente virtuale del progetto è necessario definire un file inserendo il path di riferimento dell’ambiente virtuale creato con poetry

* lanciare nel terminale: **poetry env list --full-path** e copiare il path che si riferisce all’ambiente virtuale (venv) di poetry
* All’interno del progetto creare una nuova cartella chiamata: **.vscode**
* All’interno della cartella creare un file chiamato: **settings.json**
* Inserire nel file la seguente configurazione

```
{
    "python.pythonPath": "<path dell'ambiente venv copiato>"
}
```

* Rilanciare vscode e in automatico quando aprirete un file .py verrà utilizzata la versione di Python che avete creato con Poetry

Ricordarsi sempre di lanciare nel terminale: **poetry shell** per lanciare l’ambiente

Ricordarsi di non pushare sulla vostra repository git remota le configurazioni di vscode appena create per non sovrascrivere quelle dei colleghi (inserite la cartella .vscode nel file **gitignore**)

Un altro metodo

Lanciare il progetto da terminale

```
#dire a poetry di generare in locale il virtualenv
poetry config virtualenvs.in-project true --local
poetry config virtualenvs.create true --local
poetry config settings.virtualenvs.in-project true

#quindi lanciare
poetry install
```

In questo modo generete un cartella chiamata: virtualenv all’interno del progetto, in questo modo vscode capirà che questo è il default virtualenv da utilizzare invece di quello globale

Se si vuole fermare l’utilizzo del .venv all’interno del progetto è possibile fare:

```
#tell poetry not to use venv inside the proj folder
poetry config virtualenvs.in-project false --local
poetry config virtualenvs.create false --local
poetry config settings.virtualenvs.in-project false
```

---

## Installare poetry nella cartella di progetto

Un’impostazione molto utile per poetry (anche con vscode) è quella di dire a poetry di installare il virtualenv python con le rispettive librerie all’interno della cartella di progetto.

Questo è molto comodo perchè ad esempio con vscode vi basta inserire l’impostazione:

```
"python.pythonPath": "${workspaceFolder}/.venv/bin/python"
```

Per attivare il virtualenv nel vostro progetto in modo automatico.

Attention: ricordatevi sempre di inserire **.venv** all’interno del file: **.gitignore** per non pushare sulla vostra repository tutto il virtualenv!!

Per fare questo, il modo più semplice è fare da terminale: **poetry config virtualenvs.in-project true**.

Ma se volete attivarlo di default potete aggiungere un file: **poetry.toml** nella cartella di progetto così formato:

```
[virtualenvs]
create = true
in-project = true
```

In questo modo tutte le volte che si farà: **poetry install** verrà installato poetry nella cartella di progetto in automatico.

Per visualizzare tutte le possibili configurazioni installate su una repository è possibile usare il comando:

```
# visualize all the configurations
poetry config --list
```

Per rimuovere delle configurazioni invece è possibile fare:

```
poetry config --unset repo.foo
```

---

## Un esempio di Pyproject.toml
Ecco un esempio di file pyproject.toml che potete utilizzare sui vostri progetti (ovviamente con gli opportuni cambiamenti e personalizzazioni)

```
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

## Aggiornare poetry
Aggiornare poetry all’ultima versione stabile è semplice

```
#Aggiornare poetry all'ultima versione stabile
poetry self update

#Lanciare questo comando se invece volete installare la preview di poetry
poetry self update --preview
```

## Cancella poetry
Per cancellare e rimuovere poetry è possibile eseguire questi comandi

```
#Uninstall poetry
python get-poetry.py --uninstall

# Another method (optional)
# Setting the POETRY_UNINSTALL env variable befor executing the installer
POETRY_UNINSTALL=1 python get-poetry.py
```

## Abilitare il completamento per bash o zsh
Poetry supporta il completamento automatico da terminale per diverse CLI come: bash, zsh o fish.

Se volete avere ulteriori dettagli su queste funzionalità potete lanciare: **poetry help completions**

```
poetry completions bash > /etc/bash_completion.d/poetry.bash-completion

# Bash (Homebrew)
poetry completions bash > $(brew --prefix)/etc/bash_completion.d/poetry.bash-completion

# Zsh
poetry completions zsh > ~/.zfunc/_poetry

# Oh-My-Zsh
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
```

Dovrete riavviare la shell per poter vedere le modifiche

Attenzione (alcuni dettagli):

For **zsh** you must add the following line into **~/.zshrc** profile before **compinit**

```fpath+=~/.zfunc```

For **oh-my-zsh** you must then enable poetry in your **~/.zshrc** plugin

```
plugins(
    poetry
    ...
    )
```

---

## Utilizzare strumenti con poetry
Con poetry inoltre è possibile utilizzare alcuni strumenti utili per linting, controllo e test del codice come:

* black
* flake8
* mypy

---

## Integrazione con pytest
Poetry inoltre supporta l’integrazione con pytest e permette di definire degli argomenti per i test che possono tornare utili soprattutto nel caso di applicazioni molto grandi e corpose che richiedono una maggiore copertura dei casi di test.

## Deploy
Come utilizzare poetry con Docker in fase di deploy?

Ecco alcuni link interessanti

* [https://medium.com/@harpalsahota/dockerizing-python-poetry-applications-1aa3acb76287](https://medium.com/@harpalsahota/dockerizing-python-poetry-applications-1aa3acb76287)
* docker caching: [https://pythonspeed.com/articles/poetry-vs-docker-caching/](https://pythonspeed.com/articles/poetry-vs-docker-caching/)
* Production Ready Docker packaging for python developers: [https://pythonspeed.com/docker/#articles-the-basics-of-docker-packaging](https://pythonspeed.com/docker/#articles-the-basics-of-docker-packaging)

A tal proposito condividiamo qui un Dockerfile di esempio in modo da poter utilizzare questo come base per il deploy (anche per immagini in produzione)

Dockerfile

```
FROM python:3.8

# Metadata
LABEL name="PBG Poetry Example"
LABEL maintainer="PBG"
LABEL version="0.1"

ARG YOUR_ENV="virtualenv"

ENV YOUR_ENV=${YOUR_ENV} \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.1.13 \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

# System deps:
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y libpq-dev gcc

# Install poetry
RUN pip install "poetry==$POETRY_VERSION"

# Copy only requirements to cache them in docker layer
WORKDIR /app

#Copy all the project files
COPY . .
# Install libraries 
RUN poetry config virtualenvs.create false \
    && poetry install $(test "$YOUR_ENV" = production) --no-dev --no-interaction --no-ansi

# Set the launching script exec
RUN chmod +x launch.sh

# Launch the script for cron
CMD ["bash", "launch.sh"]

# Launch main python script
# CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "core.app:app"]
```

---

## Standardizzare le impostazioni

Su Poetry è possibile standardizzare le impostazioni di poetry per un determinto progetto all’interno di un file, evitando che lo sviluppatore o una pipeline di rilascio debba lanciare manualmente dei comandi per configurare poetry.

Per fare questo è possibile creare un file chiamato: **poetry.toml** all’interno del progetto.

Un esempio di file può essere questo:

```
[virtualenvs]
in-project = true
create = true
```

Queste impostazioni consentono di creare un .venv all’interno del progetto senza lanciare manualmente il comando di creazione del venv all’interno del progetto da terminale.

Con questo file è possibile fare overriding di tutte le impostazioni di poetry.

Per vedere l’elenco delle impostazioni che è possibile inserire, fare riferimento a questa documentazione:

[https://python-poetry.org/docs/configuration/](https://python-poetry.org/docs/configuration/)

---

## Documentazione e link utili
Documentazione ufficiale (fatta molto bene) : [https://python-poetry.org/docs/basic-usage/](https://python-poetry.org/docs/basic-usage/)

[https://hackersandslackers.com/python-poetry-package-manager/](https://hackersandslackers.com/python-poetry-package-manager/)

[https://www.youtube.com/watch?v=QX_Nhu1zhlg&ab_channel=PyGotham2019](https://www.youtube.com/watch?v=QX_Nhu1zhlg&ab_channel=PyGotham2019)

Build CLI Utilities with Poetry and Typer: [https://www.pluralsight.com/tech-blog/python-cli-utilities-with-poetry-and-typer/](https://www.pluralsight.com/tech-blog/python-cli-utilities-with-poetry-and-typer/)

Confronto con altre librerie: [https://towardsdatascience.com/devops-for-data-science-making-your-python-project-reproducible-f55646e110fa](https://towardsdatascience.com/devops-for-data-science-making-your-python-project-reproducible-f55646e110fa)

Use Poetry in Production (with Docker): [https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker](https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker)

Data Science PRO with Poetry + Jupyter + VSCode: [https://medium.com/analytics-vidhya/setting-up-data-science-python-projects-with-vscode-poetry-jupyter-b96efeea24c8](https://medium.com/analytics-vidhya/setting-up-data-science-python-projects-with-vscode-poetry-jupyter-b96efeea24c8)

Poetry Configure Workspace:

[https://zhauniarovich.com/post/2020/2020-02-configuring-python-workspace-p2/](https://zhauniarovich.com/post/2020/2020-02-configuring-python-workspace-p2/)

To solve problems with psycopg2 and Python

[https://blog.vince.id/installing-psycopg2-on-macos](https://blog.vince.id/installing-psycopg2-on-macos)
