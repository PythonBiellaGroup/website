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

## Gestione dei secrets

Spesso capita che all'interno dei nostri progetti dobbiamo utilizzare dei valori che non devono essere mostrati in chiaro perchè riservati.

In mkdocs é possibile inserire delle variabili di ambiente all'interno di mkdocs.yml e poi passare il vero valore dinamicamente per esempio tramite la pipeline di cicd.

Un esempio é l'estensione per google analytics fornita da mkdocs material:

``` { .yaml .copy }
analytics:
    provider: google
    property: !ENV GOOGLE_ANALYTICS_KEY
```

In questo caso abbiamo passato il valore **GOOGLE_ANALYTICS_KEY** tramite la github actions che si occupa del deploy del sito.
Come fare?

1. Nella vostra repo andate nella sezione **Settings** e poi in **Secrets and variables**
2. Nella sezione actions selezionate **New repository secret** e aggiungete il vostro secret
3. All' interno dello yaml di configurazione della github actions richiamate il valore del secret in questo modo:

``` { .yaml .copy }
- name: Build mkdocs website inside docker
  shell: bash
  run: make docs_build
  env:
    GOOGLE_ANALYTICS_KEY: $<double curly brackets> secrets.GOOGLE_ANALYTICS_KEY <double curly brackets>

```