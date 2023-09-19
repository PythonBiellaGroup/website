---
title: Documenting code
disquis: PythonBiellaGroup
---

## Why is documenting code important?
It's essential to document your code as thoroughly as possible. Why?

* **Improved Code Understanding**: Documentation helps understand what you've developed by providing a linear path to navigate the code. Good documentation explains the purpose and functionality of each module and function, making it easier to modify or extend the code.

* **Collaboration**: Documentation facilitates efficient bug resolution and implementation of changes, even for team members who need to work on your solution.

* **Maintenance**: With good documentation, code maintenance becomes simpler and more immediate because implementation intentions are clearer.

* **Quality**: Documentation is an integral part of a software product and is a mandatory step for the final release of the solution. It's even more critical in consulting contexts where the software will be delivered to an end client who will need to manage it independently.

---

## Which Tools?

There are numerous code documentation tools and many ways to do it. Three of the most commonly used tools for documenting code are:

* Classic Python: Using docstrings, comments, etc.
* Sphinx
* MKDocs

---

### Docstrings and Comments

#### Comments

In Python, you can use comments in your code to explain how a specific portion of code works.

To create a comment, simply add the **#** character before the comment text:

```python
# This is a comment explaining the following code
print('Hello World')
```

Comments can also span multiple lines:

```python
# This is a comment
# written in
# more than just one line
print("Hello, World!")
```

Alternatively, you can use triple quotes for multiline comments:

```python
"""
This is a comment
written in
more than just one line
"""
print("Hello, World!")
```

#### Docstrings

Docstrings are strings that allow you to describe a method, function, class, or module immediately after its definition:

```python
def square(n):
    '''Takes in a number n, returns the square of n'''
    return n**2
```

Docstrings are formally defined in [PEP257](https://peps.python.org/pep-0257/). However, there are various conventions you can follow, such as Google style, reStructuredText (reST), and Numpy style.

💡 **VS Code Extension**

[autoDocstring](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring) is a VS Code extension that allows you to insert a docstring template into your code based on the format you specify.

To change the format, go to the extension settings and modify the **autoDocstring.docstringFormat** parameter.

**Using Docstrings**

You can access docstrings, if present, using the following commands to get a description of a module or function from an external library that you want to use in your project:

```python
print(some_function.__doc__)
```

Or:

```python
help(some_function)
```

---

### Sphinx

[Sphinx](https://www.sphinx-doc.org/en/master/) is perhaps the most famous library for generating documentation from various source files in multiple formats, including HTML, PDF, LaTeX, ePub, and plain text.

#### Overview

Some of its most important features include:

- Output in various formats ready for publication (including generating a static website).
- Uses the reStructuredText format, but it can also parse Markdown with the appropriate extension.
- Offers many themes, with the most popular one being [Read the Docs](https://sphinx-rtd-theme.readthedocs.io/en/stable/).
- Provides extensions created by users, most of which can be installed via PyPI.

#### Getting Started

First, navigate to the project's root folder:

1. Install Sphinx:

    ```bash
    pip install sphinx
    ```

2. Create a dedicated folder within the project:

    ```bash
    mkdir docs
    ```

    ```bash
    cd docs
    ```

3. The `sphinx-quickstart` command helps set up everything needed for documentation building:

    ```bash
    sphinx-quickstart --quiet --project="Default project" --author="Author name" --language="en"
    ```

4. Build the documentation:

    ```bash
    make html (on Unix)
    ```

    ```bash
    .\make.bat html (on Windows PowerShell)
    ```

After the initial setup, within the `docs` folder, you'll find the `conf.py` file, which is the configuration file for your documentation. Here, you can specify the extensions to use and more.

Here's an example:

```python
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
    'collapse_navigation': True,
    'sticky_navigation': True,
    'navigation_depth': 2,
    'includehidden': True,
    'titles_only': False
}
```

#### Useful Extensions

* [sphinx.ext.napoleon](https://sphinxcontrib-napoleon.readthedocs.io/en/latest/): An extension that allows you to consider Google-style docstrings and incorporate them into the documentation instead of using the native Sphinx (reStructuredText) format.
* [autoapi.extension](https://sphinx-autoapi.readthedocs.io/en/latest/tutorials.html): Enables automatic documentation generation based on the docstrings you've added to your code through parsing. It's essential to specify the `autoapi_dirs = ['../src']` parameter in `conf.py`, indicating the directory to parse.
* [autodocsumm](https://autodocsumm.readthedocs.io/en/latest/): Helps create a table of contents at a specific point in the documentation.
* [sphinx_copybutton](https://sphinx-copybutton.readthedocs.io/en/latest/): Adds a "copy to clipboard" button to code sections within the documentation.
* [myst_parser](https://myst-parser.readthedocs.io/en/latest/): Allows you to use Markdown as source text for Sphinx.

#### Publishing to Confluence

[Confluence](https://support.atlassian.com/confluence-cloud/resources/) is a document creation and sharing service by Atlassian. An extension has been created to publish directly from Sphinx to Confluence.

The extension is **sphinxcontrib.confluencebuilder** [https://sphinxcontrib-con

fluencebuilder.readthedocs.io/en/stable/](https://sphinxcontrib-confluencebuilder.readthedocs.io/en/stable/).

Here are the steps to configure the extension correctly:

1. Create an account on Confluence.
2. Create an API token [https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/).
3. Install the extension with `pip install sphinxcontrib-confluencebuilder`.
4. Configure the `conf.py` file:

```python
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