---
title: VSCode
disquis: PythonBiellaGroup
---

## Intro

A code editor is an essential tool for every programmer and the tool we spend most of our time with.

The choice of an editor for writing code is often a sensitive topic that can lead to many debates among programmers.

As you know, there are many editors available, and you are free to use the one you like the most. However, after several years of using Sublime Text and PyCharm, I strongly recommend using Visual Studio Code. (I won't open the parentheses for EMACS or Vim; otherwise, it's endless...)

---

## Why Visual Studio Code?

Visual Studio Code has become the most widely used and famous code editor in recent years. [2022 Stack Overflow Survey](https://survey.stackoverflow.co/2022#section-most-popular-technologies-integrated-development-environment)

Let's explore some advantages of using VS Code:

* It's open source.
* It can be used on any operating system (including web-based usage as a server).
* You can use it for any programming language.
* It's simple but highly performant.
* It's fast.
* It's extremely customizable with a vast number of extensions.
* It's widely used in various work environments.
* It's well-documented and has a large user base.
* You can do remote development.
* You can do live coding and pair programming remotely.
* Your extensions and settings can be synchronized across different devices.

These are some of my considerations. Of course, I don't have benchmarks compared to other editors on hand, but I invite you to try it out.

However, compared to PyCharm, there is a feature that I miss a lot during development, namely the ability to perform code refactoring very intelligently, as you can do in PyCharm. Unfortunately, the code refactoring phase in VS Code is often still very manual, and it lacks some of the necessary automation.

What I like most about VS Code is the right balance between productivity and ease of use, even for those who are just starting to write code.

---

## Recommended Extensions
Here's a list of extensions we recommend with their Visual Studio Store IDs:

* bookmarks: (alefragnani.bookmarks)
* code spell checker (streetsidesoftware.code-spell-checker)
* docker (ms-azuretools.vscode-docker)
* docs-markdown (docsmsft.docs-markdown)
* docs-preview (docsmsft.docs-preview)
* docs-yaml (docsmsft.docs-yaml)
* git graph (mhutchie.git-graph)
* git history (donjayamanne.githistory)
* git lens (eamodio.gitlens)
* indent-rainbow (oderwat.indent-rainbow)
* italian-code spell checker (streetsidesoftware.code-spell-checker-italian)
* jupyter (ms-toolsai.jupyter)
* jupyter keymap (ms-toolsai.jupyter-keymap)
* live-share (ms-vsliveshare.vsliveshare)
* markdown all in one (yzhang.markdown-all-in-one)
* material icon theme (pkief.material-icon-theme)
* postgreSQL (ms-ossdata.vscode-postgresql)
* pylance (ms-python.vscode-pylance)
* python (ms-python.python)
* python docstring generator (njpwerner.autodocstring)
* python indent (kevinrose.vsc-python-indent)
* rainbow brackets (2gua.rainbow-brackets)
* rainbow csv (mechatroner.rainbow-csv)
* remote development (bundle) (ms-vscode-remote.vscode-remote-extensionpack)
* render line endings (medo64.render-crlf)
* sqltools (mtxr.sqltools)
* swagger viewer (arjun.swagger-viewer)
* todo highlight (wayou.vscode-todo-highlight)
* todo tree (gruntfuggly.todo-tree)
* visual studio IntelliCode (visualstudioexptteam.vscodeintellicode)
* webhint (webhint.vscode-webhint)
* yaml (redhat.vscode-yaml)

On VS Code, there are also other useful configurations (which will be discussed in previous sections) such as:

* Automatic file saving
* Using flake8 as a linter
* Using black for automatic code formatting on save
* Using bandit for security checks
* Devcontainers
* Debugger configurations
* Virtual environment configurations
* Remote development configurations

---

## Installing a Linter

As we've seen, linters are your best friends for checking that everything is okay while writing code.

To select a linter, go to the commands (by pressing the **F1** key or **CTRL + SHIFT + P** or by going to ```View > Command Palette```) and type: ```> python: Select Linter```. Then select the linter you prefer (I recommend flake8).

---

## Using a Python Version

When you are inside a project and open a .py file, you will be asked to use a specific version of Python, which you can also view in the lower right corner of VS Code (of course, you need to install at least the Python extension first). By clicking on the text, you can select a specific version of Python.

You can also open the Command Palette (by pressing the **F1** key or **CTRL + SHIFT + P** or by going to ```View > Command Palette```) and type: ```> python: Select Interpreter``` to select the Python interpreter you prefer (e.g., your .venv inside the project folder).

Inside the project, you can also create a file: settings.json inside the .vscode folder to specify the path of your interpreter:

```
{
  "python.pythonPath": "/Users/jeydi/Progetti/mioprogetto/.venv/bin/python"
}
```

---

## Adding VS Code to the Terminal

A very interesting feature of Visual Studio Code is the addition of the ```code <file_or_folder>``` command in the terminal, which will open a VS Code window based on the file or folder you want to work on (for example, by doing ```code .```, you can open the current folder in VS Code).

To do this, open the Command Palette and run (searching for) the following command:

```shell
Shell command: Install ‘code’ command in the PATH
```

On Windows, you can enable this feature by checking ```Add to PATH``` during the VS Code installation.

---

## Using the Debugger

To use the debugger in VS Code and run various files, you can create a specific configuration of settings for each project that the debugger will use.

Furthermore, when you go to the debug section in VS Code, it provides a tool for generating a specific configuration based on the framework or feature you are trying to use through a template.

With this procedure, a **launch.json** file will be created inside the project directory, which may be hidden, named **.vscode**.

Here's an example of a configuration (with Flask and a single file):

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python: Current File",
      "type": "python",
      "request": "launch",
      "program": "${file}",
      "console": "integratedTerminal"
    },
    {
      "name": "Flask Backend",
      "type": "python",
      "request": "launch",
      "port": 8000,
     

 "host": "localhost",
      "program": "${workspaceFolder}/server.py",
      "console": "integratedTerminal",
      "env": {
        "API_ENDPOINT_PORT": "8000",
        "VERBOSITY": "debug",
        "PLANT": "demo"
      }
    }
  ]
}
```

---

## Testing

A hidden feature within VS Code, once you've installed the Python extension, is the ability to run tests through the Python interface.

To use this feature, open the Command Palette and run: ```Python: Configure Tests```. From the list of test frameworks that appear, select your preferred framework (e.g., pytest).