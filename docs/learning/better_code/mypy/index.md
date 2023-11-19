# Mypy

Mypy è un **static type checker** su Python. Agisce come un Linter e consente di scrivere codice tipizzato e verificarne l'uso all'interno del progetto.

Il codice con Mypy verifica quelli che vengono chiamati **type hints** su Python. Essendo Python un linguaggio non tipizzato la violazione del controllo di Mypy non provoca degli errori di interpretazione o di compilazione, ma causa semplicemente dei warning che possono essere ignorati o analizzati più nel dettagli dal programmatore all'interno dell'IDE.

Mypy esegue tutti i controlli di tipo senza mai eseguire il codice. Si tratta di quello che viene definito uno **strumento di analisi statica** (questo statico è diverso dallo statico di "tipizzazione statica"), significa che lo strumento funziona non eseguendo il codice python, ma valutando la struttura del programma.

Questo vuol dire che se il vostro programma fa cose particolari come fare chiamate API o cancellare file sul vostro sistema, potete comunque eseguire mypy sui vostri file e non avrà alcun effetto sul mondo reale.

## Usare mypy

È possibile usare **mypy** da terminale, ad esempio:

```python
def double(n):
    return n * 2

num = double(21)
print(num)
```

Se lanciamo da terminale **mypy** ci aspettiamo un errore vero?

```bash
$ mypy test.py
Success: no issues found in 1 source file
```

Ma come puoi vedere non succede niente, questo perchè come abbiamo detto nel capitolo generale non si forza mai il typings su python, quindi anche mypy non ci forza ad aggiungere i tipi al nostro codice, ma si limita a controllare quando ci sono.

È tuttavia possibile customizzare mypy in modo che controlli anche questi errori, facendo:

```bash
$ mypy --disallow-untyped-defs test.py
test.py:1: error: Function is missing a return type annotation
Found 1 error in 1 file (checked 1 source file)
```

Ci sono moltissimi `--disallow-` che si possono usare, ma esiste tuttavia un extra che li racchiude tutti: `--strict`. Usando questo argomento di effettua un controllo "stringente" dei tipi.

```bash
# per iniziare provare ad usare:
mypy --strict myfile.py
```

## Configurare mypy

Ci sono diversi modi per configurare Mypy, qui ne vedremo 2 principalmente:

- Con VSCode
- Configurazione di default con i file di configurazione

### Configurazione con VSCode

È possibile all'interno del proprio file nella repository `.vscode/settings.json` inserire i parametri di configurazione di Mypy, installando anche l'estensione dedicata sullo store.

Ad esempio:

```json
...
  "python.linting.mypyEnabled": true,
  "python.linting.mypyArgs": [
    "--ignore-missing-imports",
    "--follow-imports=silent",
    "--show-column-numbers",
    "--strict"
  ],
...
```

### Configurazione con mypy.ini

Questa è la modalità di default, è possibile creare un file: `mypy.ini` all'interno della propria repository, nel quale è possibile inserire alcune regole che vogliamo controllare e modalità di utilizzo di Mypy.

Per la definizione di tutte le regole e modalità di utilizzo ovviamente facciamo riferimento alla guida ufficiale.

```ini
[mypy]
plugins = pydantic.mypy, sqlmypy
ignore_missing_imports = True
disallow_untyped_defs = True
follow_imports = True
show_column_numbers = True
strict = False
exclude = ['volumes/', "alembic/", "scripts/", "docs/", "settings/", ".vscode/", ".venv/", ".pytest_cache/", ".mypy_cache/", ".gitlab/", ".github/", ".devcontainer/", "Docker/", "dashboards/"]
```

Come puoi vedere è anche possibile su Mypy utilizzare dei plugin. Anche riguardo a questo facciamo riferimento alla guida ufficiale.

## Esempi di Types

Facciamo quindi una serie di esempi di Types che si possono controllare e verificare con Mypy

### Primitive

Quando parliamo di primitive, parliamo dei tipi di default che si trovano nel linguaggio, come ad esempio: `int`, `str`, `float`, `bool`, ...

Ad esempio:

```python
def double(n: int) -> int:
    return n * 2


num = double(21)
print(num)
```

Lanciando quindi mypy otteniamo

```bash
$ mypy --strict test.py
Success: no issues found in 1 source file
```

### Collections

Le collections sono anche chiamate **strutture dati** come ad esempio: `List`, `Dict`, `Set`, ...

Nonostante queste collections ricordano le strutture dati come liste, dizionari, set, etc... non sono esattamente gli stessi **builtin collection types** ovvero quelli utilizzati di default dal linguaggio, ma sono delle astrazioni costruite apposta per effettuare dei controlli da mypy.

Un esempio:

```python
from typing import List, Set

def unique_count(nums: List[int]) -> int:
    """counts the number of unique items in the list"""
    uniques: Set[int] = set()  # Manually added type information
    for num in nums:
        uniques.add(num)

    return len(uniques)

print(unique_count([1, 2, 1, 3, 1, 2, 4, 3, 1]))  # 4
```

Un altro esempio utilizzando i dizionari

```python
from typing import Dict

def get_total_marks(scorecard: Dict[str, int]) -> int:
    marks = list(scorecard.values())  # marks : List[int]
    return sum(marks)

scores = {'english': 84, 'maths': 92, 'history': 75}
print(get_total_marks(scores))  # 251
```

A partire da Python 3.7 tuttavia è possibile anche importare le annotazioni, ovvero avere la possibilità all'inizio del file di usare i tipi builtin come generic. Da Python 3.9 in poi è necessario solamente importare future per importarli tutti.
Un esempio con Python 3.9

```python
from typing import List
import __future__

# With mypy
my_var: List[int]

## With future (normal python built-in)
my_var_normal: list[int]
```

Ci sono degli edge-cases dove questo non funziona, ma sono rari. Tutto questo è descritto all'interno del [PEP 585](https://peps.python.org/pep-0585/)

### Debug

Oltre a tipizzare il codice, si può anche usare **mypy** come strumento di **debugger**, ovvero quando leggi codice di altri o di cui non conosci il tipo, è possibile utilizzare la funzione: `reveal_type` che consente di rivelare il tipo di variabile che si utilizza all'interno del codice, un esempio:

```python
from typing import List, Set

def unique_count(nums: List[int]) -> int:
    """counts the number of unique items in the list"""
    uniques: Set[int] = set()
    for num in nums:
        uniques.add(num)

    return len(uniques)

counts = unique_count([1, 2, 1, 3, 1, 2, 4, 3, 1])

reveal_type(counts)  # The special magic reveal_type method
```

```bash
$ mypy --strict test.py
test.py:12: note: Revealed type is 'builtins.int'
```

`reveal_type` è una funzione speciale di mypy che non è usata nel codice. Tuttavia è importante ricordarsi di **rimuovere questa funzione una volta finito il debugging e il check del codice**.

### Union e Optional

Fino ad ora abbiamo visto come forzare l'utilizzo di un tipo, ma possono capitare dei casi dove è necessario specificare più di un tipo di variabile per un determinato parametro o metodo.

Per fare questo è possibile utilizzare:

- Union: quando vogliamo dire che si possono usare più parametri
- Optional: quando questi tipe hints sono opzionali e non strettamente necessari

Facciamo degli esempi

```python
from typing import List, Union

def print_item(item: Union[str, List[str]]) -> None:
    reveal_type(item)

    if isinstance(item, list):
        for data in item:
            reveal_type(item)
            print(data)
    else:
        reveal_type(item)
        print(item)

print_item('Hi!')
print_item(['This is a test', 'of polymorphism'])
```

```bash
$ mypy test.py
test.py:4: note: Revealed type is 'Union[builtins.str, builtins.list[builtins.str]]'
test.py:8: note: Revealed type is 'builtins.list[builtins.str]'
test.py:11: note: Revealed type is 'builtins.str'
```

### Any

Quando non sappiamo nello specifico un tipo di dato, come nel caso di una lettura di un file che può contenere diversi tipi, è possibile utilizzare in Mypy: `Any`.

`Any` in realtà quello che fa è disabilitare il type checking, consentendoci di gestire la variabile o l'oggetto come vogliamo.

```python
import json
from typing import Any

import requests

def post_data_to_api(data: Any) -> None:
    requests.post('https://example.com/post', json=data)

data = '{"num": 42, "info": null}'
parsed_data = json.loads(data)
reveal_type(parsed_data)  # Revealed type is 'Any'

post_data_to_api(data)
```

Ovviamente ci sono dei concetti molto più avanzati e approfonditi, come i generics, l'uso dei typings nelle classi e moltissimo altro all'interno di Mypy.

Vi rimandiamo alla sezione di approfondimenti qui sotto per seguire i link che ti abbiamo messo per approfondire questo tema.

## Approfondimenti

Alcuni articoli per approfondire questi concetti

- [The comprehensive guide to mypy](https://tushar.lol/post/mypy-guide/)
- [Type checking with Mypy](https://realpython.com/lessons/type-checking-mypy/)
- [Python type checking guide](https://realpython.com/python-type-checking/)
