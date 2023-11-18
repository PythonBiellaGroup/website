---
title: Documentare il codice
disquis: PythonBiellaGroup
---

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

---

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

💡 **Estensione VS Code**

[autoDocstring](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring) é un' estensione di vs code che ci permette di inserire un template di docstring all'interno del nostro codice in base al formato che indichiamo.

![autodocstring_gif](https://github.com/NilsJPWerner/autoDocstring/raw/HEAD/images/demo.gif)

Per cambiare il formato andare nelle impostazioni dell'estensione e modificare il parametro **autoDocstring.docstringFormat**



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

[Sphinx](https://www.sphinx-doc.org/en/master/) é forse la libreria più famosa per generare documentazione, a partire da file di varia natura, in vari formati quali HTML,PDF,LaTex,ePub,plain text.

#### Overview

Alcune delle caratteristiche più importanti:

- Output di vari formati pronti per la pubblicazione (possibilità di generare un sito web statico)
  
- Usa il formato **reStructured Text** ma é possibile parasare anche markdown con l'apposita estensione
  
- Temi: ce ne sono moltissimi, il più utilizzato é [Read the docs](https://sphinx-rtd-theme.readthedocs.io/en/stable/)

- Estensioni: sono disponibili diverse estensioni create dagli utenti, la maggior parte installabili tramite PyPI

#### Getting started

Per prima cosa posizionarsi all'interno della root di progetto:


1. Installare sphinx
    
    ```
    pip install sphinx
    ```

2. Creare una folder dedicata all'interno del progetto
    
    ```
    mkdir docs
    ```
    
    ```
    cd docs
    ```

3. Il comando **sphinx-quickstart** permette di fare un rapido setup di tutto ciò che é necessario per poter effettuare la build della documentazione
   
    ```
    sphinx-quickstart --quiet --project="Default project" --author="Author name" --language="en"
    ```

4. Eseguire la build
    
    ```
    make html (on Unix)
    ```
    
    ```
    .\make.bat html (on Windows PowerShell)
    ```

Con il setup iniziale all'interno della folder *docs* troveremo il file **conf.py** che é il file di configurazione per la nostra documentazione dove potremo specificare le estensioni da utilizzare e molto altro.

Ecco un esempio:

```
project = 'Example documentation'
copyright = '2022, Author name'
author = 'Author name'
release = '1.0.0'

extensions = ['sphinx.ext.napoleon',
              'autoapi.extension',
              'autodocsumm',
              'sphinx_copybutton',
              'myst_parser'
]

autoapi_type = 'python'
autoapi_dirs = ['../src']

source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown',
}

templates_path = ['_templates']
exclude_patterns = ['Thumbs.db', '.DS_Store','.venv']

html_theme = 'sphinx_rtd_theme'
html_title='Amazing project'
html_static_path = ['_static']
html_logo='_static/my_logo.png'
html_show_sourcelink = True
html_sidebars = {
    "**": ["logo-text.html", "globaltoc.html", "localtoc.html", "searchbox.html"]
}

html_theme_options = {
    'logo_only': False,
    'display_version': True,
    'prev_next_buttons_location': 'bottom',
    'style_external_links': False,
    'vcs_pageview_mode': '',
    'style_nav_header_background': 'white',
    # Toc options
    'collapse_navigation': True,
    'sticky_navigation': True,
    'navigation_depth': 2,
    'includehidden': True,
    'titles_only': False
}
```

#### Estensioni utili

* [sphinx.ext.napoleon](https://sphinxcontrib-napoleon.readthedocs.io/en/latest/): estensione che permette di considerare le docstring scritte nello stile Google e poterle incorporare così nella documentazione al posto di utilizzare quelle nel formato nativo di sphinx (reSt)
* [autoapi.extension](https://sphinx-autoapi.readthedocs.io/en/latest/tutorials.html): permette di generare documentazione automatica a partire dalle docstring che avete inserito nel vostro codice mediante parsing dello stesso. Fondamentale é specificare all'interno del conf.py il parametro **autoapi_dirs = ['../src']** indicante la folder da parsare.
* [autodocsumm](https://autodocsumm.readthedocs.io/en/latest/): permette di creare un table of contents in un certo punto della documentazione
* [sphinx_copybutton](https://sphinx-copybutton.readthedocs.io/en/latest/): permette di aggiungere un tasto "copy to clipboard" alle porzioni di codice all'interno della documentazione.
* [myst_parser](https://myst-parser.readthedocs.io/en/latest/): permette di considerare markdown come testi sorgenti per sphinx.

#### Pubblicare su Confluence
[Confluence](https://support.atlassian.com/confluence-cloud/resources/) é un servizio di creazione e condivisioni di documenti 
di Atlassian.
E' stata creata un'estensione per poter pubblicare direttamente da sphinx su Confluence.

L'estensione é **sphinxcontrib.confluencebuilder** [https://sphinxcontrib-confluencebuilder.readthedocs.io/en/stable/](https://sphinxcontrib-confluencebuilder.readthedocs.io/en/stable/)

Di seguito gli step per poter configurare l'estensione correttamente

1. Creare un account su Confluence
2. Creare un token API [https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/)
3. Installare l'estensione ```pip install sphinxcontrib-confluencebuilder```
4. Configurare il file **conf.py**

```
extensions = [
              'sphinxcontrib.confluencebuilder'
]

confluence_publish = True
confluence_space_key = MyDocs
confluence_parent_page = MyWiki
confluence_server_url = xxxxxx
confluence_server_user = xxxxxx
confluence_server_pass = xxxxxx
```