Quando si lavora su progetti e si conivide il codice con un team di lavoro è importante cercare di mantenere uno stesso stile di scrittura del codice in modo da uniformarsi ed evitare di fraintendersi.

In Python esistono:

* PEP8 = Default python style guide
* PEP257 = Docstring style guide

Alcuni esempi di PEP8:

* Quando spazi si usano per l’indentazione = 4 spazi
* Come indentare le parentesi
* Lunghezza della linea di codice predefinita (79 caratteri per il codice e 72 caratteri per i commenti e docstrings)
* Come configurare gli import
* …

Tuttavia nonostante le linee guida di PEP8 ci sono molte cose su cui di può discutere e che non sono chiare, lasciando spesso anche troppa libertà.

Ecco che entrano in gioco alcune librerie che aiutano nella gestione della qualità del codice.

---

### Black

Black è un code formatter, prende i propri files e li formatta in accordo con PEP8 e PEP257 con alcune altre regole addizionali (ad esempio converte apostrofo singolo in apostrofo doppio).

Permette di essere configurato (ad esempio mettendo ```--skip-string-**normalization``` per preservare gli apostrofi singoli).

Black è uno strumento molto discusso e a volte molto aggressivo, ma usandolo in un team consente di uniformare la scrittura del codice rendendolo comune.

Installare e usare Black
```
#installare black
pip install black

#tuttavia è consigliato utilizzare pipx
pipx install black
```

Formattare un progetto

```
black my_project #my_project = folder di progetto
```

Inoltre è possibile impostare black su vscode in modo da configurare lo styling al salvataggio

Per farlo è necessario andare nelle impostazioni (settings) e modificare l’impostazione: format on save, in particolare:

```
python: formatting provider
```

Dai un'occhiata a questa guida per approfondire:

[https://marcobelo.medium.com/setting-up-python-black-on-visual-studio-code-5318eba4cd00](https://marcobelo.medium.com/setting-up-python-black-on-visual-studio-code-5318eba4cd00)

---

### Flake8

Oltre agli strumenti che consentono di formattare il codice in Python esistono diversi linter e analizzatori statici di codice.

Uno dei più popolari Linter su Python è Flake8.

Flake8 non cambia il codice in un progetto, ma fornisce uno strumento di warnings in real time

Flake8 combina tre progetti differenti:

* [pyflakes](https://github.com/pycqa/pyflakes) = da warnings su moduli non usati, variabili non definite, …
* [pycodestyle](https://pycodestyle.pycqa.org/en/latest/) = da errori riguardo alle violazioni di PEP8
* [McCabe](https://github.com/pycqa/mccabe) (disabilitato di default) = fornisce warnings se le funzioni sono troppo complesse o complicate

Un altro vantaggio di Flake8 che lo ha reso così popolare è il massivo catalogo di plugins ed estensioni che si possono installare ed usare per estendere le funzionalità base della libreria.

Per un elenco completo delle estensioni: [https://github.com/DmytroLitvinov/awesome-flake8-extensions](https://github.com/DmytroLitvinov/awesome-flake8-extensions)

Alcune estensioni utili:

* [flake8-builtins](https://github.com/gforcada/flake8-builtins) - makes sure you don’t use Python builtins as variables or parameters
* [flake8-bugbear](https://github.com/PyCQA/flake8-bugbear) - an additional set of checks (some are opinionated) that will complain when you, for example:
    - Use except: instead of except Exception:
    - Use ++n
    - Use .strip() on a multiline string
    - Use a length-one tuple
* [flake8-comprehensions](https://github.com/adamchainz/flake8-comprehensions) - helps you write better list/set/dictionary comprehensions
* [flake8-docstrings](https://pypi.org/project/flake8-docstrings/) - enforces PEP257
* [flake8-eradicate](https://github.com/wemake-services/flake8-eradicate) - reports commented out code (“dead code”)
* [flake8-isort](https://pypi.org/project/flake8-isort/) - check if your import statements are sorted according to the isort recommendations
* [flake8-broken-line](https://github.com/wemake-services/flake8-broken-line) - complains you use backslash for line breaks (try using parenthesis or tripple quotes instead)
* [flake8-quotes](https://github.com/zheller/flake8-quotes) - if you prefer single quotes over double quotes (or the other way around), this plugin can help you enforce them
* [flake8-rst-docstrings](https://github.com/peterjc/flake8-rst-docstrings) - looks for problems in your documentation (usefull if you are using Sphinx that we will talk about later)
* [flake8-mutable](https://github.com/ebeweber/flake8-mutable) - checks that you don’t use mutable default arguments
* flake8-bandit - introduce the capabilities of bandit inside flake8

Installare Flake 8

```
pip install flake8

#anche qui è meglio utilizzare pipx
pipx install flake8

#Installare estensioni
pip install flake8-docstrings flake8-isort
#Ancora meglio sempre con pipx
pipx inject flake8 flake8-docstrings flake8-isort flake8-bandit

# Se esce un errore di path fare
pipx ensurepath
# Riavviare il terminale
```

Lanciare Flake8

```
flake8 my_project #my_project = cartella di progetto
```

Per usare al meglio Flake8 il consiglio è sempre quello di integrarlo all’interno di Visual Studio Code lanciando il comando: 

```Python: Select Linter```

Per progetti grandi e per configurare al meglio Flake8 con tutti i suoi plugin è possibile utilizzare anche l’ottima libreria: FlakeHell che è un wrapper che consente di definire un pyproject.toml file (lo stesso di Poetry) e di personalizzare le impostazioni al suo interno.

**Attenzione**: la libreria di FlakeHell non è piu aggiornata dal 2019 (è archiviata su github) tuttavia è stabile e perfettamente utilizzabile

* [FlakeHell](https://github.com/life4/flakehell)
* [Esempio](https://dev.to/bowmanjd/using-flake8-and-pyproject-toml-with-flakehell-1cn1)

Ci sono tantissimi altri strumenti che consentono di controllare il codice e di segnalare eventuali errori man mano che lo state scrivendo.

* pylint
* pydocstyle
* bandit
* vulture
* wemake-python-style guide
* prospector

Tuttavia vi consiglio di utilizzare Flake8 e Blake nei vostri progetti e di inserire anche Bandit

---

### Bandit

Bandit è uno strumento per trovare problemi di sicurezza più comuni all’interno del codice Python.

Utilizzandolo così com’è però, senza un’adeguata configurazione, fornisce anche un po' di falsi positivi.

Spendendo un po' di tempo a configurarlo correttamente per i vostri progetti è possibile avere informazioni utili riguardo:

* utilizzo insicuro di alcuni moduli
* possibili SQL Injection
* se il codice ignora silenziosamente alcune eccezioni
* e molto altro

È un utilissimo strumento soprattutto per principianti per revisionare il proprio codice.

Per usare bandit il consiglio è quello di installare l’estensione di Flake8 ```flake8-bandit``` in modo da non dover installare e usare bandit separatamente, ma integrandolo direttamente nel vostro progetto.