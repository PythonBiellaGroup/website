---
title: MkDocs vs Sphinx
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
    - sphinx
---

In the landscape of libraries for generating automatic documentation and static sites, we cannot fail to mention [Sphinx](https://sphinx-rtd-theme.readthedocs.io/en/stable/), which perhaps represented the Python standard until a few years ago.

You can already find a reference to **Sphinx** and its features within this [article](../../learning/document_code/index.md).

In this section, instead, we will schematically compare the characteristics of Sphinx and MkDocs to highlight the strengths of both.

|                  | MkDocs                                     | Sphinx                                                                |
| --------------- | ------------------------------------------ | --------------------------------------------------------------------- |
| `Supported Formats`   | **Markdown**                               | **reStructuredText (rST)** but with the myst-parser extension supports Markdown        |
| `Startup`       | Easy with the command `poetry run mkdocs .` | Simple with the command `sphinx-quickstart`                          |
| `Configuration`| Utilizes a YAML file **mkdocs.yml**        | Utilizes a Python file **conf.py**                                   |
| `Layout`        | Elegant and appealing, also navigable     | Somewhat dated. The Read the Docs theme is iconic                     |
| `Build`         | Provides a local server to fully test the site. Convenient command `poetry run mkdocs serve` | Generates the site build but the user must then test it in their browser. This is done with `make html` |
| `Extensions`    | There are many but not all are maintained | There are many extensions but the community is less active compared to MkDocs |
| `Customization` | Infinite possibilities thanks to CSS integration and available themes | Decidedly less customizable                                |
| `Third-party Integration` | Integration with Confluence with this [extension](https://github.com/pawelsikora/mkdocs-with-confluence) | Integration with Confluence with this [extension](https://sphinxcontrib-confluencebuilder.readthedocs.io/en/stable/) |