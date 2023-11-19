---
title: Unittest
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Using the `unittest` Framework

Now that we know what a test must look like, let's dive into unit testing
with Python.  As Python comes "with batteries included", we don't need to
install anything to start writing tests.  Let's continue with our earlier
example.

```python
def square(a):
    """Calculate the surface of a square."""
    return a * a

def test_square():
    """Test our ``square()`` function."""
    assert square(2) == 4
    assert square(0) == 0
    assert square(-1) == 1
```

## Separation of Concerns

First, we separate the business code and the test code.  We want tests to
live separately, so we can maintain and execute them better.

```python
"""FILE: example.py"""

def square(a):
    """Calculate the surface of a square."""
    return a * a
```

In the test module, we must import the `example` module, obviously.
Let's also add two lines that will run the test later, when we execute
the module.

```python
"""FILE: test_example.py"""

from example import square

def test_square():
    """Test our ``square()`` function."""
    assert square(2) == 4
    assert square(0) == 0
    assert square(-1) == 1

if __name__ == "__main__":
    test_square()
```

!!! note

    The name guard is a common pattern to avoid code to be executed when
    the module containing it is _imported_.  When we run the module with
    the Python interpreter the test function will be called just normally.

Great!  Now we can run our test on the command line.

```python
python test_example.py
```

Nothing happens, hmmm.  Alright, that means that the test didn't fail.

If we want to see our test failing we can make a change to the code.
Let's change one line in the test module to make the test fail, e.g.

```python
    assert square(2) == 42
```

When we now execute our test...

```python
$ python test_example.py
Traceback (most recent call last):
  File "/home/biella/example/test_example.py", line 12, in <module>
    test_square()
  File "/home/biella/example/test_example.py", line 6, in test_square
    assert square(2) == 42
AssertionError
```

Okay, that's what it looks like when our test reports a wrong result.

## Using a Test Framework

Running tests like this works, but it's not particularly beautiful.  The
execution will abort at the first detected issue.  Also, no summary of
the test results will be printed.  This is why test frameworks exist!
Let's beef up our test setup with the Python standard library's
`unittest` framework.

```python
"""FILE: test_example.py"""

import unittest
from example import square

class ExampleTests(unittest.TestCase):

    def test_square(self):
        """Test our ``square()`` function."""
        assert square(2) == 4
        assert square(0) == 0
        assert square(-1) == 1

if __name__ == "__main__":
    unittest.main()
```

The `unittest` framework wants us to use classes.  A `TestCase` class is
a container for an arbitrary number of tests on the same or closely
related topic.  Now, we can run our test in the terminal as usual:

```python
$ python test_example.py
.
----------------------------------------------------------------------
Ran 1 test in 0.000s

OK
```

Note the small period above the long divider line.  This represents our
test.  Every successful test will be depicted as a `.` character, every
failing test will show up with a capital `F`.  We can use the `-v` option
for a more verbose output, which will show the test names instead:

```python
$ python test_example.py -v
test_square (test_example.ExampleTests)
Test our ``square()`` function. ... ok

----------------------------------------------------------------------
Ran 1 test in 0.000s

OK
```

The `-v` option is handled by `unittest.main()`, i.e. the `unittest`
framework.

The framework can do much more, though.  Instead of `assert` it expects
us to use the numerous `assertXxxx()` methods the `TestCase` class
provides.  Typically, our code would then look like this:

```python
"""FILE: test_example.py"""

import unittest
from example import square

class ExampleTests(unittest.TestCase):

    def test_square(self):
        """Test our ``square()`` function."""
        self.assertEqual(square(2), 42)
        self.assertEqual(square(0), 0)
        self.assertEqual(square(-1), 1)
```

We can omit calling `unittest.main()` and the use of the name guard if we
run `unittest` as a module.  Note that above we have deliberately used a
wrong result in the test code, hence when we run our test suite, we get:

```python
$ python -m unittest
F
======================================================================
FAIL: test_square (test_example.ExampleTests)
Test our ``square()`` function.
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/biella/example/test_example.py", line 9, in test_square
    self.assertEqual(square(2), 42)
AssertionError: 4 != 42

----------------------------------------------------------------------
Ran 1 test in 0.000s

FAILED (failures=1)
```

The `assertEqual` boilerplate method tries to give a slightly more
helpful output than the plain `assert` when an error occurs.

Note that we didn't call our test module directly.  `unittest` walked
through the directory tree and collected the test all by itself.  By
default, the test discovery algorithm looks for files like `test*.py`
and starts its exploration at the execution directory.

!!! note

    What we call from the terminal is the `unittest` command line
    interface (CLI).  It provides an additional `discover` command, which
    gives greater control over the test discovery behavior.  You can use
    the `--help` option, e.g. `python -m unittest --help`, to display
    more CLI usage information, commands and options.

## Can we do better? We want pythonic code!

One last thing:  Does this code look more readable than it did at the
beginning?  No, probably not.  The code looks bloated, it is not
pythonic.  This is because `unittest` was inspired by JUnit, the unit
testing framework for Java.  Can we do better than that?  Yes, we can.
Let's take a look at that in the next chapter.
