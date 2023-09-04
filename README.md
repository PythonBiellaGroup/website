# PythonBiellaGroup official website

Official PythonBiellaGroup community website (WORK IN PROGRESS)

[![deploy-website](https://github.com/PythonBiellaGroup/website/actions/workflows/deploy_website.yml/badge.svg?branch=main)](https://github.com/PythonBiellaGroup/website/actions/workflows/deploy_website.yml)

## Features

In the PBG website you can find:

1. Home page and information about the community
2. List of all the past meetups
3. A reference, information and guide about python and tools
4. A blog with all the news about Python and the community

### Next step

1. Supporto multilingua
2. Capire alberatura contenuti con nuove sezioni
   1. Home
   2. Meetup (elenco di tutti i meetup con video embedded, keywords, contenuti) in modo che siano
   facilmente ricercabili e utilizzabili. In ordine dal più nuovo al più vecchio.
   3. Risorse utili
   4. Learning
   5. About
      1. Now (what is happening right now in the Python Community)
      2. Contribuisci
      3. Contattaci (capire se su mkdocs si può fare un form per i contatti)
3. Inserire articoli del vecchio sito
4. Cartella template con esempi di contenuti che si possono inserire
5. Nuova home page
6. Nuova 404 page
7. Nuovo css con abbellimenti grafici

## How to maintain

### Requirements

1. Remember to install the requirements for mkdocs plugins using brew installer if you are on MacOS

```bash
# On macOss
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

### Testing and developing (launching the project)

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

### Release a new version of the website

To publish the project you need to make a new `GITHUB RELEASE` going on the [webpage of the project](https://github.com/PythonBiellaGroup/website/releases).

Create a new release with a new tag, for example:

- Release name: Release 0.0.5
- Tag: 0.0.5

Remember to fill all the information of the new release in the description and then Release the new package.

Automatically the new pipeline will start.

Please remember to test before following the steps in [Building the project](#how-to-maintain)

Remember also that only the **admins** and **organizer** can make a new release.

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
- 

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