
# Struttura di progetto

Come strutturare un progetto in Python?

Questa ovviamente è una domanda molto comune, ma allo stesso tempo molto difficile, non esiste una risposta corretta.

Python non forza l’utilizzo di una determinata struttura, tuttavia ci sono alcune best practice che è possibile tenere a mente e alcune considerazioni che si possono (e spesso devono) fare.

Un **Modulo** in Python è un contenitore che racchiude tutte le vostre funzioni o classe che vi serve importare da un’altra parte in modo da riciclare quello che avete scritto.

Quando si lavora con i moduli e con altre librerie o codice la cosa più importante è prestare attenzione a due errori all’interno di un progetto:

* **ModuleNotFoundError**: ovvero quando il file (modulo) che si cerca i importare non esiste o non è raggiungibile
* **ImportError**: quando ci sono errori di circular imports

Una cosa importante con Python è che quando si importa un modulo Python cercherà le dipendenze (i moduli che si vuole importare) in 3 posti:

1. Installazione e dipendenze: ovvero tutte le default folders legate ai pacchetti pip installati
2. Alcuni path addizionali specificati nella variabile d’ambiente: **PYTHONPATH**
3. Nella directory contenente gli script che si usano per invocare l’interprete. In altre parole se si lancia ```python ~/modulo/scripts/server.py``` Python cercherà i moduli da importare all’interno di ```~/modulo/scripts/```
4. Se si lancia una sessione interattiva con python (lanciando il comando ```python``` o ```ipython```) verrà utilizzata la directory dove ci si trova al momento del lancio del comando.

Un modo efficace per verificare i path dove python cercherà gli eventuali moduli è fare:
```
import sys
print(sys.path)
```

Se si ottiene **ModuleNotFoundError** la prima cosa è provare a lanciare il comando sopra per verificare se contiene le directory che si vuole utilizzare e che dovrebbero essere lì.

In quel caso bisogna cercare di agire sugli import, sul **PYTHONPATH** per includere le proprie directory oppure provare a fare 

```sys.path.append("/module/scripts")``` (è un po' un trick, ma potrebbe aiutare a risolvere la soluzione).

---

## Import relativi e assoluti

Esistono due modi (principali) per importare moduli in Python

* Import Assoluti: ```from module/models/user import get_user```
* Import Relativi: ```from ..models/user import get_user```
Entrambi i modi hanno vantaggi e svantaggi, personalmente consiglio l’utilizzo di Import Assoluti perchè sono più facili da leggere e da utilizzare (rendendo il codice molto più pulito e compilant).

Anche perchè se si usano import relativi è possibile incappare in questo errore:

```Value Error: attempted relative import beyond top-level package```

Questo succede quando si cerca di importare qualcosa da una cartella al di fuori del progetto (Da una cartella padre al di fuori della root).

Ci sono diversi modi per sistemare questo problema, ma il consiglio è sempre lo stesso: cercate di utilizzare il più possibile import assoluti.

** ATTENZIONE: NON USATE MAI LA * PER IMPORTARE FUNZIONI O MODULI **

---

## Import circolari

Questo è un problema molto grave in un progetto e l’errore accade quando a partire da un modulo si cerca di importare l’altro e viceversa (crendo appunto una circolarità negli import).

```py
# file_a.py
from file_b import hello_world

def hello():
    return "hello"

def first_program():
    return hello_world()

first_program()
```

```
# file_b.py
from file_a import hello

def hello_world():

    return hello() + " world"
```

Quando si lancia ```python file_a.py``` si avrà il seguente errore:

```
Traceback (most recent call last):
  File "file_a.py", line 1, in <module>
    from file_b import hello_world
  File "/my_module/file_b.py", line 2, in <module>
    from file_a import hello
  File "/my_module/file_a.py", line 1, in <module>
    from file_b import hello_world
ImportError: cannot import name 'hello_world'
```

Ci sono anche qui molti modi per fixare questi problemi di import circolari, fate attenzione però a quando scrivete il codice in modo tale che non si verifichino questi problemi.

---

## Templating - Cookiecutter

Tornando al discorso originale di struttura di progetto in python (e in tanti altri linguaggi e/o framework) ogni progetto è differente, ma alcuni progetti condividono tra di loro alcuni elementi comuni.

Ad esempio spesso hanno un file con una lista di dipendenze e alcuni test, un’applicazione web ha bisogno di un “main”, oppure abbiamo bisogno per il nostro team di avere una struttura che guidi lo sviluppo in modo da uniformarci tra diversi progetti (o almeno cercare di farlo).

Ecco qui che entra in gioco lo scaffolding .

Scaffolding (in italiano: impalcatura) è un concetto che arriva appunto dal settore delle costruzioni, quando vogliamo costruire qualcosa, ripararlo o modificarlo, abbiamo bisogno di un’impalcatura attorno al progetto che aiuti a tenerlo.

In Informatica questo concetto è simile: prima di costruire un progetto abbiamo bisogno di una struttura pronta che ci consenta di procedere in modo ordinato durante lo sviluppo.

Ecco quindi che entra in gioco: [cookiecutter](https://github.com/cookiecutter/cookiecutter)

Cookiecutter è uno strumento che consente di creare un progetto Python a partire da un template esistente (esistono versioni simili anche in tanti altri linguaggi di programmazione ed editor).

Documentation: [https://cookiecutter.readthedocs.io/en/stable/](https://cookiecutter.readthedocs.io/en/stable/)

Per utilizzarlo:

1. Si seleziona un template da utilizzare per il progetto
2. Si lancia cookiecutter con l’indirizzo del progetto e verranno chieste dal tool alcune domande per personalizzare la creazione del progetto
3. Scaffolding con cookiecutter genererà il template per voi

Installiamo cookiecutter (meglio farlo con pipx in modo da usarlo globalmente dappertutto)

```
pipx install cookiecutter
```

Ecco un elenco curato di possibili templates per i vostri progetti (ne trovate molti online)
[https://github.com/cookiecutter/cookiecutter#a-pantry-full-of-cookiecutters](https://github.com/cookiecutter/cookiecutter#a-pantry-full-of-cookiecutters)

Cookiecutter è uno strumento molto utile, ma bisogna fare attenzione a come lo si usa e a quali progetti si utilizzano. Spesso può installare e scaricare tantissime cose di cui non abbiamo bisogno o che sono ridondanti.

Il consiglio è di selezionare dei progetti che fanno per voi in base al progetto che state pensando di utilizzare (piccolo, medio, grande). Oppure scrivere dei template per i vostri progetti o organizzazione in modo da essere tutti d’accordo su quello che volete fare.

```
#Cloniamo un progetto con cookiecutter
cookiecutter https://github.com/audreyr/cookiecutter-pypackage
```

### Bear - il nostro progetto con cookiecutter
La community di PythonBiellaGroup ha creato **Bear** (**B**ase **E**nvironment for **A**ny **R**easonable project) un template progettuale basato su cookiecutter con cui é possibile inizializzare i propri progetti tenendo conto di tutte le necessità che prevede una soluzione moderna in python.

Trovate tutto qui 👇

[https://github.com/PythonBiellaGroup/Bear](https://github.com/PythonBiellaGroup/Bear)