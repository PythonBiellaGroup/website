---
title: Setup
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

## Installation

You can install MkDocs like any other Python library, but it is advisable to use a dependency manager such as PDM or Poetry.

```shell
poetry add mkdocs
```
In addition to the basic installation of MkDocs, you can use various templates that enhance the configuration and initial layout of MkDocs. The library we prefer and recommend is MkDocs Material, which is among the most widely used and appreciated. We will explore some of the features it provides in this tutorial.

```shell
poetry add mkdocs-material
```

With MkDocs, you have the option to enhance functionality with numerous interesting and highly useful extensions, providing a better user experience.

## Initialization

Once you have finished developing your code, you can run this command:

```shell
poetry mkdocs new .
```

The result of this instruction is the creation of:

- **docs folder**: In this folder, you can place all the Markdown files that will constitute the documentation.
- **mkdocs.yml**: It is the main configuration file of MkDocs where you set all the properties of the documentation site.

## mkdocs.yml

This file is the most important in MkDocs and provides all the information needed to create and customize the final site.

Here are some of the main sections:

| Section               | Attributes                                               | Description                                   | 
|-----------------------|----------------------------------------------------------|-----------------------------------------------|
| project information    | site_name, site_url, author, site_description             | Basic information for the site                |
| repo information       | repo_name, repo_url                                      | It is possible to link the repository to the site, allowing visitors to view the source code |
| nav                   | --                                                       | Defines the site's tree structure; it can be built on multiple levels |
| extra css              | extra_css                                                | It is possible to extend certain aspects of the site with custom CSS |
| theme                 | --                                                       | Properties of the chosen theme; in our case, mkdocs-material |
| markdown_extensions    | --                                                       | Here we can specify the properties of our Markdown that will determine the layout of individual pages within the site |
| plugins               | --                                                       | In this section, we specify all the plugins we have installed with the options required for each |
| extra                 | analytics, social, consent, alternate                    | In this section, we can specify additional functionalities for our site, including: linking to Google Analytics, social links in the footer of the site, consent to use cookies, and a switcher for multilingual sites |

## Run locally
After compiling the mkdocs.yml file and creating the Markdown files inside the docs folder, you can check the final result locally by running:

```shell
poetry run mkdocs serve
```

MkDocs will generate all artifacts in the **site** folder and make the site available at **http://127.0.0.1:8000/**.

