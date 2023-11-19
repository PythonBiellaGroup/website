---
title: Doctest
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Simple tests with `doctest`

There is another way to write tests for simple functions like the one in
our example.  The `doctest` module from the Python standard library
allows us to note down manual verification activities and have them
executed just like dedicated unit tests.  It's like launching the Python
interpreter, running a few represantative function calls and pasting the
entire text – input and output – into a docstring in your code, e.g.

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

Note the `>>>`, which is meant to correspond to the Python interpreter
prompt.  The `...` (ellipsis) notation can be used to shorten the actual
output produced by your Python code.  `doctest` takes care of importing
the module, so you don't have to.

Why is this so great?  First, it's easy to do.  Second, it makes the code
documentation more useful, with example code that actually works.  Third,
the code samples stay up-to-date, by design.  When the tests start
failing you must fix not only your code but also align the documentation.

## Executing doctests

Just like the `unittest` module, the `doctest` module provides a command
line interface (CLI) when run as a module, which takes a filename as an
argument, e.g.

```python
python -m doctest example.py
```

Alternatively, you can run all doctests of your project using the Pytest
`--doctest-modules` option, e.g.

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
