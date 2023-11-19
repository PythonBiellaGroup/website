---
title: Using pytest
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Using Pytest

Pytest is a probably the most popular unit test framework of the Python
ecosystem.  That said, `unittest`, the framework that comes with the
Python standard library, is still in heavy use.  Specifically, unit tests
for Python itself, CPython, use that framework.  Both are here to stay.

Let's look at what makes Pytest so great.

- Pytest runs unit tests developed with Python's `unittest` framework.
  No need to change a single line of code.
- Pytest shows detailed information on failing `assert` statements. No
  need to remember or research the countless `assertXxxxx` methods of the
  `TestCase` classes.  Said that, the plain `assert` lets you write
  simple comparisons, which are fast to read and easy to understand.
- Pytest allows you to write your tests as simple functions.  No test
  classes needed unless you want them.  Less imports, less code overall.
- Pytest has test fixures, which is a concise and explicit way to add
  setup code to test functions that require preparation steps.
- Pytest allows you to parametrise a test, so you can run the same test
  for different input and expected results.  Again, this can reduce your
  test code significantly.
- Pytest has a rich ecosystem of useful plugins.  As of this writing, the
  Pytest documentation lists more than 1.200 plugins that can potentially
  help you to improve your test development experience.

## The Pytest user experience

Let's run the test suite we developed using the `unittest` framework with
Pytest.  We first need to install the `pytest` package, then simply run
`pytest` as a command:

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

Great!  We can run the test suite with Pytest, "as is".

Let's make our test code pythonic, concise and beautiful, also adding a
small mistake to make things more interesting.

```python
from example import square

def test_square():
    """Test our ``square()`` function."""
    assert square(2) == 4
    assert square(0) == 0
    assert square(-1) == -1
```

Note the last line of the test function where we introduced a mistake on
purpose (the square of `-1` should be `1`, not `-1`).  When we run Pytest
we get an explicit error message:

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

## Parametrize a test

Apart from testing on an invalid result, our test code has one serious
problem:  The test function does more than one thing.  Do you remember
the [recommendations for good tests](pratiche.md)?

Let's fix that with what Pytest calls parametrization of a test.

```python
import pytest
from example import square

@pytest.mark.parametrize(["value", "result"], [(2, 4), (0, 0), (-1, -1)])
def test_square(value, result):
    """Test our ``square()`` function."""
    assert square(value) == result
```

The `@pytest.mark.parametrize` annotation takes two parameters, the
variable names that become positional arguments for our test function,
and a list of values that are passed to the function for each invocation.

When we now run our test suite we get three tests instead of one.  We can
see that better when we run Pytest with the "verbose" flag, e.g.

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

Great!  Now we can immediately understand that from 3 tests only a single
test failed, yet we have written only a single test function!

!!! note

    You can write the first argument of `parametrize` also as a string
    with comma-separated values or a tuple.  In fact, the code snippets
    in the Pytest documentation use a string.  Pytest will understand all
    of it, though using a tuple or a list is considered cleaner code,
    which is why [some linters will complain](
    https://docs.astral.sh/ruff/rules/pytest-parametrize-names-wrong-type/
    ) about a string value.

## Test fixtures

A fixture is setup code that may return data.  It roughly corresponds to
the `setUp()` method in a `unittest.TestCase`.

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

Note how the fixture is used:  It's simply declared as a parameter of the
test function.  This is as local and explicit as it can be for using it,
and helps to craft test code that is easy to understand and stays that
way, even when the test suite grows.
