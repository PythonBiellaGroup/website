# Pyenv-virtualenv

Pyenv provides an even more efficient tool for creating virtual environments through a plugin called **pyenv-virtualenv**:

```shell
# Create a virtual environment
pyenv virtualenv 3.7.4 my-project

# List all virtual environments
pyenv virtualenvs

# Activate a virtual environment
pyenv activate my-project

# Deactivate a virtual environment
pyenv deactivate
```

In addition to virtualenv and pyenv-virtualenv, there are other useful and interesting tools like:

- conda (which also introduces the conda package manager, but it can be invasive)
- virtualfish
- virtualenvwrapper
- pipenv (mentioned in many tutorials but less maintained with many open issues and controversies)
- pipx: for centralizing some dependencies
