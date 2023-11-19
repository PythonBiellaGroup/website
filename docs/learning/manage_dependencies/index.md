---
title: Gestire le dipendenze in python
disquis: PythonBiellaGroup
timetoread: true
---

Gestire le dipendenze di un progetto è fondamentale per tenere allineato, ordinato e soprattutto coerente l'ambiente di sviluppo.

Tuttavia questa attività su Python non è così semplice perchè manca uno strumento di gestione delle librerie ufficiale moderno, come ad esempio in Javascript o in Rust.

Per gestire le dipendenze da Python 3.3 esiste un built-in module chiamato venv che consente di creare dei virtualenv all’interno del vostro progetto.

Questa ovviamente è la “vecchia maniera” però è sempre funzionante

```bash
python -m venv my-virtualenv
```

Il comando consente di creare una directory my-virtualenv che contiene:

- python binary
- pip/easy_install/wheel binary
- activation script
- binary files utilizzate da Python

Per attivare un virtualenv si può fare:

```bash
#Su Linux o Mac
source ./my-virtualenv/bin/activate

#Su windows
my-virtualenv\Scripts\activate.bat

#Disattivare virtualenv
deactivate
```

I virtualenv sono molto comodi e si possono usare in combinazione con i file **requirements.txt**

Certamente è un metodo semplice, comodo, ma tuttavia ci sono degli strumenti più potenti ed efficaci per gestire il proprio ambiente e che consentono di superare alcuni dei problemi noti dei virtualenv.

## Alcuni problemi di Virtualenv

- Gestione delle dipendenze: Virtualenv non ha un sistema integrato per gestire le dipendenze del progetto. Di solito si utilizza pip insieme a un file requirements.txt, ma questo approccio non risolve i conflitti di versione tra le dipendenze.

- Non gestisce le dipendenze di sviluppo e produzione separatamente: Non c'è un modo nativo per distinguere tra dipendenze di sviluppo e dipendenze di produzione.

- Non gestisce le dipendenze a livello di progetto: Ogni volta che si crea un nuovo virtualenv, è necessario reinstallare tutte le dipendenze, anche se sono già state installate in un altro virtualenv.

Per superare questi problemi, oltre a virtualenv e pyenv-virtualenv che sono gli strumenti di default ci sono altri tools molto utili e interessanti che estendono, migliorano e potenziano l'uso dei virtual environment per la gestione delle librerie.

- conda (che introduce anche il conda package manager) che è molto invasivo
- virtualfish
- virtualenvwrapper
- pipenv: molto citato in tantissimi tutorial, ma è veramente poco mantenuto (l’ultima versione risale al 2018 con 300+ issue aperte) e può causare diversi problemi in un progetto, oltre ad esserci diverse [controversie legate al progetto](https://github.com/pypa/pipenv/issues/4058)
- pipx: per centralizzare alcune dipendenze
- poetry: strumento molto moderno e maturo che consente di gestire molto bene le dipendenze in un progetto, production ready e che risolve tantissimi problemi rispetto agli altri strumenti sopra elencati
- pdm: nuovo strumento moderno, ma ancora in beta
