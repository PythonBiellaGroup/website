---
title: L'aspetto di un test
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# L'aspetto di un test

I test automatizzati sono solitamente implementati nel codice sorgente.
Vediamo un esempio.  Supponiamo di avere una semplice funzione che
calcola la superficie di un quadrato con una certa lunghezza di lato.

```python
def square(a):
    """Calculate the surface of a square."""
    return a * a
```

## Verifica manuale

Quando verifichiamo manualmente l'implementazione, vediamo che il codice
funziona come previsto, ad es.

```python
>>> square(2)
4
>>> square(0)
0
>>> square(-1)
1
```

Tutto bene, quindi possiamo procedere.  C'è solo un piccolo ma importante
problema:  Cosa succede se cambiamo l'implementazione della funzione
`square()`?  Dovremmo eseguire di nuovo questi passaggi manuali per
convincerci che il codice aggiornato funziona ancora.  Questo è noioso e
costoso.

Quindi, come possiamo trasformare questo in un test che possa essere
eseguito come un programma?

## Scrivere un test

Il codice di un test che può essere eseguito automaticamente imita
semplicemente quello che faremmo quando eseguiamo una verifica manuale.
Di solito viene implementato con una semplice funzione o metodo, ad es.

```python
def test_square():
    """Test our ``square()`` function."""
    assert square(2) == 4
    assert square(0) == 0
    assert square(-1) == 1
```

Le tre righe del corpo della funzione di test sono equivalenti alla
verifica manuale eseguita in precedenza.

Cosa succede nel codice qui sopra?

- Ogni riga del corpo della funzione di test contiene una comparazione,
  che viene valutata dalla parola chiave `assert`.
- `assert` interrompe l'esecuzione del programma quando l'espressione a
  destra viene valutata come `False`, altrimenti non fa nulla.

## Struttura di un test

Il codice di test sopra riportato contiene tutto ciò che è necessario per
un test.  Tuttavia, potremmo scrivere il codice in modo più esplicito,
per rendere visibile la struttura generale di un test:

1. Preparazione
2. Esecuzione
3. Verifica

Il nostro test avrebbe il seguente aspetto:

```python
def test_square():
    """Test our ``square()`` function."""
    side_length = 2
    expected_result = 4

    surface = square(side_length)

    assert surface == expected_result
```

Il test precedente copre ora solo la prima valutazione del nostro test
originale.  Non c'è problema, possiamo scrivere altri due test per i casi
rimanenti.  Scopriremo più avanti perché questa è addirittura una buona
pratica da impiegare.
