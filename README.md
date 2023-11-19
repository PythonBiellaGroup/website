<a name="readme-top"></a>

<div align="center">

[![Contributors][contributors-shield]][contributors-url] [![Forks][forks-shield]][forks-url] [![Stargazers][stars-shield]][stars-url] [![Issues][issues-shield]][issues-url]

</div>
<div align="center">

  <h1 align="center">Python Biella Group: website</h1>
  <p align="center">
    <h3> Official community website</h3>
    <br />
    <a href="https://pythonbiellagroup.it"><strong> &#9889 Explore the website</strong></a>
    <br />
    <br />
    <a href="https://github.com/PythonBiellaGroup/website/issues">Report Bug</a>
    ·
    <a href="https://github.com/PythonBiellaGroup/website/pulls">Request Feature</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#intro">Intro</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#how-to-maintain">How to maintain</a></li>
    <li><a href="#other-informations-and-documentation">Other informations and documentation</a></li>
  </ol>
</details>

## Intro

<p align="left">
  <a href="https://github.com/PythonBiellaGroup/website/actions"><img
    src="https://github.com/PythonBiellaGroup/website/workflows/deploy-website/badge.svg?branch=main"
    alt="Build"
  /></a>

Official PythonBiellaGroup community website (WORK IN PROGRESS)

## Features

In the PBG website you can find:

1. Home page and information about the community
2. List of all the past meetups
3. A reference, information and guide about python and tools
4. A blog with all the news about Python and the community

## Roadmap

- [x] Multilingual support
- [x] Identify structure of the website sections
  - [x] Home
  - [x] Meetup (list of all meetup with video,keywords,contents) with tag
  - [x] Wiki and articles section
  - [x] Next events with calendar
  - [x] Supporters section
  - [x] Speakers section
- [x] Learning section
- [x] Quick feedback
- [x] Cookies request form
- [x] Migrate contents from old site
- [ ] Template folder for contents
- [ ] New home page
- [ ] New 404 page
- [ ] New CSS to improve design

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## How to maintain

### Requirements

1. Remember to install the requirements for mkdocs plugins using brew installer if you are on MacOS

```bash
# On MacOs
brew install pngquant
brew install optipng
```

or on Linux

```bash
# on Linux
sudo apt-get install pngquant optipng
```

If you are using different operating system, please search online how to do it, open an issue in the repository or send a message to PythonBiellaGroup telegram channel.

WARNING: this libraries are available only for Linux and MacOs. If you are using Windows, setup and use WSL2 or Docker.

1. If you want to test and maintain the project locally, first you need to require the `GITHUB TOKEN` and `GITHUB USERNAME`
   that we are using for the project.

Please ask in the telegram group about it if you want to develop and contribute to the project.

For the admin: you can find the credentials in the PBG `1Password` under the name: `Github`

When you have the credentials you have to create a `.env` file in the folder of the project with the following content (replacing `<token>` and `<user>` with the credentials you have received from the group):

```bash
GHCR_TOKEN=<token>
GHCR_USERNAME=<user>
```

This credentials are used to publish the website, use `mkdocs-material-insight` repository that we are using and sponsor, and to download the docker image from the registry.

1. Remember to install `poetry` because the python libraries and dependencies are managed with it.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Testing and developing

To launch the project locally you need to:

- Install the dependencies with poetry configuring the `mkdocs-material-insight` repository

```bash
source .env
poetry config http-basic.mkdocs ${GHCR_USERNAME} ${GHCR_TOKEN} && poetry install --with dev
```

With this instruction you are reading the .env file, configuring the repository and installing the dependencies with also the dev requirements.

- To launch the project you can use the `Makefile` with the command:

```bash
make docs_launch
```

- If you need to build the mkdocs artifacts to see the resources locally, you can use:

```bash
make docs_build
```

Please check the `Makefile` for more informations and commands.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Launching with docker

If you want to launch the website using `docker` and `nginx` you need to do few steps:

- Login to the docker registry to be able to download the base docker image we are using in the PythonBiellaGroup community that you can find [here](https://github.com/PythonBiellaGroup/Dockbase)

```bash
source .env | docker login ghcr.io -u $GHCR_USERNAME -p $GHCR_TOKEN
```

- Using the `Makefile` and `docker-compose` you can now launch directly the website, downloading the image, installing the libraries with poetry and passing the artefacts to a second stage container with nginx that it's service the website on the port `8044`

```bash
make docker_launch
```

Remember that in this step it's used the `.env` file to access to the github registry to use `mkdocs-material-insight` repository.

- After few seconds you are able to see the website to the address: `http://localhost:8044`

Remember at the end to logout from docker registry if you are not using it anymore:

```bash
docker logout ghcr.io
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Check before commit

Inside the repository we are using `pre-commit` to check the quality of the code.

Pre commit it's automatically installed and added inside the repository.

Before committing something launch the command to check the code quality:

```bash
# Precommit check launch with mkdocs
make check_project

# Precommit check launch with just
just check_project
```

If you are not launching this 2 commands before pushing something you risk to not pass pre-commit checks and you will have to commit again because automatically pre-commit will fix the problems in the repo.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Release a new version of the website

To publish the project you need to make a new `GITHUB RELEASE` going on the [webpage of the project](https://github.com/PythonBiellaGroup/website/releases).

Create a new release with a new tag, for example:

- Release name: Release 0.0.5
- Tag: 0.0.5

Remember to fill all the information of the new release in the description and then Release the new package.

Automatically the new pipeline will start.

Please remember to test before following the steps in [Building the project](#how-to-maintain)

Remember also that only the **admins** and **organizer** can make a new release.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Other informations and documentation

### General link and documentation

- [Multilanguage support on mkdocs](https://github.com/squidfunk/mkdocs-material/discussions/2346)
- [Good tutorial on multilanguage support](https://ultrabug.fr/Tech%20Blog/2021/2021-07-28-create-beautiful-and-localized-documentations-and-websites-using-mkdocs-github/)

### Examples

- [The blue book](https://lyz-code.github.io/blue-book/)
- [Ludwing website](https://ludwig.ai/latest/)
- [UP24 SDK](https://sdk.up42.com/)
- [AWS Copilot CLI](https://aws.github.io/copilot-cli/)
- [Ultrabug](https://github.com/ultrabug/ultrabug.fr)

### Mkdocs useful tutorials

- [Meta plugin mkdocs](https://squidfunk.github.io/mkdocs-material/reference/#built-in-meta-plugin)
- [Blog plugin mkdocs](https://squidfunk.github.io/mkdocs-material/setup/setting-up-a-blog/#configuration)
- [Use environmental variable in Mkdocs](https://www.mkdocs.org/user-guide/configuration/#environment-variables)
- [Mkdocs official blog post on how it's working](https://github.com/squidfunk/mkdocs-material/blob/master/docs/blog/posts/blog-support-just-landed.md)
- [Add comments to the blog posts](https://squidfunk.github.io/mkdocs-material/setup/adding-a-comment-system/)

### Interesting plugins

- [Mkdocs macros plugin](https://github.com/fralau/mkdocs_macros_plugin)
- [Mkdocs redirect](https://github.com/mkdocs/mkdocs-redirects)
- [Mdocks plus](http://bwmarrin.github.io/MkDocsPlus/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[contributors-shield]: https://img.shields.io/github/contributors/PythonBiellaGroup/website.svg?style=for-the-badge
[contributors-url]: https://github.com/PythonBiellaGroup/website/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/PythonBiellaGroup/website.svg?style=for-the-badge
[forks-url]: https://github.com/PythonBiellaGroup/website/forks
[stars-shield]: https://img.shields.io/github/stars/PythonBiellaGroup/website.svg?style=for-the-badge
[stars-url]: https://github.com/PythonBiellaGroup/website/stargazers
[issues-shield]: https://img.shields.io/github/issues/PythonBiellaGroup/website.svg?style=for-the-badge
[issues-url]: https://github.com/PythonBiellaGroup/website/issues
[contacts-shield]: https://img.shields.io/badge/linktree-39E09B?style=for-the-badge&logo=linktree&logoColor=white
[contacts-url]: https://info.pythonbiellagroup.it/
