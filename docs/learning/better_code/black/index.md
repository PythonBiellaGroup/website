# Black

Black è un code formatter, prende i propri files e li formatta in accordo con PEP8 e PEP257 con alcune altre regole addizionali (ad esempio converte apostrofo singolo in apostrofo doppio).

Permette di essere configurato (ad esempio mettendo `--skip-string-**normalization` per preservare gli apostrofi singoli).

Black è uno strumento molto discusso e a volte molto aggressivo, ma usandolo in un team consente di uniformare la scrittura del codice rendendolo comune.

Installare e usare Black

```bash
#installare black
pip install black

#tuttavia è consigliato utilizzare pipx
pipx install black
```

Formattare un progetto

```bash
black my_project #my_project = folder di progetto
```

Inoltre è possibile impostare black su vscode in modo da configurare lo styling al salvataggio

Per farlo è necessario andare nelle impostazioni (settings) e modificare l’impostazione: format on save, in particolare:

```bash
python: formatting provider
```

Dai un'occhiata a questa guida per approfondire:

[https://marcobelo.medium.com/setting-up-python-black-on-visual-studio-code-5318eba4cd00](https://marcobelo.medium.com/setting-up-python-black-on-visual-studio-code-5318eba4cd00)
