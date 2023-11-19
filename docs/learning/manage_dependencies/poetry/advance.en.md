# Advanced Poetry

Poetry is the most sophisticated dependency management system available for Python (in 2020).

It goes beyond simple dependency management, with features such as generating .lock files, allowing project scaffolding with many customization options, all available via the CLI.

## Installing Poetry and Including Installation

To install Poetry, it's important to refer to the official guide that describes the steps for various operating systems.

We intentionally don't provide the installation steps here because they often change with new updates and versions.

For reference, the official site is: [official documentation](https://python-poetry.org/docs/#installing-with-the-official-installer)

## Creating a Python Project Using Poetry

```bash
poetry new poetry-tutorial-project
```

The secret recipe for every project built with Poetry is the creation of a file called pyproject.toml. Inside this file, you can define everything that exists within the project: metadata, dependencies, libraries, scripts, and much more.

If you're familiar with Node.js, you can think of the pyproject.toml file as the package.json for your project.

## Composition of poetry (toml file)

Documentation: [https://python-poetry.org/docs/pyproject/](https://python-poetry.org/docs/pyproject/)

- [tool.poetry] = Simple informative metadata about the package you're developing (such as the package name, description, author, details, ...). Some settings are only useful if you plan to publish your package on PyPI.
- [tool.poetry.dependencies] = Allows you to define the dependencies of the application that are absolutely necessary to run your program. You can also set a specific version of the package you want to install (e.g., Flask = "1.0.0"). If you simply want to define the latest version, you can use "\*" instead. You can also specify the required Python version to run the project and your application.
- [tool.poetry.dev-dependencies] = Dev dependencies are all the libraries that developers need to build and program the project but shouldn't be deployed in production. These dependencies are not needed to run the application and won't be downloaded by default during application building.
- [build-system] = This section is rarely used; modify it only if you intend to update Poetry.
- [tool.poetry.scripts] = This is where you specify the entry points of the application, assigning a function within the necessary modules to launch the application. The example uses: run = "wsgi:main," which specifies that you want to create a "run" command that will look for a function called "main()" inside the "wsgi.py" file. With this setting, you can launch the application using the CLI by typing "poetry run."
- [tool.poetry.urls]: This setting is optional and can be used to insert useful links to resources, documentation, or other project-related information if you plan to release your package.

## Installing and Managing Dependencies

### poetry shell

The first time this command is run in your project directory, Poetry creates a Python virtual environment that will be forever associated with this project. Instead of creating a folder containing your dependency libraries (as virtualenv does), Poetry creates an environment at a global system path, thus separating the dependency source code from your project. Once this virtual environment is created, it can be reactivated at any time by simply running "poetry shell" in your project directory in the future. Try comparing the "python" output before and after activating your project's shell to see how Poetry manages virtual environments.

### poetry install

Installs the dependencies specified in pyproject.toml. The first time a project's dependencies are installed, a .lock file is created, which contains the actual version numbers of each package that has been installed (e.g., if Flask = "\*" led to downloading Flask version 1.0.0, the actual version number would be stored in .lock). If a .lock file is present, the version numbers in .lock always take precedence over those in pyproject.toml.

### poetry update

Imitates the functionality of "install," except that version numbers in .lock are NOT respected. If there are newer versions for packages in pyproject.toml, the newer versions will be installed, and .lock will be updated accordingly.

### poetry add [package-name]

A shortcut to add a dependency to pyproject.toml. The package is immediately installed after being added.

### poetry remove [package-name]

A command to remove a specific dependency from the project's list of defined dependencies in pyproject.toml.

### poetry export -f requirements.txt > requirements.txt

Exports the contents of the project's .lock file to requirements.txt. This is useful when handing over work to developers who still use requirements.txt for some reason.

You can also run the following command: **poetry export -f requirements.txt --output reqtest.txt --without-hashes** to export dependencies to a file with a different name (reqtest.txt) and without the hashes that encode the packages. This command can be useful if there are problems with the normal installation of requirements.txt.

### poetry env list --full-path

Displays the path and list of the environment.

## Configurations

### poetry config

"Config" refers to environment-level configuration, such as current virtual environment paths or environment variables. Passing the --list option will return the current configuration values of your environment.

### poetry check

Checks the pyproject.toml file for any errors.

### poetry show

Returns a breakdown of all packages currently installed in the project, including dependencies of dependencies.

## Running the Application

### poetry run [script-name]

Executes the script defined within the [tool.poetry.scripts] section of pyproject.toml.

### Building and Publishing the Package (Project)

### poetry build

Allows you to create a build of the source code and wheel archives.

### poetry publish

Publishes the output of the build to an external repository, such as PyPI.

## Poetry Getting Started

Now, let's see how to initialize Poetry in a new project:

```bash
## Initialize Poetry in a folder
poetry init

# Or create a new project (also creates a subfolder)
poetry new <app_name>

## Now you can modify the pyproject.toml file as you like

# If you want to create the .venv folder inside the project, do:
poetry config virtualenvs.in-project true

# Now you need to compile Poetry to create the venv
# And launch the shell with the defined venv
poetry shell

# If necessary, upgrade pip
python -m pip install --upgrade pip
# This may be necessary if there are issues with dependency installation

# Add a dependency and install it
poetry add pandas

# Add a development dependency and install it
poetry add -D flake8

# If you've defined libraries inside pyproject.toml
# You can install them by running this command
poetry install

# To run a file defined in pyproject.toml
poetry run <script>

# View the path of the virtual environment (venv) within or outside the project
# Also, view the list of installed libraries
poetry show -v

# You can always view the default Python version currently in use
which python

# To exit the Poetry shell and the created environment
exit

# Remove a virtual environment (venv) using Poetry
poetry env remove <

python>
```

## Adding Poetry to an Existing Project (with requirements.txt)

```bash
# Initialize Poetry inside a directory
poetry init

# Fill in the information in pyproject.toml

# If you want to use a virtual env inside the project, do:
poetry config virtualenvs.in-project true

## Import the requirements.txt (libraries) into Poetry
poetry add $(cat requirements.txt)
# It's not the cleanest method and may not work in all cases
```

Generating a requirements.txt file from Poetry:

```bash
poetry export -f requirements.txt > requirements.txt

# A more complete example
poetry export -f requirements.txt --output reqtest.txt --without-hashes
# Creates a different file, reqtest.txt, without library hashes (i.e., package signatures)
# This command can be useful if there are problems with the normal installation of requirements.txt
```

Please note that in some situations, you may need to upgrade pip to install certain libraries. To do this after creating and activating your virtual environment with Python, run:

```bash
# Upgrade pip
python -m pip install --upgrade pip
```

This may be necessary immediately after installing a library or when running "poetry install" or "poetry update" if you encounter errors.

ATTENTION: Do not name any file or module or your project with the same name as a library you plan to install using Poetry. This is bad practice and will confuse Poetry, giving you an AssertionError.

[https://github.com/python-poetry/poetry/issues/236](https://github.com/python-poetry/poetry/issues/236)

If you find yourself in a situation where you've created a module, folder, or file with the same name as a library, the advice is to rename the offending file or folder, delete your virtual environment, and then run "poetry install" again to install a clean version of the virtual environment.

## Poetry in VSCode

Poetry is not yet integrated into VSCode and the official Python extension, so to use it with VSCode, you need to configure it manually.

To allow the project to use the project's virtual environment, you need to define a file by inserting the path to the virtual environment created with Poetry:

- Run in the terminal: **poetry env list --full-path** and copy the path that refers to the Poetry virtual environment (venv).
- Inside the project, create a new folder called: **.vscode**.
- Inside the folder, create a file called: **settings.json**.
- Enter the following configuration in the file:

```json
{
  "python.pythonPath": "<path of the copied venv environment>"
}
```

- Restart VSCode, and automatically, when you open a .py file, it will use the Python version you created with Poetry.

Always remember to run **poetry shell** in the terminal to activate the environment.

Also, remember not to push the vscode configurations you just created to your remote Git repository to avoid overwriting your colleagues' configurations (add the .vscode folder to your **.gitignore** file).

Another Method:

Run the project from the terminal:

```bash
# Tell Poetry to generate the virtualenv locally
poetry config virtualenvs.in-project true --local
poetry config virtualenvs.create true --local
poetry config settings.virtualenvs.in-project true

# Then run
poetry install
```

This way, you generate a folder called "virtualenv" inside the project, and VSCode will recognize it as the default virtual environment to use instead of the global one.

To stop using .venv inside the project, you can do:

```bash
# Tell Poetry not to use .venv inside the proj folder
poetry config virtualenvs.in-project false --local
poetry config virtualenvs.create false --local
poetry config settings.virtualenvs.in-project false
```

## Install Poetry in the Project Folder

A very useful setting for Poetry (also with VSCode) is to tell Poetry to install the Python virtual environment with the respective libraries inside the project folder.

This is very convenient because, for example, with VSCode, you can simply add the following setting:

```bash
"python.pythonPath": "${workspaceFolder}/.venv/bin/python"
```

to automatically activate the virtual environment in your project.

Attention: Always remember to add **.venv** to your **.gitignore** file to avoid pushing the entire virtual environment to your repository!

The easiest way to do this is to run **poetry config virtualenvs.in-project true** from the terminal.

But if you want to activate it by default, you can add a **poetry.toml** file to the project folder like this:

```toml
[virtualenvs]
create = true
in-project = true
```

This way, every time you run **poetry install**, Poetry will automatically install the virtual environment in the project folder.

To view all possible

configurations installed on a repository, you can use the command:

```bash
# Visualize all the configurations
poetry config --list
```

To remove configurations, you can use:

```bash
poetry config --unset repo.foo
```

## An Example of pyproject.toml

Here's an example of a pyproject.toml file that you can use for your projects (with appropriate changes and customizations):

```toml
[tool.poetry]
name = "poetry-tutorial-project"
version = "0.1.0"
description = "Simple python project built with poetry"
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

## Updating Poetry

Updating Poetry to the latest stable version is easy:

```bash
# Update Poetry to the latest stable version
poetry self update

# Use this command if you want to install the Poetry preview
poetry self update --preview
```

---

## Uninstalling Poetry

You can uninstall and remove Poetry with these commands:

```bash
# Uninstall Poetry
python get-poetry.py --uninstall

# Another method (optional)
# Set the POETRY_UNINSTALL environment variable before executing the installer
POETRY_UNINSTALL=1 python get-poetry.py
```

---

## Enabling Bash or Zsh Completion

Poetry supports automatic completion from the terminal for various CLIs, such as bash, zsh, or fish.

To get more details on these features, you can run **poetry help completions**.

```bash
poetry completions bash > /etc/bash_completion.d/poetry.bash-completion

# For Bash (Homebrew)
poetry completions bash > $(brew --prefix)/etc/bash_completion.d/poetry.bash-completion

# For Zsh
poetry completions zsh > ~/.zfunc/_poetry

# For Oh-My-Zsh
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
```

You will need to restart your shell to see the changes.

Please note (some details):

For **zsh**, you must add the following line into your **~/.zshrc** profile before **compinit**:

```zsh
fpath+=~/.zfunc
```

For **Oh-My-Zsh**, you must then enable Poetry in your **~/.zshrc** plugins:

```zsh
plugins(
    poetry
    ...
)
```

---

## Using Tools with Poetry

With Poetry, you can also use some useful tools for linting, code checking, and testing, such as:

- black
- flake8
- mypy

## Integration with pytest

Poetry also supports integration with pytest and allows you to define arguments for tests. This can be especially useful for large and complex applications that require extensive test coverage.

## Deploying

How to use Poetry with Docker for deployment?

Here are some useful links:

- [https://medium.com/@harpalsahota/dockerizing-python-poetry-applications-1aa3acb76287](https://medium.com/@harpalsahota/dockerizing-python-poetry-applications-1aa3acb76287)
- Docker caching: [https://pythonspeed.com/articles/poetry-vs-docker-caching/](https://pythonspeed.com/articles/poetry-vs-docker-caching/)
- Production-ready Docker packaging for Python developers: [https://pythonspeed.com/docker/#articles-the-basics-of-docker-packaging](https://pythonspeed.com/docker/#articles-the-basics-of-docker-packaging)

Here's an example Dockerfile that you can use as a base for deployment (including production images):

Dockerfile

```dockerfile
FROM python:3.8

# Metadata
LABEL name="PBG Poetry Example"
LABEL maintainer="PBG"
LABEL version="0.1"

ARG YOUR_ENV="virtualenv"

ENV YOUR_ENV=${YOUR_ENV} \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.1.13 \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

# System dependencies:
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y libpq-dev gcc

# Install Poetry
RUN pip install "poetry==$POETRY_VERSION"

# Copy only requirements to cache them in the Docker layer
WORKDIR /app

# Copy all project files
COPY . .

# Install libraries
RUN poetry config virtualenvs.create false \
    && poetry install $(test "$YOUR_ENV" = production) --no-dev --no-interaction --no-ansi

# Set the launching script as executable
RUN chmod +x launch.sh

# Launch the script for cron
CMD ["bash", "launch.sh"]

# Launch the main Python script
# CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "core.app:app"]
```

## Standardizing Settings

With Poetry, you can standardize Poetry settings for a project in a file, avoiding the need for developers or a release pipeline to manually run commands to configure Poetry.

To do this, you can create a file called **poetry.toml** in the project. Here's an example file:

```toml
[virtualenvs]
in-project = true
create = true
```

These settings allow you to create a .venv inside the project without manually running the virtual environment creation command from the terminal. You can use this file to override all Poetry settings.

To see the list of settings you can include, refer to this documentation: [https://python-poetry.org/docs/configuration/](https://python-poetry.org/docs/configuration/)

## Documentation and Useful Links

Official Documentation: [https://python-poetry.org/docs/basic-usage/](https://python-poetry.org/docs/basic-usage/)

Build CLI Utilities with Poetry and Typer: [https://www.pluralsight.com/tech-blog/python-cli-utilities-with-poetry-and-typer/](https://www.pluralsight.com/tech-blog/python-cli-utilities-with-poetry-and-typer/)

Comparison with other libraries: [https://towardsdatascience.com/devops-for-data-science-making-your-python-project-reproducible-f55646e110fa](https://towardsdatascience.com/devops-for-data-science-making-your-python-project-reproducible-f55646e110fa)

Use Poetry in Production (with Docker): [https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker](https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker)

Data Science PRO with Poetry + Jupyter + VSCode: [https://medium.com/analytics-vidhya/setting-up-data-science-python-projects-with-vscode-poetry-jupyter-b96efeea24c8](https://medium.com/analytics-vidhya/setting-up-data-science-python-projects-with-vscode-poetry-jupyter-b96efeea24c8)

Poetry Configure Workspace:

[https://zhauniarovich.com/post/2020/2020-02-configuring-python-workspace-p2/](https://zhauniarovich.com/post/2020/2020-02-configuring-python-workspace-p2/)

To solve problems with psycopg2 and Python

[https://blog.vince.id/installing-psycopg2-on-macos](https://blog.vince.id/installing-psycopg2-on-macos)
