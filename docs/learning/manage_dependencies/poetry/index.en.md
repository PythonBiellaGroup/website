# Poetry

## Overview

Poetry is a new way to manage Python projects that adapts to the most popular modern

languages and frameworks (similar to npm for Node.js or NuGet for .NET).

It's essentially a **package and dependency management tool** that allows you to manage packages, dependencies, Python versions, and introduces more advanced concepts.

The most important features introduced by Poetry include:

- Deterministic project and library management (agile)
- Easy build and packaging of projects with configurable commands
- Fast package publishing to PyPI
- Dependency tracking with a single command

It's a relatively new project with ongoing development, but the community is very active. It's already stable and safe for production use.

## How to Use Poetry

The heart of Poetry is the **pyproject.toml** file, which is created in your project directory during initialization. This file allows you to define all project characteristics and manage the entire project, similar to how you'd use a package.json in JavaScript.

Here's how to use Poetry in a new project:

```shell
# Initialize Poetry in a folder
poetry init

# Or create a new project
poetry new <app_name>

# Modify the pyproject.toml file inside your project as desired

# If you want to use a venv within the project folder, run:
poetry config virtualenvs.in-project true
# Without this setting, the venv will remain in the general Poetry folder

# Generate the .venv by compiling the pyproject.toml file
poetry shell

# Add new dependencies (to pyproject.toml)
poetry add pandas

# Install dependencies (those automatically added to pyproject.toml)
poetry install

# Run a script
poetry run <script>

# View the path of the venv for that project (as well as the list of libraries)
poetry show -v

# Exit a shell started by Poetry
exit
```

Note: On Windows, when you run `poetry shell` using PowerShell, it will automatically switch to CMD. This is a known issue, and there's a workaround to solve it:

[https://github.com/python-poetry/poetry/issues/2030](https://github.com/python-poetry/poetry/issues/2030)

How to use Poetry in an existing project, possibly with an existing **requirements.txt** file:

```shell
# Initialize Poetry in a directory
poetry init

# If you want to keep the .venv within the project folder, run:
poetry config virtualenvs.in-project true

## Import libraries from requirements.txt into Poetry
poetry add $(cat requirements.txt)

# If there's no requirements.txt, continue with the regular format
```

Generate a requirements.txt file from Poetry configuration:

```shell
# Create a requirements.txt file from Poetry configuration
poetry export -f requirements.txt --output requirements.txt
```

Here's an example of a pyproject.toml file:

```toml
[tool.poetry]
name = "poetry-tutorial-project"
version = "0.1.0"
description = "Simple Python project built with Poetry"
authors = ["Andrea Guzzo <andrea.guzzo92@gmail.com>"]
maintainers = ["Andrea Guzzo <andrea.guzzo92@gmail.com>"]
license = "MIT"
readme = "README.md"
homepage = "http://localhost:5000"
repository = "https://github.com/jeydi/"
documentation = "https://github.com/jeydi/"
keywords = [
        "Poetry",
        "Venv",
        "Virtual environments",
        "Packages",
        "Packaging"
]

[tool.poetry.dependencies]
python = "^3.7"
loguru = "*"
psutil = "*"
pandas = "*"
numpy = "*"
fastapi = "*"
typer = "^0.3.2"

[tool.poetry.dev-dependencies]
pytest = "^5.2"

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.core.masonry.api"

[tool.poetry.scripts]
run = "wsgi:main"

[tool.poetry.urls]
issues = "https://github.com/jeydi/"
```

**Note**:

For some libraries (e.g., pandas), you might encounter versioning issues with their dependencies. To address this, consider installing pip as a dependency and upgrading it to the latest version:

```shell
# Install pip
poetry add pip

# Alternatively, upgrade pip once the venv with Poetry is created
# Make sure to have the venv first
pip install --upgrade pip
```

This is a workaround to overcome long installation issues. Poetry is slower than virtualenv, but it's much safer and stricter, as it checks all dependencies for security.
