---
title: What a Test Looks Like
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# What a Test Looks Like

Automated tests are usually implemented in source code.  Let's take a
look at an example.  Say, we have a simple function that calculates the
surface of a square with a certain side length.

```python
def square(a):
    """Calculate the surface of a square."""
    return a * a
```

## Manual Verification

When we manually verify the implementation we see that the code works as
expected, e.g.

```python
>>> square(2)
4
>>> square(0)
0
>>> square(-1)
1
```

Everything is fine, so we could move on.  There's only a small but
important issue:  What if we change the implementation of the `square()`
function?  We'd have to run those manual steps again to convince
ourselves that the now updated code still works.  This is tedious and
costly.

So, how can we turn this into a test that can be run like a program?

## Writing a Test

Test code that can run automatically simply mimicks what we would do when
we perform manual verification.  It's usually implemented with a simple
function or method, e.g.

```python
def test_square():
    """Test our ``square()`` function."""
    assert square(2) == 4
    assert square(0) == 0
    assert square(-1) == 1
```

The three lines of the test function body are equivalent to the manual
verification performed earlier.

What happens in the code above?

- Every line of the test function body contains a comparison, which is
  evaluated by the `assert` keyword.
- `assert` stops the execution of the program when the expression on the
  right evaluates to `False`, otherwise it does nothing.

## Structure of a Test

The test code above contains all there is to a tests.  We could write the
code more explicitly, though, to make the general structure of a test
visible:

1. Prepare
2. Execute
3. Verify

Our test would look like this:

```python
def test_square():
    """Test our ``square()`` function."""
    side_length = 2
    expected_result = 4

    surface = square(side_length)

    assert surface == expected_result
```

The above test now only covers the first evaluation of our original test.
No problem, we can write two additional tests for the remaining cases.
We'll learn later why this is actually good practice to do.
