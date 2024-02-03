---
title: Documenting code
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

As we have seen mkdocs is very convenient and fast, one of the most used features of the library is to quickly comment and share technical documentation related to code.

To do this you need to use a [particular extension](https://mkdocstrings.github.io/) called `mkdocstring`.

This extension allows you to automatically create documentation of Python functions and classes, being able to read notations and `docstrings` by turning them into HTML code.

Be careful in installing the library which is called: `mkdocstrings-python` and not just `mkdocstrings`, you must therefore do with poetry:

`poetry add mkdocstrings-python`.

The difference is that `mkdocstrings-python` is the handler to support python code.

With mkdocstrings you can also document and support `shell` code by installing: `mkdocstrings-shell`

Once the library is installed you will also need to configure it, to do this it is important to put in the `mkdocs.yaml` file within the `plugins` section this configuration

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
                          - '!^_' # exclude all members starting with _
                          - '!^__init__$' # exclude __init__ modules and methods

```

To do this try creating a function, for example:

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

After that you will have to import the package inside a markdown file using a special notation, suppose your code is in the following folder (or module): `myapp/test/utils.py`

Inside a markdown file you will need to write:

```markdown

::: myapp.test.utils.sum_numbers

```

Automatically mkdocstring will display within the site your example.

Of course we always recommend that you try to edit markdown files and always check the result, you can always make sure to add more comments or embellishments in markdown normally.
