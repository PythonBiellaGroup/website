---
title: Setup a python project
disquis: PythonBiellaGroup
timetoread: true
---

# Project Structure

How should you structure a Python project?

This is, of course, a very common but at the same time very challenging question, and there is no one correct answer.

Python does not enforce the use of a specific structure, but there are some best practices to keep in mind and some considerations you can (and often should) make.

In Python, a **module** is a container that encapsulates all your functions or classes that you need to import from elsewhere to reuse what you've written.

When working with modules and other libraries or code, the most important thing is to pay attention to two errors within a project:

* **ModuleNotFoundError**: This occurs when the file (module) you're trying to import doesn't exist or is not accessible.
* **ImportError**: This happens when there are circular import errors.

An essential thing to know about Python is that when you import a module, Python will search for dependencies (the modules you want to import) in three places:

1. Installation and dependencies: This includes all default folders related to installed pip packages.
2. Some additional paths specified in the environment variable: **PYTHONPATH**
3. In the directory containing the scripts used to invoke the interpreter. In other words, if you run `python ~/module/scripts/server.py`, Python will search for modules to import inside `~/module/scripts/`.
4. If you launch an interactive session with Python (using the `python` or `ipython` command), it will use the directory where you are at the time of running the command.

An effective way to check the paths where Python will search for modules is to do the following:

```python
import sys
print(sys.path)
```

If you get a **ModuleNotFoundError**, the first thing to do is to try running the above command to check if it contains the directories you want to use and that should be there.

In that case, you need to work on the imports, on the **PYTHONPATH** to include your own directories, or try:

```python
sys.path.append("/module/scripts")  # It's a bit of a trick, but it might help resolve the issue.
```

---

## Relative and Absolute Imports

There are two (main) ways to import modules in Python:

* Absolute Imports: `from module.models.user import get_user`
* Relative Imports: `from ..models/user import get_user`

Both methods have their advantages and disadvantages, but I personally recommend using Absolute Imports because they are easier to read and use (making the code much cleaner and more maintainable).

Moreover, when you use relative imports, you might encounter this error:

```python
Value Error: attempted relative import beyond top-level package
```

This happens when you try to import something from a folder outside the project (from a parent folder outside the root).

There are different ways to fix this issue, but the advice is always the same: try to use Absolute Imports as much as possible.

**ATTENTION: NEVER USE * TO IMPORT FUNCTIONS OR MODULES.**

---

## Circular Imports

This is a significant problem in a project, and the error occurs when you try to import one module from another and vice versa (creating circular imports).

```python
# file_a.py
from file_b import hello_world

def hello():
    return "hello"

def first_program():
    return hello_world()
```

```python
# file_b.py
from file_a import hello

def hello_world():
    return hello() + " world"
```

When you run `python file_a.py`, you'll get the following error:

```python
Traceback (most recent call last):
  File "file_a.py", line 1, in <module>
    from file_b import hello_world
  File "/my_module/file_b.py", line 2, in <module>
    from file_a import hello
  File "/my_module/file_a.py", line 1, in <module>
    from file_b import hello_world
ImportError: cannot import name 'hello_world'
```

There are many ways to fix these circular import problems, but be careful when writing the code to avoid these issues in the first place.

---

## Templating - Cookiecutter

Returning to the original topic of structuring Python projects (and many other languages and frameworks), every project is different, but some projects share common elements.

For example, they often have a file with a list of dependencies and some tests. A web application needs a "main" file, or your team may need a structure to guide development to maintain consistency across different projects (or at least try to).

This is where scaffolding comes into play.

Scaffolding is a concept that comes from the construction industry. When you want to build, repair, or modify something, you need scaffolding around the project to assist you.

In computer science, this concept is similar: before building a project, you need a ready-made structure that allows you to proceed in an organized way during development.

This is where [Cookiecutter](https://github.com/cookiecutter/cookiecutter) comes in.

Cookiecutter is a tool that allows you to create a Python project from an existing template (similar versions exist in many other programming languages and editors).

Documentation: [https://cookiecutter.readthedocs.io/en/stable/](https://cookiecutter.readthedocs.io/en/stable/)

To use it:

1. Select a template to use for the project.
2. Run Cookiecutter with the project's address and answer some questions from the tool to customize the project's creation.
3. Cookiecutter scaffolding will generate the template for you.

Install Cookiecutter (it's best to use pipx to make it available globally):

```
pipx install cookiecutter
```

Here's a curated list of possible templates for your projects (you can find many more online):
[https://github.com/cookiecutter/cookiecutter#a-pantry-full-of-cookiecutters](https://github.com/cookiecutter/cookiecutter#a-pantry-full-of-cookiecutters)

Cookiecutter is a very useful tool, but you need to be careful about how you use it and which projects you use it for. It can often install and download many things you don't need or that are redundant.

The advice is to select projects that suit your needs based on the project you're thinking of using (small, medium, large). Or write templates for your own projects or organization to ensure everyone agrees on what you want to do.

```
# Clone a project with Cookiecutter
cookiecutter https://github.com/audreyr/cookiecutter-pypackage
```

### Bear - Our project with Cookiecutter
The PythonBiellaGroup community has created **Bear** (**B**ase **E**nvironment for **A**ny **R**easonable project), a project template based on Cookiecutter that allows you to initialize your projects while considering all the needs of a modern Python solution.

Find everything here 👇

[https://github.com/PythonBiellaGroup/Bear](https://github.com/PythonBiellaGroup/Bear)