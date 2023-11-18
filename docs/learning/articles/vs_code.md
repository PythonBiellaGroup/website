---
title: VSCode
disquis: PythonBiellaGroup
timetoread: true
---
## Intro

Un code editor è lo strumento essenziale per ogni programmatore e lo strumento con cui spendiamo la maggior parte del tempo.

La scelta di un editor con il quale scrivere codice è spesso un tema molto sensibile che suscita spesso molte diatribe tra i programmatori.

Come sapete ci sono moltissimi editor e siete liberi di utilizzare quello che più vi piace, ma dopo diversi anni passati ad utilizzare Sublime Text e Pycharm vi suggerisco vivamente di utilizzare Visual Studio Code. (Non voglio aprire la parantesi EMACS o Vim altrimenti è la fine..)

---

## Perchè VS Code?

Visual Studio Code è negli ultimi anni l’editor per la scrittura di codice più utilizzato e sicuramente più famoso [Survey del 2022 di Stack Overflow](https://survey.stackoverflow.co/2022#section-most-popular-technologies-integrated-development-environment)

Vediamo quindi assieme alcuni vantaggi nell’usare vscode

* È OpenSource
* Si può usare su qualsiasi sistema operativo (anche via web come server)
* Potete usare tutti i linguaggi che volete
* È semplice, ma altamente performante
* È veloce
* È estremamente customizzabile grazie a tantissime estensioni
* Viene impiegato in tantissimi contesti lavorativi
* È largamente utilizzato e molto ben documentato
* Possibile fare sviluppo remoto
* È possibile fare live coding e pairwase coding anche a distanza
* Le vostre estensioni e impostazioni possono essere sincronizzate tra diversi dispositivi

Questi sono alcune delle mie considerazioni, ovviamente non ho benchmark rispetto altri editor sotto mano, vi invito comunque ad utilizzarlo e provarlo.

Rispetto a Pycharm c’è però una feature che mi manca moltissimo durante lo sviluppo, ovvero la possibilità di fare refactoring del codice in molto smart come succede appunto su Pycharm. Pur troppo la fase di refactoring su vscode è ancora spesso legata molto ad attività manuali e non ci sono tutti gli automatismi necessari.

La cosa che mi piace di più di VSCode è il giusto bilanciamento tra produttività e facilità, anche per chi inizia a scrivere codice.

---

## Estensioni suggerite
Ecco un elenco di estensioni che suggeriamo con il loro ID di Visual Studio Store

* bookmarks: (alefragnani.bookmarks)
* code spell checkers (streetsidesoftware.code-spell-checker)
* docker (ms-azuretools.vscode-docker)
* docs-markdown (docsmsft.docs-markdown)
* docs-preview (docsmsft.docs-preview)
* docs-yaml (docsmsft.docs-yaml)
* git graph (mhutchie.git-graph)
* git history (donjayamanne.githistory)
* git lens (eamodio.gitlens)
* indent-rainbow (oderwat.indent-rainbow)
* italian-code spell checker (streetsidesoftware.code-spell-checker-italian)
* jupyter (ms-toolsai.jupyter)
* jupyter keymap (ms-toolsai.jupyter-keymap)
* live-share (ms-vsliveshare.vsliveshare)
* markdown all in one (yzhang.markdown-all-in-one)
* material icon theme (pkief.material-icon-theme)
* postgreSQL (ms-ossdata.vscode-postgresql)
* pylance (ms-python.vscode-pylance)
* python (ms-python.python)
* python docstring generator (njpwerner.autodocstring)
* python indent (kevinrose.vsc-python-indent)
* rainbow brackets (2gua.rainbow-brackets)
* rainbow csv (mechatroner.rainbow-csv)
* remote development (bundle) (ms-vscode-remote.vscode-remote-extensionpack)
* render line endings (medo64.render-crlf)
* sqltools (mtxr.sqltools)
* swagger viewer (arjun.swagger-viewer)
* todo highlight (wayou.vscode-todo-highlight)
* todo tree (gruntfuggly.todo-tree)
* visual studio intellicode (visualstudioexptteam.vscodeintellicode)
* webhint (webhint.vscode-webhint)
* yaml (redhat.vscode-yaml)

Su VSCode segnaliamo anche altre configurazioni utili (che verranno discusse nelle sezioni precedenti) come:

* autosalvataggio automatico dei file
* uso flake8 come linter
* black come strumento per formattare automaticamente il codice al salvataggio
* bandit per controlli sulla sicurezza.
* devcontainers
* configurazioni del debugger
* configurazione dei virtual environments
* configurazioni per lo sviluppo remoto

---

## Installare un linter

Come abbiamo visto i linter sono i vostri migliori amici per controllare, durante la scrittura del codice, che tutto sia ok.

Per selezionare un linter andate nei comandi (premendo il tasto **F1** oppure **CTRL + SHIFT + P** o facendo ```View > Command Palette```) e scrivete: ```> python: Select Linter```. Selezionate quindi il linter che più vi piace (vi consiglio flake 8 ).

---

## Utilizzare una versione di Python

Quando siete all’interno di un progetto e aprite un file .py vi verrà chiesto di utilizzare una particolare versione di python che potete anche visualizzarla in basso a destra su vscode (ovviamente dovete installare almeno l’estensione Python prima). Premendo sulla scritta potrete selezionare una determinata versione di Python.

Aprendo sempre la Command Palette (premendo il tasto **F1** oppure **CTRL + SHIFT + P** o facendo ```View > Command Palette```) potete scrivere : ```> python: Select Interpreter``` per selezionare l’interprete python che più vi aggrada (ad esempio il vostro .venv all’interno della cartella).

All’interno del progetto potete anche creare un file: settings.json all’interno della cartella .vscode in modo da specificare il path del vostro interprete

```
{
  "python.pythonPath": "/Users/jeydi/Progetti/mioprogetto/.venv/bin/python"
}
```

---

## Aggiungere VS Code al terminale

Una feature molto interessante di visual studio code è l’aggiunta del comando ```code <file_or_folder>``` all’interno del terminale che vi aprirà una finestra di vscode in base al file o alla cartella su cui volete lavorare (ad esempio facendo ```code .``` potrete aprire la cartella corrente all’interno di vscode).

Per farlo aprite la Command Palette e lanciate (cercando) il seguente comando:

```shell
Shell command: Install ‘code’ command in the PATH
```

Su windows è possibile installare la funzionalità anche flaggando ```Add to PATH``` durante la fase di installazione di vscode.

---

## Usare il debugger

Per usare il debugger su vscode e quindi lanciare diversi file è possibile creare per ogni progetto una particolare configurazione di impostazioni che verranno utilizzate dal debugger.

Inoltre VSCode quando andate sulla sezione di debug mette a disposizione uno strumento che consente di generare una particolare configurazione in base al framework o funzionalità che state cercando di usare tramite un template

Con questa procedura verrà costruito un file: **launch.json** all’interno della directory di progetto: **.vscode** che potrebbe essere nascosta.

Un esempio di configurazione (con flask e con un file singolo)

```json
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python: Current File",
      "type": "python",
      "request": "launch",
      "program": "${file}",
      "console": "integratedTerminal"
    },
    {
      "name": "Flask Backend",
      "type": "python",
      "request": "launch",
      "port": 8000,
      "host": "localhost",
      "program": "${workspaceFolder}/server.py",
      "console": "integratedTerminal",
      "env": {
        "API_ENDPOINT_PORT": "8000",
        "VERBOSITY": "debug",
        "PLANT": "demo"
      }
    }
  ]
}
```

---

## Testing

Una feature nascosta all’interno di VSCode una volta installata l’estensione di Python è la possibilità di eseguire test tramite interfaccia con Python.

Per usufruire di questa funzionalità: Aprire la Command Palette e fare: ```Python: Configure Tests``` e dall’elenco dei framework di test che vi compariranno selezionare il vostro framework preferito (ad esempio pytest).