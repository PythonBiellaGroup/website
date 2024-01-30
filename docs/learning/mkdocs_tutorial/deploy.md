---
title: Deploy
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

Una volta che abbiamo completato il contenuto del nostro sito e abbiamo testato il suo funzionamento in locale dobbiamo renderlo visibile a tutti perchè sia consultabile.
Per fare ciò abbiamo diverse possibilità:

## GitHub Pages

1. Ospita il tuo progetto MkDocs su GitHub.
2. Usa il comando mkdocs gh-deploy per costruire la tua documentazione e caricarla sul ramo gh-pages del tuo repository GitHub.
3. La tua documentazione sarà automaticamente ospitata su GitHub Pages all'indirizzo https://username.github.io.repository

## Netlify

1. Collega il tuo progetto MkDocs a un repository su un servizio come GitHub.
2. Crea un account Netlify e crea un nuovo sito, collegandolo al tuo repository
3. Configura le impostazioni di compilazione in Netlify per eseguire il comando mkdocs build durante il processo di compilazione.
4. Netlify pubblicherà e ospiterà automaticamente il tuo sito MkDocs.

## Read the Docs

1. Se il tuo progetto è open source, puoi utilizzare Read the Docs per compilare e ospitare automaticamente la tua documentazione MkDocs.
2. Collega il repository del tuo progetto a Read the Docs e configura le impostazioni di compilazione.
3. Ogni volta che effettui modifiche nel tuo repository, Read the Docs compilerà automaticamente e aggiornerà la tua documentazione.

## Pubblicazione Manuale

1. Costruisci la tua documentazione MkDocs usando il comando mkdocs build.
2. Copia i file generati dalla directory site sul tuo server web.
3. Configura il tuo server web per servire i file statici. Ad esempio, se stai utilizzando Apache o Nginx, configura un virtual host per puntare alla directory della documentazione.

## Docker

1. Costruisci un'immagine Docker contenente la tua documentazione MkDocs.
2. Carica l'immagine Docker in un registro dei container come Docker Hub.
3. Distribuisci l'immagine Docker su una piattaforma di orchestrazione dei container come Kubernetes o Docker Swarm.