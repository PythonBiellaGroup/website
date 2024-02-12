---
title: MkDocs vs Sphinx
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
    - sphinx
---

Nel panorama delle librerie per generare documentazione automatica e siti statici non possiamo non citare [Sphinx](https://sphinx-rtd-theme.readthedocs.io/en/stable/) che forse ha rappresentato lo standard python fino a qualche anno fa.

Potete trovare già un riferimento a **sphinx** e alle sue caratteristiche all'interno di questo [articolo](../../learning/document_code/index.md)

In questa sezione confrontiamo invece in maniera schematica quali sono le caratteristiche di sphinx e mkdocs in modo da poter evidenziare i punti di forza di entrambi.

|                  | MkDocs                                     | Sphinx                                                                |
| --------------- | ------------------------------------------ | --------------------------------------------------------------------- |
| `Formati supportati`   | **Markdown**                               | **rST** ma con l'estensione myst-parser supporta il markdown        |
| `Startup`       | Facile con il comando `poetry run mkdocs .` | Semplice con il comando `sphinx-quickstart`                          |
| `Configurazione`| Utilizza un file yaml **mkdocs.yml**        | Utilizza un file python **conf.py**                                   |
| `Layout`        | Elegante ed accattivante, risulta anche ben navigabile | Risulta un po' retro. Iconico il tema Read the Docs       |
| `Build`         | Fornisce un server locale per provare interamente il sito. Comodo il comando `poetry run mkdocs serve` | Genera la build del sito ma é l'utente che lo deve poi provare nel suo browser. Questa operazione viene fatta con `make html` |
| `Estensioni`    | Sono tantissime ma non tutte vengono mantenute | Sono presenti molte estensioni ma la community é meno attiva rispetto a mkdocs |
| `Personalizzazione` | Possibilità infinite grazie all'integrazione dei css e ai temi disponibili | Decisamente meno personalizzabile                                |
| `Integrazione con terze parti` | Integrazione con Confluence con questa [estensione](https://github.com/pawelsikora/mkdocs-with-confluence) | Integrazione con Confluence con questa [estensione](https://sphinxcontrib-confluencebuilder.readthedocs.io/en/stable/) |