---
title: Github Pages
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

Ci sono vari servizi di hosting che si possono valutare per ospitare un sito. In questo tutorial vi mostreremo come poter pubblicare e ospitare un sito su **Github Pages**.

## Cos'é Github Pages

GitHub Pages è un servizio di hosting web gratuito offerto da GitHub. Consente agli utenti di pubblicare siti web statici direttamente da una repository github.
Ecco alcune caratteristiche:

- Possono essere hostati solo siti web statici.
- Il servizio di hosting é gratuito
- Di default viene impostato un dominio del tipo https://username.github.io/my-project ma é possibile impostare un dominio di un altro provider.

## Primi passi

1. Creare la propria repository su Github
2. Dopo aver creato la propria repository é necessario assicurarsi che la repository sia pubblica per poter usufruire di Github Pages. Per chi possiede una sottoscrizione a github enterprise é possibile mantenere la repository privata.

    !!! note "tip"
    
        Per verificare che la repository sia pubblica andare su **Settings > Danger Zone > Change repository visibility.**

3. Per poter pubblicare su github Pages noi utilizziamo le github actions che permettono di costruire delle pipeline di CI/CD a partire da un file di configurazione YAML.

    !!! note "tip"
    
        Bisogna quindi impostare questa opzione in **Settings > Pages > Build and deployment > Source = Github Actions**