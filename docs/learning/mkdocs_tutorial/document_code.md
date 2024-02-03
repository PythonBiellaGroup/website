---
title: Documentare il codice
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

Come abbiamo visto mkdocs è molto comodo e veloce, una delle funzionalità più utilizzate della libreria è per commentare e condividere velocemente documentazione tecnica relativa al codice.

Per farlo è necessario utilizzare una [particolare estensione](https://mkdocstrings.github.io/) chiamata `mkdocstring`.

Questa estensione consente di creare automaticamente la documentazione delle funzioni e delle classi Python, riuscendo a leggedere le notazioni e le `docstring` trasformandole in codice HTML.

Attenzione nell'installazione della libreria che si chiama: `mkdocstrings-python` e non solamente `mkdocstrings`, dovete quindi fare con poetry:

`poetry add mkdocstrings-python`

La differenza è che `mkdocstrings-python` è l'handler per supportare il codice python.

Con mkdocstrings è anche possibile documentare e supportare codice `shell` installando: `mkdocstrings-shell`

Una volta installata la libreria sarà necessario anche configurarla, per farlo è importante inserire nel `mkdocs.yaml` file all'interno della sezione `plugins` questa configurazione

```yaml
 - mkdocstrings:
          default_handler: python
          handlers:
              python:
                  options:
                      show_source: true
                      show_root_heading: yes
                      heading_level: 0
                      filters:
                          - '!^_'             # exclude all members starting with _
                          - '!^__init__$'             # exclude __init__ modules and methods

```

Per farlo prova a creare una funzione, ad esempio:

```python

def sum_numbers(num1: int, num2: int) -> int:
    ```
    def sum_numbers(num1: int, num2: int) -> int:
    """Sum 2 int numbers and obtain a result

    Args:
        num1 (int): the first number you want to sum
        num2 (int): the second number you want to sum

    Returns:
        result (int): the sum of the two numbers
    """
    return num1 + num2

```

Dopodiche dovrai importare il package all'interno di un file markdown utilizzando una speciale notazione, supponiamo che il tuo codice sia nella seguente cartella (o modulo): `myapp/test/utils.py`

All'interno di un file markdown dovrai scrivere:

```markdown

::: myapp.test.utils.sum_numbers

```

In automatico mkdocstring visualizzerà all'interno del sito il tuo esempio.

Ovviamente consigliamo sempre di provare a modificare i file markdown e di controllare sempre il risultato, potete sempre fare in modo di aggiungere altri commenti o abbellimenti in markdown normalmente.