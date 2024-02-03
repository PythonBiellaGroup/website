---
title: Deployment
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

Once we have completed the content of our site and tested its functionality locally, we need to make it visible to everyone for accessibility. To do this, we have several options:

## GitHub Pages

1. Host your MkDocs project on GitHub.
2. Use the `mkdocs gh-deploy` command to build your documentation and upload it to the `gh-pages` branch of your GitHub repository.
3. Your documentation will be automatically hosted on GitHub Pages at the address `https://username.github.io/repository`.

## Netlify

1. Connect your MkDocs project to a repository on a service like GitHub.
2. Create a Netlify account and a new site, linking it to your repository.
3. Configure the build settings in Netlify to run the `mkdocs build` command during the build process.
4. Netlify will automatically publish and host your MkDocs site.

## Read the Docs

1. If your project is open source, you can use Read the Docs to automatically build and host your MkDocs documentation.
2. Connect your project's repository to Read the Docs and configure the build settings.
3. Every time you make changes in your repository, Read the Docs will automatically build and update your documentation.

## Manual Deployment

1. Build your MkDocs documentation using the `mkdocs build` command.
2. Copy the generated files from the `site` directory to your web server.
3. Configure your web server to serve the static files. For example, if you are using Apache or Nginx, configure a virtual host to point to the documentation directory.

## Docker

1. Build a Docker image containing your MkDocs documentation.
2. Upload the Docker image to a container registry like Docker Hub.
3. Deploy the Docker image on a container orchestration platform such as Kubernetes or Docker Swarm.
