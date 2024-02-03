---
title: Documentare il codice
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

Dopo aver visto le funzionalità base di Markdown, esploriamo assieme alcune funzionalità un po' più avanzate e comode che possono aiutare per svolgere diversi compiti e aggiungere diverse funzionalità come:

- Visualizzare video youtube
- Visualizzare e condividere jupyter notebooks
- Scrivere equazioni scientifiche

Questa versalità ed estensibilità di **mkdocs** consente di fare tantissime cose, oltre al nostro sito di PythonBiellaGroup che state vedendo ci sono tantissimi esempi di siti realizzati con mkdocs per fare diverse cose:

- condividere documentazione con altri colleghi di lavoro privatamente tramite internet
- creare siti web documentali
- blog personali
- siti di conferenze, eventi e piccole landing pages
- molto molto altro...

## Come inserire immagini

Per inserire le immagini si possono utilizzare le funzionalità classiche si `markdown`, ma consigliamo di prestare attenzione a dove le immagini vengono inserite all'interno del sito e come poi vengono richiamate in base al path scelto.

In particolare suggeriamo di creare una cartella: `docs/static/images` dove organizzare le immagini in sottocartelle.

Richiamabili poi dalla sintassi markdown:

```markdown
![Python env](../../static/images/articles/python-env.png)
```

In particolare si utilizza sempre la sintassi di **path relativo** in base a dove ti trovi nel file.

Questo consente al risolutore di mkdocs di creare il sito correttamente.

## Creare dei banner

È possibile creare all'interno delle pagine markdown dei banner sfruttando una particolare funzionalità markdown.

Potete trovare qui un esempio che utilizziamo anche nel nostro sito

```markdown
[![Github](https://img.shields.io/badge/GitHub-181717.svg?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/PythonBiellaGroup/MaterialeSerate/tree/master/ModernPythonDevelopment)
```

Per generare i banner potete anche utilizzare questo [utilissimo sito](https://leviarista.github.io/github-profile-header-generator/) che vi consente di creare dei banner personalizzati.

Alternativamente [questo altro sito](https://kapasia-dev-ed.my.site.com/Badges4Me/s/) consente di creare dei piccoli banner semplici come riferimento.

Siccome markdown consente anche si inserire codice html, potete anche utilizzare questo [tipo di banner](https://app.getguru.com/card/RcAndBGc/Custom-Banners-using-the-Markdown-Block-in-the-Guru-Editor)

## Visualizzare video youtube

Per inserire video youtube necessario fare degli iframe: la parte più difficile è sempre quella di trovare le dimensioni giuste affinchè il sito sia anche fruibile da mobile.

Questa funzionalità la possiamo sfruttare perchè è sempre possibile scrivere codice **html** all'interno di markdown.
Rendendo quindi markdown veramente estendibile e potente, anche se un po' più difficile da gestire.
**mkdocs** renderizzerà l'html nei markdown automaticamente nella pagina.

A tal proposito ci sentiamo di suggerire questa configurazione che usiamo anche sul nostro sito

```markdown
## Video del meetup

<iframe width="560" height="315" src="https://www.youtube.com/embed/tFVlX2FZeW0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
```

## Condividere jupyter notebooks

Su mkdocs è anche possibile condividere jupyter notebooks, ci sono due modi per farlo:

- rendere visualizzabile il jupyter notebook per intero utilizzando un plugin [mkdocs-jupyter](https://github.com/danielfrg/mkdocs-jupyter)
- esportare i notebooks con `nbconverter` in formato `html` o `pdf` e visualizzarli all'interno delle pagine, per fare questo vi rimandiamo alla sezione seguente [Condividere PDF](#condividere-pdf)

## Condividere PDF

Se vuoi trasformare un **jupyter notebook** in formato **pdf** puoi usare anche la funzionalità di **nbconvert**.

Per farlo puoi lanciare il seguente comando da terminale (attivando il virtualenv con jupyter installato)

```shell
@jupyter nbconvert --no-prompt --no-input --output-dir "./docs/notebooks" --to html notebooks/*.ipynb
```

Questo comando consente di convertire il notebook in pdf in una particolare cartella `docs/notebooks`.

Puoi anche eseguire questo comando tramite pipeline **ci/cd**.

Per ulteriori informazioni consulta la [guida ufficiale di nbconvert](https://nbconvert.readthedocs.io/en/latest/usage.html) perchè ha tantissime altre impostazioni e consente di fare tantissime altre trasformazioni anche in altri formati.

Una volta ottenuto il PDF puoi utilizzare le ufnzionalità di **html5** per visualizzare il PDF in un Iframe.

Si occuperà poi il browser di riferimento di gestire il tuo PDF aggiungendo diverse funzionalità.

Per farlo puoi usare il seguente codice:

```markdown

<a href="../../notebooks/example.pdf" class="image fit"><i class="fas fa-file-pdf">documentation-link</i></a>

<object data="../../notebooks/example.pdf" type="application/pdf">
    <embed src="../../notebooks/example.pdf" type="application/pdf" />
</object>

```

Con questo codice avrai a disposizione il notebook in formato **pdf** in pagina, ma anche un link clickabile per vedere il notebook a tutto schermo in una nuova pagina.

Consigliamo anche di usare un **custom css** in modo da gestire le dimensioni dell'iframe correttamente.

Per farlo è possibile creare una nuova cartella e un nuovo file: `style/custom.css` con all'interno il seguente contenuto:

```css
iframe {
    position: relative;
    width: 80%;
    height: 100vh;
    border: none;
}
object {
    position: relative;
    width: 100%;
    height: 100vh;
    border: none;
}

```

Per attivare il **css** dovrai poi aggiungere lo stile custom all'interno del file `mkdocs.yaml`.

```yaml
extra_css:
  - style/custom.css

```

## Scrivere equazioni scientifiche

## Utilizzare i tags

## Componenti neuteroi

**Neuteroi** è una libreria di componenti aggiuntivi per **mkdocs** che a noi ci è piaciuta tantissimo e che abbiamo utilizzato anche per il nostro sito di PythonBiellaGroup.

Questo è il [sito ufficiale con la descrizione](https://www.neoteroi.dev/mkdocs-plugins/)

Per poter utilizzare questi componenti è necessario installare la libreria sempre con poetry

`poetry add neoteroi-mkdocs`

Dopodichè è necessario aggiungere nel file `mkdocs.yaml` nelle estensioni markdown i vari componenti disponibili nella libreria, come ad esempio `cards` e `timeline`.

```yaml
markdown_extensions:
    - neoteroi.cards
    - neoteroi.timeline
```

In questo caso come puoi vedere non è necessario dare nessuna definizione nei plugins.

Per usare i componenti rimandiamo sul sito ufficiale, in generale sarà necessario **aprire il componente**, inserire il contenuto e poi **chiudere il componente**.

Qui un esempio con la timeline:

```markdown
::timeline::

- content: Un gruppo di amici, tra cui Mario e Davide C., inizia a trovarsi una volta alla settimana per capire come Python possa aiutare a risolvere problemi semplici come vincere al lotto
  sub_title: 09/2016
  title: Gli inizi
- content: Al gruppo di amici si unisce al team di Maria Teresa, una delle fondatrici, per presentare Python ad un gruppo di ragazzi.   Arriva Andrea e nasce la community, con l'obiettivo di condividere le proprie conoscenze.
  sub_title: 05/2018
  title: I primi incontri nella biblioteca di Biella
- content: A causa o grazie al Covid-19 e ad Internet, la voglia di condivisione si allarga, anche fuori da Biella, a tutti gli interessati. Ogni settimana organizziamo un meetup su Zoom per permettere a tutti di partecipare
  sub_title: 02/2020
  title: Meetup aperti a tutti


::/timeline::
```

Ovviamente rimandiamo al [sito ufficiale](https://www.neoteroi.dev/mkdocs-plugins/timeline/) per vedere esempi e differenti configurazioni

## Problemi riscontrati

A volte quando si hanno tanti plugin è difficile capire se qualcosa funziona o qualcosa va storto, ma soprattutto è difficile capire dove intervenire.
Consigliamo di fare delle piccole modifiche un po' per volta e non cambiare tante cose assieme quando si modifica il file `mkdocs.yaml`.

Alcuni plugin devono essere lanciati dopo altri: ad esempio il plugin di traduzione `i18n` deve andare prima del plugin di configurazione di `git`.

Spesso non è facile trovare i nomi corretti dei plugin, prestate attenzione :)

Alcuni plugin avanzati disponibili nella versione `mkdocs-material-insider` non sono compatibili con altri plugin standard, come ad esempio il sistema di traduzione.
