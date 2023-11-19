---
title: Code style
disquis: PythonBiellaGroup
timetoread: true
---

## Intro

Quando si lavora su progetti e si condivide il codice con un team di lavoro è importante cercare di mantenere uno stesso stile di scrittura del codice in modo da uniformarsi ed evitare di fraintendersi.

È anche importante cercare di **aderire a degli standard di programmazione** in modo tale da facilitare la condivisione del codice all'interno dello stesso gruppo di lavoro e dello stesso ambiente, facendo in modo di controllare anche altri aspetti correlati come la qualità del codice, la sicurezza, i test, ...

In Python in particolare esistono delle linee guida chiamati PEP che sono accettati ed implementati:

- PEP8 = [Default python style guide](https://peps.python.org/pep-0008/)
- PEP257 = [Docstring style guide](https://peps.python.org/pep-0257/)
- Typings PEPs = [Tutto ciò che riguarda i typings](https://peps.python.org/topic/typing/)
- PEP 483 = [Theory dei Type hints](https://peps.python.org/pep-0483/)
- PEP 482 = [Overview della letterature per i Type Hints](https://peps.python.org/pep-0482/)
- PEP 483 = [Letteratura dei Type Hints](https://peps.python.org/pep-0483/)

Esistono tuttavia degli altri PEP accettati, ma non ancora implementati che definiscono altre linee guida che non tratteremo qui in questa guida. Ci sono anche degli altri PEP aperti in cui è ancora in corso una discussione, anche questi non verranno trattati qui.

Come puoi vedere in queste linee guida vengono anche regolati tantissimi aspetti non solamente legati allo styling, ma anche come vengono espressi i tipi di variabili, come si scrive i codici, standard e policy.

Siccome questi concetti sono molto importanti all'interno dell'ecosistema di Python e Python è un linguaggio così importante nel mondo moderno, nel corso del tempo sono nate delle vere e proprie organizzazioni Open Source che si occupano di sviluppare, mantenere e aggiornare strumenti utili per controllare tutte queste regole, meccanismi e aspetti...come ad esempio la [Python Code Quality Authority](https://github.com/PyCQA)

### Alcuni esempi di PEP8

- Quando spazi si usano per l’indentazione = 4 spazi
- Come indentare le parentesi
- Lunghezza della linea di codice predefinita (79 caratteri per il codice e 72 caratteri per i commenti e docstring)
- Come configurare gli import
- Naming convention

Le linee guida di PEP8 sono volutamente spesso vaghe, libere ad interpretazione e non chiare, lasciando spesso anche troppa libertà. Se questo da un lato è un vantaggio essendo Python un linguaggio molto libero, utilizzato da tantissime persone molto variegate in tanti ambienti di versi.

Una volta comprese le linee guida dobbiamo trovare il modo di metterle in pratiche in modo da rendere facile la gestione del codice all'interno del nostro progetto.

## Naming convention

Forse il punto più dolente e meno rispettato quando si deve scrivere del codice in Python, è proprio la convenzione dei nomi.

In generale ci sono delle regole principali che possono cambiare a seconda degli stili:

- Usare la formulazione `snake_case` per moduli, variabili, attributi, funzioni, nomi dei metodi
- Usare `CamelCase` per nomi delle classi e Fabrics
- I nomi devono essere chiari rispetto a quello che una variable, una classe, una funzione contiene o fa, non preoccupatevi di avere nomi lunghi, anzi...spesso è meglio avere un nome più lungo piuttosto che uno troppo breve e poco espressivo
- Non includere mai il tipo di una variabile nel suo nome, ad esempio scrivere: `senders` invece di `sender_list` o `senderlist`

Ti lasciamo un [bell'articolo di blog](https://luminousmen.com/post/the-ultimate-python-style-guidelines) che spiega anche questi concetti con alcuni esempi.

### Nomi dei moduli

I nomi dei moduli possono essere tutti in minuscolo oppure avere delle iniziali maiuscolo

Ad esempio:

- con le iniziali maiuscole: `MyModule`
- tutto minuscolo: `mymodule`

Generalmente i moduli che contengono solamente funzioni hanno nomi completamente in minuscolo. Comunque, quando si ha a che fare con dei veri e propri pacchetti, allora il nome dovrebbe essere tutto minuscolo.

### Nomi delle classi

I nomi delle Classi hanno le iniziali maiuscole, tipo `MyClass`.

### Nomi delle funzioni

I nomi delle funzioni possono essere espressi in due modi principalmente:

- con le iniziali maiuscole: `MyFunction`
- tutto minuscolo: `myfunction`
- con sottolineature per indicare gli spazi: `my_function`

Anche per i metodi delle classi seguono queste logiche di naming convention. Solo per i **metodi interni** o per le **variabili di istanza** sarebbe preferibile aggiungere un carattere di sottolineatura all'inizio del nome, come ad esempio: `_my_internal_method`.

Questo per evitare conflitti di nome che si potrebbero generare all'interno del progetto.

È tuttavia d'obbligo utilizzare due sottolineature per gli attributi e le funzioni a cui solo la classe corrente possa accedere, ovvero tutto ciò che è "privato", come ad esempio: `__my_private_method`. Questo ci ricorda che questi attributi, metodi e funzioni all'interno delle classi sono private e dovrebbero essere accessibili solamente all'interno della classe stessa e non all'esterno.

## Styling guides

Ovviamente nel mondo esistono delle linee guida più concrete utilizzate da diversi programmatori, come ad esempio la Google Style Guide per Python che viene utilizzata anche da molti tools all'interno dei vari IDE di programmazione (esempio: alcune estensioni su VSCode).

Ci sono anche delle ottime alternative community based, come nel case del libro Hitchhiker's guide to Python di cui consigliamo la lettura.

- [Google python style guide](https://google.github.io/styleguide/pyguide.html)
- [The hitchhiker's guide to python](https://docs.python-guide.org/writing/style/)

## Come fare?

Ecco che entrano in gioco alcune librerie che aiutano nella gestione del codice da diversi punti di vista:

- Stile del codice
- Qualità del codice
- Problemi di sicurezza
- Check dei typings

Alcune librerie descritte in questi capitoli che possono aiutarti a configurare il tuo progetto sono:

- **Black**: Uno dei più famosi auto code formatter in Python che in automatico cerca di forzare l'uso di PEP8 all'interno del progetto, noi lo usiamo molto, è molto aggressivo, ma fa bene il suo lavoro e aiuta molto nelle repository con tante persone.
- **Bandit**: Uno strumento disegnato per trovare problemi di sicurezza comuni all'interno del codice Python. È mantenuto dalla [Python Code Quality Authority](https://github.com/PyCQA) ed è rilasciato come strumento open source.
- **Flake8**: libreria molto famosa che consente di forzare alcune regole di stile, può essere esteso utilizzando dei plugin ed è anche questo uno strumento mantenuto dalla [Python Code Quality Authority](https://github.com/PyCQA).
- **Isort**: Una utility Python che consente di organizzare in modo alfabetico gli imports all'interno di un file.
- **Mypy**: Uno strumento che consente di controllare lo static type checker, è stato molto usato nel passato, ma il suo sviluppo e supporto ha avuto problemi nel corso del tempo. Ultimamente è stato rimpiazzato da strumenti più efficienti e migliori, come ad esempio: Ruff.
- **Pylint**: Un linter e un code static analysis tool per Python. Uno strumento molto potente incluso anche come estensione all'interno di diversi IDE come VSCode o Pycharm.
- **Ruff**: Un nuovo linter e code formatter scritto in Rust. Ruff è diventato nel corso degli ultimi anni uno standard abbastanza affermato con una rapidissima adozione da parte delle aziende e dai gruppi di lavoro. È molto potente, facilmente estendibile, molto efficace e personalizzabile.

Ti ricordiamo che all'interno della nostra [repository Bear](https://github.com/PythonBiellaGroup/Bear) puoi trovare questi tool e librerie già configurate con una configurazione standard.

Questi strumenti possono essere utilizzati anche all'interno delle pipeline di CI/CD per controllare che tutto sia conforme rispetto alle regole di progetto prima che il codice venga rilasciato nella repository o pushato in una branch.

Per questo tipo di configurazione rimandiamo al capitolo dedicato a `pre-commit` che puoi trovare nella nostra sezione Learning.

## Typings

È necessario fare un piccolo approfondimento su cosa sono i **typings** su Python prima di introdurre strumenti come **pylint**, **mypy**, **ruff**.

Python è un linguaggio dinamico, che vuol dire che non ci sono dei requisiti formali per rappresentare il tipo delle variabili, dei dati, delle informazioni o degli oggetti (ad esempio se una variabile è un intero). Questa flessibilità consente di essere molto veloci e rapidi nella scrittura del codice, dando al programmatore molta libertà, soprattutto in alcuni contesti come l'analisi dei dati, il machine learning, lo scripting generico. Ci sono anche dei contro però, come ad esempio la risoluzione dei tipi: per capire il tipo di una variabile Python deve eseguire degli algoritmi che pur troppo sono molto lenti e questa è una delle critiche che maggiormente vengono fatte al linguaggio, ovvero che spesso, per alcuni tipi di compiti, risulta lento.

Al contrario i linguaggio staticamente tipizzati o fortemente tipizzati non possono cambiare il loro tipo durante l'esecuzione, ma sono molto più veloci, ma allo stesso tempo offrono meno libertà.

Tuttavia negli ultimi anni Python supporta i **Type Hints** ovvero delle annotazioni che possono essere date alle variabili, consentendo di controllare che il codice rispetti questi criteri, soprattutto per motivi di test e di verifica del codice.
Questa definizione di **type hints** viene regolata dal [PEP 484](https://peps.python.org/pep-0484/)

Se volessimo fare un esempio di una funzione e di alcune variabili, questo è come appare il typings su Python.

```python
constant: int = 42
def adding_two_numbers(num1: int, num2: int) -> int:
    return num1 + num2 + constant
```

Come potete vedere vengono suggeriti i tipi nelle variabili del metodo, in modo che quando lo richiami puoi sapere a quali tipi ti stai riferendo, viene suggerito anche il tipo in uscita in modo da sapere quale tipo di dato ti aspetti in output dalla funzione.

Python attraverso il modulo **typing** offre anche la possibilità di specificare degli altri tipi che non siano quelli base, come ad esempio: liste, tuple, dizionari, ...

```python
from typing import List, Tuple, Dict, Any

# List of integers
numbers: List[float] = [1.1, 2.2, 3.3, 4.4]

# Dictionary with string keys and integer values
ages: Dict[str, int] = {'Pippo': 21, 'Pluto': 28, 'Paperino': 24}

# Tuple of string and string (tuple have the same type internally)
numbers: Tuple[int, int, int] = (2, 4, 8)

# Any type, basically not specifying the type
data: Any = 123

```

Sempre utilizzando lo stesso modulo si possono anche creare i propri tipi.

```python
from typing import List

class Superhero:
    def __init__(self, name: str, age: int, city: str, power: float):
        self.name = name
        self.age = age
        self.city = city
        self.power = power

# Avengers: a list of Superhero objects
Avengers: List[Superhero] = [
    Superhero('Cpt. America', 33, 'Brooklyn', 7.8),
    Superhero('Thor', 77, 'Asgard', 8.9),
    Superhero('Hulk', 40, 'America', 10),
]
```

Per facilitare il controllo e l'uso dei **type hints** per controllare che tutto rispetti la definizione sono nati nel corso del tempo diverse librerie, tool e pacchetti che consentono anche di estendere queste definizioni, in particolare:

- Mypy
- Ruff
- Pylint
- Pydantic

### Pro e contro dei typings

Ovviamente non è sempre tutto oro quel che luccica :) Pur troppo l'utilizzo dei Type Hints non aiuta Python ad essere più veloce, tuttavia possiamo comunque evidenziare dei pro e contro.

#### Pro

- Aiuta il linting e consente di ridurre la possibilità di avere dei bug nel codice
- Aiuta tantissimo la leggibilità e la documentazione del codice, ci sono strumenti che consentono di generare automaticamente documentazione a partire dai type hints.
- Consente di avere una fase di testing molto più approfondita e fatta bene.
- Diventa più facile scrivere codice perchè i moderni IDE sono in grado di suggerire anche il tipo di dato che è necessario in una classe o in una funzione quando viene richiamata.
- Risolve il problema dei `None-awareness`, ovvero non solo non possiamo passare dei tipi sbagliati alle funzioni o agli oggetti, ma non possiamo passare valori che possono essere `None` causando numerosi problemi.

#### Contro

- Bisogna spendere più tempo nella scrittura del codice e nell'implementazione degli hints
- A volte non è facile identificare i tipi giusti, specialmente con oggetti complessi all'interno di grandi repository
- Cambiando versioni di Python o delle librerie a supporto possono esserci degli errori di retro compatibilità
- Utilizzando librerie aggiuntive, come ad esempio **pylint**, ci si lega molto alla libreria e non si usa nativamente il linguaggio, portando anche qui a problemi di incompatibilità tra le diverse versioni.

### Documentazione

Per altri riferimenti e guide riguardo ai Type Hints lasciamo qui alcuni blog e guide che a noi hanno aiutato molto

- [Python type checking guide](https://realpython.com/python-type-checking/)
- [Official python page for type hints](https://docs.python.org/3/library/typing.html)
- [Static typing with Python](https://typing.readthedocs.io/en/latest/)
- [Does python need types?](https://tushar.lol/post/does-python-need-types/)

## Altro materiale

Oltre alle librerie di Python e ai diversi Styling guides, vi consigliamo anche queste letture che possono essere interessanti se dovete cercare di portare un po' di standardizzazione all'interno dei vostri progetti nella vostra azienda.

Bellissimo articolo di Real Python su [come scrivere bel codice Python seguendo PEP8](https://realpython.com/python-pep8/)

Best practice per [Python Code Quality](https://realpython.com/python-code-quality/) sempre scritto dalla community di RealPython.

Elenco dei [PEP di Python](https://peps.python.org/pep-0000/)
