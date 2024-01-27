# Ruff

Ruff è uno dei Python Linter più veloci disponibili, grazie all'implementazione in Rust e può essere usato per rimpiazzare numerose librerie in Python in quanto contiene al suo interno numerosissime features.

Alcuni tool che consente di rimpiazzare:

- Flake8 (con le estensioni)
- Isort
- pyupgrade
- autoflake
- pep8-naming
- pydocstyle

## Features

Ruff è ancora in sviluppo e in cambiamento, quindi sicuramente si evolverà ancora nel corso del tempo, qui scriviamo alcune features interessanti e che possono essere utili.

### Velocità

Essendo Ruff anche uno strumento di analisi statica del codice è necessario che sia molto veloce ed efficiente per garantire una copertura e un controllo veloce nel nostro codice all'interno dell'IDE senza appesantire i processi, dover attendere o dover per forza lanciare il codice.

Se sei interessato ai benchmark ci sono alcuni benchmark [all'interno del sito ufficiale](https://docs.astral.sh/ruff/contributing/?ref=blog.jerrycodes.com#benchmarking-and-profiling)

### Supporto

Attualmente Ruff racchiude le features di almeno altri 50 Python Package, creando una collezione di almeno 700 regole di lint. Tutte queste regole sono rimplementate in Ruff.

All'interno della [documentazione ufficiale](https://docs.astral.sh/ruff/rules/?ref=blog.jerrycodes.com#rules) è possibile trovare l'elenco esaustivo delle regole che vengono implementate anche in altre librerie. Sarebbe inutile e troppo lungo descriverle tutte qui con esempi.

### Configurazione

È molto facile configurare Ruff, per farlo è possibile creare un file di configurazione dedicato all'interno della repository chiamato `ruff.toml` contenente tutte le regole e configurazioni. Tuttavia se utilizzi `pdm` o `poetry` è anche possibile inserire le regole all'interno dei file di configurazione `pyproject.toml` in modo da tenere in un unico file tutte le regole necessarie per la configurazione del progetto.

Per capire come configurare al meglio Ruff, la documentazione ufficiale offre degli ottimi spunti a riguardo:

- [Configurare ruff](https://docs.astral.sh/ruff/configuration/)
- [Tutte le impostazioni disponibili](https://docs.astral.sh/ruff/settings/)
- [Elenco delle regole disponibili](https://docs.astral.sh/ruff/rules/)

### Integrazione con l'IDE

Vista la crescente popolarità di Ruff, lo strumento è stato integrato all'interno degli IDE più famosi come Pycharm e VSCode.

Su VSCode è possibile installare l'estensione dedicata che consente di utilizzare tutte le potenzialità dello strumento.

### Fix automatico del codice

Oltre a segnalare i problemi Ruff ha integrato uno strumento di **autofix** del codice.

È uno strumento molto potente che consente di applicare le regole di ruff e automaticamente cambiare il codice per adattarsi a queste regole.

Per farlo è necessario installare ruff e chiamare da terminale le sue funzionalità:

```bash
ruff check --fix .

# Lint all files in `/path/to/code` (and any subdirectories)
$ ruff check path/to/code/

# Lint all `.py` files in `/path/to/code`
$ ruff check path/to/code/*.py

# Lint `file.py`
$ ruff check path/to/code/to/file.py
```

### Ignorare gli errori nel codice

Come altri strumenti Ruff consente di ignorare direttamente degli errori nel codice, in un file o in una linea.

Questo metodo è ovviamente non consigliato, è sempre meglio cercare di risolvere tutte le problematiche.

Per farlo è necessario utilizzare il commento `# noqa`, si può usare specificando il tipo di errore (scelta consigliata) con il codice di riferimento, oppure senza specificare il codice in modo generico.

Qui alcuni esempi:

#### Ignorare errori in linea nel codice

```python
from typing import List

def sum_even_numbers(numbers: List[int]) -> int:  # noqa: UP006
    """Given a list of integers, return the sum of all even numbers in the list."""
    return sum(num for num in numbers if num % 2 == 0)
```

#### Ignorare errori all'interno di tutto il file

In questo modo verranno ignorati tutti gli errori di tipo `UP006` all'interno del file, ricordiamo che è sempre possibile non specificare il tipo di errore anche se non è consigliato, anche perchè a cosa serve altrimenti averlo installato e utilizzarlo?

```python
# ruff: noqa: UP006
from typing import List

def sum_even_numbers(numbers: List[int]) -> int:
    """Given a list of integers, return the sum of all even numbers in the list."""
    return sum(num for num in numbers if num % 2 == 0)
```

#### Ignorare errori nel file di configurazione

```ini
[lint]
# Enable flake8-bugbear (`B`) rules.
select = ["E", "F", "B"]

# Never enforce `E501` (line length violations).
ignore = ["E501"]

# Avoid trying to fix flake8-bugbear (`B`) violations.
unfixable = ["B"]

# Ignore `E402` (import violations) in all `__init__.py` files, and in `path/to/file.py`.
[lint.per-file-ignores]
"__init__.py" = ["E402"]
"path/to/file.py" = ["E402"]
```

#### Ignorare particolari errori da command line

È anche possibile ignorare particolari errori quando si lancia da command line, facendo

```bash
$ ruff check path/to/code/ --ignore E402
```

## Consigli

Siccome Ruff è uno strumento molto potente e omnicomprensivo, sconsigliamo di creare una configurazione molto estesa fin da subito. È un processo che richiede tempo e tante modifiche prima di trovare una serie di regole che possono adeguarsi al progetto o alle regole all'interno di un team o di una organizzazione.

Se sei interessato ad un esempio di configurazione ti rimandiamo alla nostra configurazione che utilizziamo all'interno della [repository di PythonBiellaGroup, Bear](https://github.com/PythonBiellaGroup/Bear/blob/main/.ruff.toml)
