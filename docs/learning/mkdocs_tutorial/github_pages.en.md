---
title: GitHub Pages
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

There are various hosting services to consider when hosting a website. In this tutorial, we will show you how to publish and host a site on **GitHub Pages**.

## What is GitHub Pages

GitHub Pages is a free web hosting service provided by GitHub. It allows users to publish static websites directly from a GitHub repository.
Here are some features:

- Only static websites can be hosted.
- The hosting service is free.
- By default, a domain like https://username.github.io/my-project is set up, but you can configure a domain from another provider.

## Getting Started

1. Create your repository on GitHub.
2. After creating your repository, ensure that the repository is public to use GitHub Pages. For those with a GitHub Enterprise subscription, it's possible to keep the repository private.

    !!! note "tip"
    
        To check if the repository is public, go to **Settings > Danger Zone > Change repository visibility.**

3. To publish on GitHub Pages, we use GitHub Actions, which allows building CI/CD pipelines from a YAML configuration file. 
    
    !!! note "tip"
    
        Set this option in **Settings > Pages > Build and deployment > Source = GitHub Actions.**
