# Pipx

While it's true that every project should have its own dependencies and live independently from others, there are some libraries that can be global across your entire system. These libraries are often related to code quality and style, such as **black** or **flake8**.

This is where **pipx** comes in. It allows you to install these libraries globally and use them across your entire machine.

[https://github.com/pipxproject/pipx](https://github.com/pipxproject/pipx)

Essentially, when you want to install a library globally on your machine, instead of using `pip install my_package`, you can use `pipx install my_package`.

Here are some commands for using pipx:

```shell
# List all installed packages
pipx list

# Remove a package
pipx uninstall my_package

# Run a library or command
pipx run black my_file

# You can also specify a specific version of the package
pipx run --spec black==18.3a1 black --version
```

Every time you run `pipx run my_package`, a temporary virtual environment is created, the command is executed within it, and then the virtual environment is destroyed.

In Visual Studio Code, it's important to configure this setting if you want to use pipx (do it once):

```shell
# Install the package
pipx install flake8

# View where the package is installed
which flake8
<path>

# Copy the path and tell Visual Studio Code which binary to use
# In the settings.json file (see how to access it), add
"python.linting.flake8Path": "/Users/YOUR_USERNAME/.local/bin/flake8"
```
