---
title: Good practices for writing tests
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Good Practices for Writing Tests

For our tests to be useful we need them to have certain characteristics.

- **Fast.** Nobody will be happy to run them if they take ages to
  execute.  You should want to run them for every single change.
- **Simple.** We don't want to write tests for our tests, hence it should
  be easy to spot if a test is implemented correctly or not.
- **Focused.** If a test fails it should be clear what broke exactly.
  You don't want to start analysing what you need to fix, especially when
  you're in a hurry.
- **Deterministic.** The same test run over the same business code should
  yield the same result again.  Nobody wants to run a test suite that is
  unpredictable or flaky.

## Test Implementation

- A single test should do a single thing.  If you want to verify 3
  aspects of your code write 3 tests.
- Make your test code readable and easy to understand.  When you come
  back to update your test code it should all be self-explanatory.
- With unit tests, test your own code only.  Avoid driving a Web browser,
  a database or an external API.  Restructure your code or mock those
  dependencies away.

## Test Setup

- Support your test suite by QA tools, such as linters.  They will spot
  syntax errors, code smells and other issues even before your test code
  unveils them.  You can also run them over your own test code.
- Run your tests automatically.  Locally, e.g. configured in your IDE,
  and in your CI/CD pipeline, every time you push a change.
