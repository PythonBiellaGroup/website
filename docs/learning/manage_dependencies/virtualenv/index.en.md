# Virtualenv

PipEnv vs. virtualenv: [https://medium.com/@dakota.lillie/an-introduction-to-virtual-environments-in-python-ce16cda92853](https://medium.com/@dakota.lillie/an-introduction-to-virtual-environments-in-python-ce16cda92853)

Venv: [https://medium.com/@rahul3012_37725/a-very-basic-guide-to-python-virtual-environments-a53d1e191490](https://medium.com/@rahul3012_37725/a-very-basic-guide-to-python-virtual-environments-a53d1e191490)

```shell
# Install virtualenv
pip install virtualenv

# Before running the next command, make sure you're using conda and run:
conda activate development #the conda version you use must be >= the desired version

# Generate a new virtualenv at a specific path
virtualenv --python=3.6 <path_env_name>

#### UNIX (mac and Linux)
source <path_env_name>/bin/activate

#### Windows
<path_env_name>\scripts\activate

#### Visual Studio Code
# (install the Microsoft Python Extension and then click on "python" in the bottom tab)
# Windows
navigate to -> <path_env_name>\scripts\<python3.6>
# UNIX
navigate to -> <path_env_name>/bin/<python3.6>

# Warning: if you are using another Python version, change "python3.6" to your current version

# Then install the requirements.txt
pip install -r requirements.txt
```

Prevent conda from activating the default base environment by default: `conda config --set auto_activate_base false`

PEP 518: introduces the pyproject.toml file, which replaces almost everything.

Publish a package to PyPI (old school):

[https://www.youtube.com/watch?v=GIF3LaRqgXo&ab_channel=CodingTech](https://www.youtube.com/watch?v=GIF3LaRqgXo&ab_channel=CodingTech)

Use of PipEnv:

[https://hackersandslackers.com/pipenv-python-environment-management/](https://hackersandslackers.com/pipenv-python-environment-management/)

Differences between PipEnv, Pip, and Conda (DevOps Concepts):

[https://towardsdatascience.com/devops-for-data-science-making-your-python-project-reproducible-f55646e110fa](https://towardsdatascience.com/devops-for-data-science-making-your-python-project-reproducible-f55646e110fa)
