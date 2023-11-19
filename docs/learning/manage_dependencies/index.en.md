---
title: Manage dependencies in python
disquis: PythonBiellaGroup
timetoread: true
---

## Introduction

To manage dependencies in Python 3.3 and above, there is a built-in module called venv that allows you to create virtual environments within your project.

This is the "old way," but it still works:

```shell
python -m venv my-virtualenv
```

This command creates a directory named my-virtualenv, which contains:

- Python binary
- pip/easy_install/wheel binary
- Activation script
- Binary files used by Python

To activate a virtual environment, you can use the following commands:

```shell
# On Linux or Mac
source ./my-virtualenv/bin/activate

# On Windows
my-virtualenv\Scripts\activate.bat

# To deactivate the virtual environment
deactivate
```

Virtualenvs are very convenient and can be used in conjunction with **requirements.txt** files.

Certainly it is a simple, convenient method, but nevertheless there are more powerful and effective tools for managing your environment and overcoming some of the known problems of virtualenvs.

## Some problems of virtualenv

- Dependency management: Virtualenv does not have a built-in system for managing project dependencies. Usually pip is used in conjunction with a requirements.txt file, but this approach does not resolve version conflicts between dependencies.

- It does not handle development and production dependencies separately: There is no native way to distinguish between development and production dependencies.

- Does not handle project-level dependencies: Every time you create a new virtualenv, you have to reinstall all dependencies, even if they have already been installed in another virtualenv.

To overcome these problems, in addition to virtualenv and pyenv-virtualenv which are the default tools there are other very useful and interesting tools that extend, improve and enhance the use of virtual environments for library management.

- conda (which also introduces the conda package manager) which is very invasive
- virtualfish
- virtualenvwrapper
- pipenv: much mentioned in so many tutorials, but is really poorly maintained (last version is from 2018 with 300+ open issues) and can cause several problems in a project, as well as there are several [project-related controversies](https://github.com/pypa/pipenv/issues/4058)
- pipx: to centralize some dependencies
- poetry: very modern and mature tool that allows you to manage dependencies in a project very well, production ready and solves so many problems compared to the other tools listed above
- pdm: new modern tool, but still in beta
