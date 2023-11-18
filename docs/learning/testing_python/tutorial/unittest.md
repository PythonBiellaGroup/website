---
title: Unittest
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Il test framework `unittest`

Ora che sappiamo come deve apparire un test, immergiamoci nei test
unitari con Python.  Poiché Python viene fornito "con le batterie
incluse", non abbiamo bisogno di installare nulla per iniziare a scrivere
i test.  Continuiamo con il nostro esempio precedente.

```python
def square(a):
    """Calculate the surface of a square."""
    return a * a

def test_square():
    """Test our ``square()`` function."""
    assert square(2) == 4
    assert square(0) == 0
    assert square(-1) == 1
```

## Separation of Concerns

Innanzitutto, separiamo il codice di business dal codice di test.
Vogliamo che i test vivano separatamente, in modo da poterli mantenere ed
eseguire meglio.

```python
"""FILE: example.py"""

def square(a):
    """Calculate the surface of a square."""
    return a * a
```

Nel modulo di test, dobbiamo importare il modulo `example`, ovviamente.
Aggiungiamo anche due righe che eseguiranno il test in seguito, quando
eseguiremo il modulo.

```python
"""FILE: test_example.py"""

from example import square

def test_square():
    """Test our ``square()`` function."""
    assert square(2) == 4
    assert square(0) == 0
    assert square(-1) == 1

if __name__ == "__main__":
    test_square()
```

!!! note

    Il "name guard" è un pattern comune per evitare che il codice venga
    eseguito quando il modulo che lo contiene viene _importato_.  Quando
    invece si esegue il modulo con l'interpreter Python, la funzione di
    test verrà chiamata normalmente.

Ottimo!  Ora possiamo eseguire il nostro test alla riga di comando.

```python
python test_example.py
```

Non succede nulla.  Bene, questo significa che il test non è fallito.

Se vogliamo che il nostro test fallisca, possiamo modificare il codice.
Cambiamo una riga nel modulo di test per far fallire il test, ad esempio

```python
    assert square(2) == 42
```

Quando ora eseguiamo il nostro test...

```python
$ python test_example.py
Traceback (most recent call last):
  File "/home/biella/example/test_example.py", line 12, in <module>
    test_square()
  File "/home/biella/example/test_example.py", line 6, in test_square
    assert square(2) == 42
AssertionError
```

Ok, ecco come appare quando il nostro test riporta un risultato sbagliato.

## Utilizzare un framework di test

L'esecuzione di test come questo funziona in generale, ma non è
particolarmente bella.  L'esecuzione si interrompe al primo problema
rilevato.  Inoltre, non verrà dato alcun riepilogo dei risultati dei
test.  Ecco perché esistono i framework di test!  Ottimizziamo la nostra
configurazione di test allora con il framework `unittest` della libreria
standard di Python.

```python
"""FILE: test_example.py"""

import unittest
from example import square

class ExampleTests(unittest.TestCase):

    def test_square(self):
        """Test our ``square()`` function."""
        assert square(2) == 4
        assert square(0) == 0
        assert square(-1) == 1

if __name__ == "__main__":
    unittest.main()
```

Il framework `unittest` vuole che si usino le classi.  Una classe
`TestCase` è un contenitore per un numero arbitrario di test sullo stesso
argomento o su argomenti strettamente correlati.  Ora, possiamo eseguire
il nostro test nel terminale al solito modo:

```python
$ python test_example.py
.
----------------------------------------------------------------------
Ran 1 test in 0.000s

OK
```

Si noti il piccolo periodo sopra la lunga linea divisoria.  Questo
rappresenta il nostro test.  Ogni test riuscito sarà rappresentato da un
carattere `.`, mentre ogni test fallito sarà visualizzato con una `F`
maiuscola.  È possibile utilizzare l'opzione `-v` per un output più
prolisso, che mostrerà invece i nomi dei test:

```python
$ python test_example.py -v
test_square (test_example.ExampleTests)
Test our ``square()`` function. ... ok

----------------------------------------------------------------------
Ran 1 test in 0.000s

OK
```

L'opzione `-v` è gestita da `unittest.main()`, ovvero il framework
`unittest`.

Il framework può fare molto di più, però.  Invece di `assert`, si aspetta
che si usino i numerosi metodi `assertXxxx()` che la classe `TestCase`
mette a disposizione.  In genere, il nostro codice potrebbe assomigliare
a questo:

```python
"""FILE: test_example.py"""

import unittest
from example import square

class ExampleTests(unittest.TestCase):

    def test_square(self):
        """Test our ``square()`` function."""
        self.assertEqual(square(2), 42)
        self.assertEqual(square(0), 0)
        self.assertEqual(square(-1), 1)
```

Possiamo omettere la chiamata a `unittest.main()` e l'uso del name guard
se eseguiamo `unittest` come modulo.  Abbiamo introdotto intenzionalmente
un bug nel codice di test sopra.  Quando eseguiamo il test, otteniamo:

```python
$ python -m unittest
F
======================================================================
FAIL: test_square (test_example.ExampleTests)
Test our ``square()`` function.
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/biella/example/test_example.py", line 9, in test_square
    self.assertEqual(square(2), 42)
AssertionError: 4 != 42

----------------------------------------------------------------------
Ran 1 test in 0.000s

FAILED (failures=1)
```

Il metodo boilerplate `assertEqual` cerca di fornire un output
leggermente più utile del semplice `assert` quando si verifica un errore.

NB che non abbiamo chiamato il nostro modulo di test contenente la classe
del test case.  `unittest` ha attraversato l'albero delle cartelle e ha
raccolto il test da solo.  Per impostazione predefinita, l'algoritmo di
scoperta dei test cerca file come `test*.py` iniziando dalla directory di
esecuzione.

!!! note

    Ciò che chiamiamo dal terminale è l'interfaccia a riga di comando
    (CLI) di `unittest`.  Fornisce un comando aggiuntivo `discover`, che
    dà un maggiore controllo sul comportamento di scoperta dei test.  È
    possibile utilizzare l'opzione `--help`, cioè `python -m unittest
    --help`, per visualizzare ulteriori informazioni sull'uso della CLI,
    sui comandi e sulle opzioni.

## Possiamo fare meglio? Vogliamo codice pitonico!

Un'ultima cosa:  questo codice sembra più leggibile rispetto all'inizio?
No, per niente.  Il codice sembra gonfio, non è pitonico.  Questo perché
`unittest` è stato ispirato da JUnit, il framework di test unitari per
Java.  Possiamo fare meglio?  Sì, possiamo.  Lo vedremo nel prossimo
capitolo.
