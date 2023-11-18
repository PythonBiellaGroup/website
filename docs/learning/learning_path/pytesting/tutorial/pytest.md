---
title: Utilizzare pytest
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Utilizzare Pytest

Pytest è probabilmente il framework di unit test più popolare
dell'ecosistema Python.  Detto questo, `unittest`, il framework fornito
con la libreria standard di Python, è ancora molto utilizzato.  In
particolare, i test unitari per Python stesso, CPython specificamente,
utilizzano questo framework.  Entrambi sono destinati a rimanere.

Vediamo cosa rende Pytest così fantastico.

- Pytest esegue test unitari sviluppati con il framework `unittest`.
  Non è necessario modificare neanche una sola riga di codice.
- Pytest mostra informazioni dettagliate quando un `assert` fallisce.
  Non è necessario ricordare o ricercare gli innumerevoli metodi
  `assertXxxxx` delle classi `TestCase`.  Detto questo, il semplice
  `assert` consente di scrivere semplici confronti, veloci da leggere e
  facili da capire.
- Pytest consente di scrivere i test come semplici funzioni.  Non sono
  necessarie classi di test, a meno che non le si voglia.  Meno rige
  `import`, meno codice in generale.
- Pytest dispone di fixure per i test, un modo conciso ed esplicito per
  aggiungere codice di configurazione alle funzioni di test che
  richiedono passaggi di preparazione.
- Pytest consente di parametrare un test, in modo da poter eseguire lo
  stesso test con input e risultati attesi diversi.  Anche in questo
  caso, il codice di test può essere ridotto in modo significativo.
- Pytest ha un ricco ecosistema di utili plugin.  Al momento in cui
  scriviamo, la documentazione di Pytest elenca più di 1.200 plugin che
  possono potenzialmente aiutare a migliorare l'esperienza di sviluppo
  dei test.

## L'esperienza utente di Pytest

Eseguiamo la suite di test che abbiamo sviluppato usando il framework
`unittest` con Pytest.  Per prima cosa dobbiamo installare il pacchetto
`pytest`, quindi eseguire semplicemente `pytest` come comando:

```python
$ pip install pytest
Collecting pytest
  ...
Installing collected packages: tomli, pluggy, packaging, iniconfig,
exceptiongroup, pytest
Successfully installed ...
```

```python
$ pytest
============================= test session starts =============================
platform linux -- Python 3.10.12, pytest-7.4.2, pluggy-1.3.0
rootdir: /home/biella/example
collected 1 item

test_example.py .                                                       [100%]

============================== 1 passed in 0.01s ==============================
```

Ottimo!  Possiamo eseguire la suite di test con Pytest, così com'è.

Rendiamo il nostro codice di test pitonico, conciso e bello, aggiungendo
anche un piccolo errore per rendere l'esecuzione più interessante.

```python
from example import square

def test_square():
    """Test our ``square()`` function."""
    assert square(2) == 4
    assert square(0) == 0
    assert square(-1) == -1
```

Si noti l'ultima riga della funzione di test, dove abbiamo introdotto un
errore di proposito (il quadrato di `-1` dovrebbe essere `1`, non `-1`).
Quando si esegue Pytest si ottiene il seguente messaggio di errore
dettagliato:

```python
$ pytest
============================== test session starts ============================
platform linux -- Python 3.10.12, pytest-7.4.2, pluggy-1.3.0
rootdir: /home/biella/example
collected 1 item

test_example.py F                                                       [100%]

================================== FAILURES ===================================
_________________________________ test_square _________________________________

    def test_square():
        """Test our ``square()`` function."""
        assert square(2) == 4
        assert square(0) == 0
>       assert square(-1) == -1
E       assert 1 == -1
E        +  where 1 = square(-1)

test_example.py:8: AssertionError
=========================== short test summary info ===========================
FAILED test_example.py::test_square - assert 1 == -1
============================== 1 failed in 0.01s ==============================
```

## Parametrizzare un test

Oltre a eseguire il test su un risultato non valido, il nostro codice di
test ha un problema serio: la funzione di test fa più di una cosa.
Ricordate le [raccomandazioni per buoni test](pratiche.md)?

Risolviamo questo problema con ciò che Pytest chiama parametrizzazione di
un test.

```python
import pytest
from example import square

@pytest.mark.parametrize(["value", "result"], [(2, 4), (0, 0), (-1, -1)])
def test_square(value, result):
    """Test our ``square()`` function."""
    assert square(value) == result
```

L'annotazione `@pytest.mark.parametrize` prende due parametri, i nomi
delle variabili che diventano argomenti posizionali per la nostra
funzione di test e un elenco di valori che vengono passati alla funzione
per ogni invocazione.

Quando ora eseguiamo la nostra suite di test, otteniamo tre test invece
di uno.  Lo si può vedere meglio quando si esegue Pytest con il flag
"verbose", ad es.

```python
$ pytest -v
============================= test session starts =============================
platform linux -- Python 3.10.12, pytest-7.4.2, pluggy-1.3.0 --
/home/biella/example/venv/bin/python
cachedir: .pytest_cache
rootdir: /home/biella/example
collected 3 items

test_example.py::test_square[2-4] PASSED                                [ 33%]
test_example.py::test_square[0-0] PASSED                                [ 66%]
test_example.py::test_square[-1--1] FAILED                              [100%]

================================== FAILURES ===================================
_____________________________ test_square[-1--1] ______________________________

value = -1, result = -1

    @pytest.mark.parametrize(["value", "result"], [(2, 4), (0, 0), (-1, -1)])
    def test_square(value, result):
        """Test our ``square()`` function."""
>       assert square(value) == result
E       assert 1 == -1
E        +  where 1 = square(-1)

test_example.py:8: AssertionError
=========================== short test summary info ===========================
FAILED test_example.py::test_square[-1--1] - assert 1 == -1
========================= 1 failed, 2 passed in 0.01s =========================
```

Ottimo!  Ora possiamo capire immediatamente che su 3 test solo un test è
fallito, eppure abbiamo scritto una sola funzione di test!

!!! note

    È possibile scrivere il primo argomento di `parametrize` anche come
    una stringa con valori separati da virgole o come una tupla.  In
    effetti, i frammenti di codice nella documentazione di Pytest
    utilizzano una stringa.  Pytest capirà tutto, ma l'uso di una tupla o
    di una lista è considerato un codice più pulito, motivo per cui
    [alcuni linters si lamenteranno](
    https://docs.astral.sh/ruff/rules/pytest-parametrize-names-wrong-type/
    ) di un valore stringa.

## Fixture di test

Una fixture è un codice che prepara un test.  Corrisponde grosso modo al
metodo `setUp()` di un `unittest.TestCase`.

```python
import pytest
from example import square

@pytest.fixture
def reset_calculator():
    """(Re)initialize our calculator data store."""
    ...

def test_square(reset_calculator):
    """Test our ``square()`` function."""
    assert square(2) == 4
```

Affinché un test utilizzi una fixture, questa viene semplicemente
dichiarata nell'elenco dei parametri del test.  Il suo uso è quindi il
più locale ed esplicito possibile.  Questo aiuta a sviluppare un codice
di test che sia facile da capire e che rimanga tale anche quando la suite
di test cresce.
