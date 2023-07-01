
## Perchè documentare il codice è importante?
E' fondamentale documentare per quanto possibile il proprio codice. Perché?

* **Miglior comprensione del codice**: aiuta a comprendere quello che abbiamo sviluppato aiutandoci a navigare il codice in maniera lineare. Una buona documentazione spiega lo scopo e la funzionalità di ciascun modulo e funzione, il che semplifica la modifica o l’estensione del codice.
  
* **Collaborazione**: la documentazione ci permette di facilitare la risoluzione di bug o l'implementazione di modifiche in modo efficiente anche per i membri del team che devono lavorare sulla nostra soluzione.

* **Manutenzione**: con una buona documentazione la manutenzione del codice sarà più semplice e immediata proprio perchè saranno più facilmente gli intenti implementativi.

* **Qualità**: la documentazione é parte integrante di un prodotto software ed é uno step mandatorio per il rilascio finale della soluzione. Fondamentale ancora di più nel contesto consulenziale dove il software sarà consegnato nelle mani di un cliente finale che poi dovrà gestirlo in autonomia.

---

## Quali tools?

Ci sono moltissimi strumenti di documentazione del codice e tanti altri modi per farlo.

Tre degli strumenti più utilizzati per documentare il proprio codice sono:

* Python classico: utilizzando docstrings, commenti , ..
* Sphinx
* MKDocs

---

### Docstrings e commenti

#### Commenti

In python possiamo utilizzare innanzitutto i commenti nel nostro codice per meglio spiegare il funzionamento di una certa porzione di codice.

Per creare un commento basta aggiungere il carattere **#** al testo del nostro commento    

```
# commento per il seguente codice
print('Hello World')
```

oppure

```
print('Hello World') #commento
```

Ci sono anche le varianti per un commento multiline
```
#This is a comment
#written in
#more than just one line
print("Hello, World!")
```

oppure

```
"""
This is a comment
written in
more than just one line
"""
print("Hello, World!")
```

#### Docstrings
Sono stringhe che ci permettono di andare a descrivere un metodo,una funzione,una classe o un modulo subito dopo la loro definizione

```
def square(n):
    '''Takes in a number n, returns the square of n'''
    return n**2
```

Le docstring sono definite formalmente in [PEP257](https://peps.python.org/pep-0257/)

Ci sono comunque varie convenzioni che possono essere seguite:

- [Google](https://github.com/google/styleguide/blob/gh-pages/pyguide.md#38-comments-and-docstrings)
```
"""
This is an example of Google style.

Args:
    param1: This is the first param.
    param2: This is a second param.

Returns:
    This is a description of what is returned.

Raises:
    KeyError: Raises an exception.
"""
```
- [reST](https://www.sphinx-doc.org/en/master/) (reStructuredText)
```
"""
This is a reST style.

:param param1: this is a first param
:param param2: this is a second param
:returns: this is a description of what is returned
:raises keyError: raises an exception
"""
```
- [Numpy](https://numpydoc.readthedocs.io/en/latest/)
```
"""
My numpydoc description of a kind
of very exhautive numpydoc format docstring.

Parameters
----------
first : array_like
    the 1st param name `first`
second :
    the 2nd param
third : {'value', 'other'}, optional
    the 3rd param, by default 'value'

Returns
-------
string
    a value in a string

Raises
------
KeyError
    when a key error
OtherError
    when an other error
"""
```

** Utilizzo delle docstrings **

E' possibile consultare le docstrings, se presenti, tramite i seguenti comandi per ottenere una descrizione di un modulo o una funzione di una libreria esterna che vogliamo usare nel nostro progetto

```
print(some_function.__doc__)
```

oppure

```
help(some_function)
```

---

### Sphinx


---
### MKDocs
