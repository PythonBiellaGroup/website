---
title: Doctest
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Test semplici con `doctest`

Esiste un altro modo per scrivere test per funzioni semplici come quella
del nostro esempio.  Con il modulo `doctest` della libreria standard di
Python, si possono facilmente scrivere attività di test manuali e farle
rieseguire come codice di test autonomo.  È come lanciare l'interprete
Python, eseguire alcune chiamate di funzione rappresentative e incollare
l'intero testo – input e output – in una docstring del codice, ad esempio

```python
def square(a):
    """Calculate the surface of a square.

    >>> square(2) == 4
    True
    >>> square(0) == 0
    True
    >>> square(-1) == 1
    True
    >>> square("Foo")
    Traceback (most recent call last):
      ...
    TypeError: can't multiply sequence by non-int of type 'str'
    """
    return a * a
```

Si noti il `>>>`, che corrisponde al prompt dell'interprete Python.  La
notazione `...` (ellipsis) può essere usata per abbreviare l'output
effettivo prodotto dal codice Python.  `doctest` si occupa di importare
il modulo, quindi non è necessario farlo esplicitamente.

Perché scrivere i test in questo modo è veramente utile?  Primo, è facile
da fare.  In secondo luogo, rende la documentazione del codice più utile,
con esempi di codice che funzionano davvero.  In terzo luogo, gli esempi
di codice nella documentatazione sono sempre aggiornati.  Perché?
Perché, quando i test iniziano a fallire, bisogna correggere non solo il
codice, ma anche allineare la documentazione.

## Esecuzione dei doctest

Proprio come il modulo `unittest`, il modulo `doctest` fornisce
un'interfaccia a riga di comando (CLI) quando viene eseguito come modulo,
che prende come argomento un nome di file, ad esempio

```python
python -m doctest example.py
```

In alternativa, si possono eseguire tutti i doctest del progetto usando
l'opzione di Pytest `--doctest-modules`, ad esempio

```python
$ pytest -v --doctest-modules
============================= test session starts =============================
platform linux -- Python 3.10.12, pytest-7.4.2, pluggy-1.3.0 --
/home/biella/example/venv/bin/python
cachedir: .pytest_cache
rootdir: /home/biella/example
collected 4 items

example.py::example.square PASSED                                       [ 25%]
test_example.py::test_square[2-4] PASSED                                [ 50%]
test_example.py::test_square[0-0] PASSED                                [ 75%]
test_example.py::test_square[-1-1] PASSED                               [100%]

============================== 4 passed in 0.01s ==============================
```
