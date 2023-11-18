---
title: Code style
disquis: PythonBiellaGroup
---

## Intro

When working on projects and sharing code with a team, it's important to try to maintain a consistent coding style to align with one another and avoid misunderstandings.

In Python, there are:

- PEP8 = Default Python style guide
- PEP257 = Docstring style guide

Some examples of PEP8 guidelines:

- Use 4 spaces for indentation.
- How to indent parentheses.
- Default code line length (79 characters for code and 72 characters for comments and docstrings).
- How to configure imports.
- ...

However, despite the PEP8 guidelines, there are many things that can be subject to discussion and are not always clear, leaving room for interpretation.

This is where some libraries come into play to help with code quality management.

---

## Black

Black is a code formatter that takes your files and formats them according to PEP8 and PEP257, with some additional rules (e.g., it converts single quotes to double quotes).

It can be configured (e.g., by using `--skip-string-normalization` to preserve single quotes).

Black is a highly debated tool and can be quite aggressive at times, but when used within a team, it helps standardize code formatting.

To install and use Black:

```bash
# Install Black
pip install black

# It's recommended to use pipx
pipx install black
```

To format a project:

```bash
black my_project  # my_project = project folder
```

Additionally, you can set up Black in Visual Studio Code to automatically format code on save. To do this, go to settings and modify the "format on save" setting, specifically the "python: formatting provider."

For more details, check out this guide: [Setting up Python Black on Visual Studio Code](https://marcobelo.medium.com/setting-up-python-black-on-visual-studio-code-5318eba4cd00).

---

## Flake8

In addition to tools for code formatting in Python, there are various linters and static code analyzers available.

One of the most popular Python linters is Flake8.

Flake8 doesn't change the code in a project but provides real-time warning feedback.

Flake8 combines three different projects:

- [pyflakes](https://github.com/pycqa/pyflakes) - provides warnings about unused modules, undefined variables, and more.
- [pycodestyle](https://pycodestyle.pycqa.org/en/latest/) - reports errors related to PEP8 violations.
- [McCabe](https://github.com/pycqa/mccabe) (disabled by default) - offers warnings if functions are overly complex.

Another advantage of Flake8 that has made it popular is its extensive catalog of plugins and extensions that can be installed and used to extend its basic functionality.

For a comprehensive list of extensions, visit [Awesome Flake8 Extensions](https://github.com/DmytroLitvinov/awesome-flake8-extensions).

Some useful extensions include:

- [flake8-builtins](https://github.com/gforcada/flake8-builtins) - ensures you don't use Python built-ins as variables or parameters.
- [flake8-bugbear](https://github.com/PyCQA/flake8-bugbear) - additional checks (some opinionated) that flag issues like using `except:` instead of `except Exception:`, using `++n`, using `.strip()` on multiline strings, and more.
- [flake8-comprehensions](https://github.com/adamchainz/flake8-comprehensions) - helps improve list/set/dictionary comprehensions.
- [flake8-docstrings](https://pypi.org/project/flake8-docstrings/) - enforces PEP257.
- [flake8-eradicate](https://github.com/wemake-services/flake8-eradicate) - reports commented-out code (dead code).
- [flake8-isort](https://pypi.org/project/flake8-isort/) - checks if your import statements are sorted according to the isort recommendations.
- [flake8-broken-line](https://github.com/wemake-services/flake8-broken-line) - flags the use of backslashes for line breaks (encourages using parentheses or triple quotes instead).
- [flake8-quotes](https://github.com/zheller/flake8-quotes) - enforces single or double quotes according to your preference.
- [flake8-rst-docstrings](https://github.com/peterjc/flake8-rst-docstrings) - checks for problems in your documentation (useful if you're using Sphinx).
- [flake8-mutable](https://github.com/ebeweber/flake8-mutable) - checks that you don't use mutable default arguments.
- flake8-bandit - integrates Bandit capabilities into Flake8.

To install Flake8:

```bash
pip install flake8

# It's better to use pipx
pipx install flake8

# Install extensions
pip install flake8-docstrings flake8-isort
# Even better with pipx
pipx inject flake8 flake8-docstrings flake8-isort flake8-bandit

# If you encounter a path error, run
pipx ensurepath
# Restart your terminal
```

To run Flake8:

```bash
flake8 my_project  # my_project = project folder
```

For effective use of Flake8, it's advisable to integrate it into Visual Studio Code by selecting the appropriate linter using the "Python: Select Linter" command.

For larger projects and advanced Flake8 configurations with all its plugins, you can also use the excellent library FlakeHell, which allows you to define a `pyproject.toml` file (similar to Poetry) and customize settings within it.

**Note**: FlakeHell has not been updated since 2019 (it's archived on GitHub), but it's stable and fully usable.

- [FlakeHell](https://github.com/life4/flakehell)
- [Example](https://dev.to/bowmanjd/using-flake8-and-pyproject-toml-with-flakehell-1cn1)

There are many other tools available for code checking and error reporting as you write code, such as pylint, pydocstyle, bandit, vulture, wemake-python-style guide, and prospector. However, it's recommended to use Flake8 and Black in your projects and include Bandit for security checks.

---

## Bandit

Bandit is a tool for finding common security issues within Python code.

When used out of the box, it may produce some false positives without proper configuration. Spending some time configuring it for your projects can provide valuable information about:

- Unsafe module usage.
- Potential SQL injection vulnerabilities.
- Silent exception handling.
- And more.

It's a useful tool, especially for beginners, to review their code for security issues.

To use Bandit, it's recommended to install the Flake8 extension `flake8-bandit` so you can integrate Bandit directly into your project without having to install and use Bandit separately.

---

## Ruff
