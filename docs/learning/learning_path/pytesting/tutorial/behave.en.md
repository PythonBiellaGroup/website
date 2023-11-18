---
title: BDD tests with Behave
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# BDD tests with Behave

A very different style of writing tests is behavior-driven development
(BDD).  Instead of just Python code, it uses a formalized natural
language, *Gherkin*, in the first place to describe the intended
behavior, and has you then implement those tests in Python, later.

This encourages collaboration between non-technical stakeholders,
engineers that are not coders, and developers in the development process.
Stakeholders can define the intended behavior of the resulting software
upfront in a language they understand and can thus effectively
communicate their desires and understanding to other participants, such
as database admins, network engineers, security specialists, UX
designers, as well as programmers that implement the backend and frontend
functionality.

## Gherkin language example

When you use Gherkin, the documents you write are meant to describe a
*feature*.  The documents are plain text files with the `.feature` file
extension.  Let's create a file called `example.feature` and add the
following content:

```gherkin
Feature: Protection of user profile data

  Scenario: User profile access requires login
    Given I am not logged in
    When I try to display the user profile
    Then the website asks me to log in
```

The "Feature" row or block is merely documentation.  This is usually a
concise but descriptive title, sometimes supported by a more lengthy
description in the form of a user story (i.e. "*As a &lt;persona&gt; I
want to &lt;do something&gt; so that I can &lt;derive a benefit&gt;*").

After that, the document shall contain several "Scenario" blocks, all of
which following the "*Given &lt;prepare&gt; When &lt;act&gt; Then
&lt;verify&gt;*" pattern.

!!! note

    English is the default language for parsing Gherkin files.  If it
    helps your team to communicate better you can also use your native
    language, though.  Behave provides the `--lang-list`, `--lang-help`
    and `--lang` options for that, e.g.
    <pre><code class="codehilite">$ behave --lang-help fr
    Translations for French / français
                 And: * , Et que , Et qu', Et
          Background: Contexte
                 But: * , Mais que , Mais qu', Mais
            Examples: Exemples
             Feature: Fonctionnalité
               Given: * , Soit , Sachant que , Sachant qu', Sachant , Etant
    donné que , Etant donné qu', Etant donné , Etant donnée , Etant donnés ,
    Etant données , Étant donné que , Étant donné qu', Étant donné , Étant
    donnée , Étant donnés , Étant données
                Rule: Règle
            Scenario: Exemple, Scénario
    Scenario Outline: Plan du scénario, Plan du Scénario
                Then: * , Alors , Donc
                When: * , Quand , Lorsque , Lorsqu'
    </code></pre>

## Implementing BDD tests

One of the most popular BDD test tools for Python is *Behave*.  There is
also a Pytest plugin, *pytest-bdd*, which implements a subset of the
Gherkin language.  Let's stick to `behave` for our current journey.  We
can install it using Pip and then run it from the terminal, e.g.

```console
pip install behave
```

By default, `behave` requires that feature files are located in a folder
called `features/`, which also needs to contain a folder `steps/` as a
home for the Python modules that later implement the scenario steps.
Let's create this directory structure and move our feature file in the
correct place, e.g.

```console
mkdir -p features/steps/
mv -i example.feature features/
```

Now we can run `behave`:

```python
$ behave
Feature: Protection of user profile data # features/example.feature:1

  Scenario: User profile access requires login  # features/example.feature:3
    Given I am not logged in                    # None
    When I try to display the user profile      # None
    Then the website asks me to log in          # None


Failing scenarios:
  features/example.feature:3  User profile access requires login

0 features passed, 1 failed, 0 skipped
0 scenarios passed, 1 failed, 0 skipped
0 steps passed, 0 failed, 0 skipped, 3 undefined
Took 0m0.000s

You can implement step definitions for undefined steps with these snippets:

@given(u'I am not logged in')
def step_impl(context):
    raise NotImplementedError(u'STEP: Given I am not logged in')


@when(u'I try to display the user profile')
def step_impl(context):
    raise NotImplementedError(u'STEP: When I try to display the user profile')


@then(u'the website asks me to log in')
def step_impl(context):
    raise NotImplementedError(u'STEP: Then the website asks me to log in')
```

Behave found the feature file, but no implementation of the scenario
steps.  Steps are Python functions with a `context` argument (and
optional keyword arguments) that are annotated with `@given`, `@when` or
`@then`, which take the step's text as an argument.

Behave tries to match Python functions with text from the features files,
and executes those functions.  The `context` variable is used to carry
information from one step to another, e.g. you may attach the result of
an activity in the `@when` step to that variable, and evaluate the value
only in the `@then` step, later.

## Scenario Outlines

Behave also supports parametrisation of feature tests, which is called a
*scenario outline* with *examples*.  We can thus try to implement our
unit test using Behave.

```gherkin
Feature: Calculate the surface of a square

  Scenario Outline: Calculating the square of numbers
    Given I have imported the calculator module
    When I calculate the square of <length>
    Then the result should be <surface>

    Examples: Valid results
      | length | surface |
      |      2 |       4 |
      |      0 |       0 |
      |     -1 |       1 |
```

An implementation of the steps may look like this.  Put this code in a
file, say, `features/steps/square.py`.

```python
@given("I have imported the calculator module")
def step_impl(context):
    from example import square
    context.func = square


@when("I calculate the square of {length:d}")
def step_impl(context, length):
    context.result = context.func(length)


@then("the result should be {surface:d}")
def step_impl(context, surface):
    assert surface == context.result
```

The `{...}` are step arguments with an optional type that is evaluated by
the matcher.  Behave supports numerous basic data types out-of-the-box
(see the [Behave documentation][behave:parse]).  Also note that Behave
takes care about importing the annotation functions.

When we run `behave`, we get:

```python
$ behave
Feature: Calculate the surface of a square # features/example.feature:1

  Scenario Outline: Calculating the square of numbers -- @1.1 Valid results
    Given I have imported the calculator module
    When I calculate the square of 2
    Then the result should be 4

  Scenario Outline: Calculating the square of numbers -- @1.2 Valid results
    Given I have imported the calculator module
    When I calculate the square of 0
    Then the result should be 0

  Scenario Outline: Calculating the square of numbers -- @1.3 Valid results
    Given I have imported the calculator module
    When I calculate the square of -1
    Then the result should be 1

1 feature passed, 0 failed, 0 skipped
3 scenarios passed, 0 failed, 0 skipped
9 steps passed, 0 failed, 0 skipped, 0 undefined
Took 0m0.000s
```

[behave:parse]: https://behave.readthedocs.io/en/stable/parse_builtin_types.html
