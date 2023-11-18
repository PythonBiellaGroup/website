---
title: Test BDD con Behave
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Test BDD con Behave

Uno stile molto diverso di scrivere test è lo sviluppo guidato dal
comportamento (behavior-driven development, BDD).  Anziché limitarsi al
codice Python, utilizza un linguaggio naturale formalizzato, *Gherkin*,
per descrivere il comportamento desiderato, per poi implementare i test
in Python.

Questo incoraggia la collaborazione tra stakeholder non tecnici,
ingegneri non programmatori e sviluppatori nel processo di sviluppo.  I
partecipanti possono definire in anticipo il comportamento previsto per
il software risultante in un linguaggio a loro comprensibile e possono
quindi comunicare efficacemente i loro desideri e la loro comprensione ad
altri partecipanti, come amministratori di database, ingegneri di rete,
specialisti della sicurezza, designer UX e programmatori che implementano
le funzionalità backend e frontend.

## Esempio di linguaggio Gherkin

Quando si usa Gherkin, i documenti che si scrivono hanno lo scopo di
descrivere una *feature*.  I documenti sono file di testo semplice con
estensione `.feature`.  Quindi, creiamo un tale file, per esempio
`example.feature`, e aggiungiamo il seguente contenuto:

```gherkin
Feature: Protection of user profile data

  Scenario: User profile access requires login
    Given I am not logged in
    When I try to display the user profile
    Then the website asks me to log in
```

La riga o il blocco "Feature" è soprattutto documentazione.  Di solito si
tratta di un titolo conciso ma descrittivo, a volte supportato da una
descrizione più lunga sotto forma di user story (ad esempio, "*Come
&lt;persona&gt; voglio fare &lt;qualcosa&gt; in modo da &lt;poterne
trarre un beneficio&gt;"*).

Dopodiché, il documento conterrà diversi blocchi "Scenario", tutti
secondo lo schema "*Dato &lt;preparare&gt; Quando &lt;agire&gt; Poi
&lt;verificare&gt;*".

!!! note

    L'inglese è la lingua predefinita per il parsing dei file Gherkin.
    Tuttavia, se aiuta il team a comunicare meglio, si può usare anche la
    propria lingua madre.  Behave offre le opzioni `--lang-list`,
    `--lang-help` e `--lang` per questo scopo, ad es.
    <pre><code class="codehilite">$ behave --lang-help it
    Translations for Italian / italiano
                 And: * , E
          Background: Contesto
                 But: * , Ma
            Examples: Esempi
             Feature: Funzionalità, Esigenza di Business, Abilità
               Given: * , Dato , Data , Dati , Date
                Rule: Regola
            Scenario: Esempio, Scenario
    Scenario Outline: Schema dello scenario
                Then: * , Allora
                When: * , Quando
    </code></pre>

## Implementazione dei test BDD

Uno dei più popolari strumenti di test BDD per Python è *Behave*.  Esiste
anche un plugin per Pytest, *pytest-bdd*, che implementa un sottoinsieme
del linguaggio Gherkin.  Per il nostro viaggio attuale ci atteniamo a
`behave`.  Possiamo installarlo usando Pip e poi eseguirlo dal terminale,
ad es.

```console
pip install behave
```

Per impostazione predefinita, `behave` richiede che i feature files si
trovino in una cartella chiamata `features/`, che deve contenere anche
una cartella `steps/` come sede per i moduli Python che in seguito
implementeranno i passi dello scenario.  Creiamo questa struttura di
cartelle e spostiamo il nostro feature file nel posto giusto, ad esempio

```console
mkdir -p features/steps/
mv -i example.feature features/
```

Ora possiamo eseguire `behave`:

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

Behave ha trovato il feature file, ma nessuna implementazione dei passi
dello scenario.  I passi sono funzioni Python con un argomento `context`
(e argomenti opzionali di parole chiave) che sono annotati con `@given`,
`@when` o `@then`, che prendono il testo del passo come argomento.

Behave cerca di far corrispondere le funzioni Python con il testo dei
feature file e le esegue.  La variabile `context` viene usata per passare
informazioni da un step all'altro, ad esempio si può allegare il
risultato di un'attività nel passo `@when` a questa variabile, e valutare
il valore solo nel passo `@then`, di seguito.

## Scenario Outlines

Behave supporta anche la parametrizzazione dei test, che viene chiamata
*scenario outlines* (abozzi) con *examples* (esempi).  Possiamo quindi
provare a implementare il nostro test unitario utilizzando Behave.

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

Di seguito si può vedere una possibile implementazione.  Questo codice
deve trovarsi in un modulo Python, ad esempio `features/steps/square.py`.

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

I `{...}` sono argomenti per le funzioni con un tipo di dati opzionale
che viene valutato dal matcher.  Behave supporta numerosi tipi di dati di
base (vedere la [documentazione di Behave][behave:parse]).  Si noti anche
che Behave pensa a importare le funzioni di annotazione.

Quando si esegue `behave`, si ottiene:

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
