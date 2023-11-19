# Pipx

È vero che ogni progetto dovrebbe sempre avere le proprie dipendenze e vivere in maniera atomica e indipendente rispetto agli altri progetti.

Tuttavia ci sono alcune librerie che possono essere globali su tutta la macchina e su tutto il sistema.

Alcune di queste librerie sono quelle che servono per gestire la qualità del codice o lo stile, come ad esempio **black** o **flake8**

Ecco quindi che viene in soccorso **pipx** che consente di installare queste librerie globali e usarle globalmente su tutta la macchina.

[https://github.com/pipxproject/pipx](https://github.com/pipxproject/pipx)

Sostanzialmente quando volete installare delle librerie su tutta la macchina globalmente, invece di fare `pip install my_package` fate `pipx install my_package`

```bash
#Lista di tutti i pacchetti
pipx list

# rimuovere un pacchetto
pipx uninstall my_package

# Lanciare una liberia o un comando
pipx run black my_file

# Si può anche specificare una determinata versione del pacchetto
pipx run --spec black==18.3a1 black --version
```

Ogni volta che viene lanciato pipx run my_package quello che succede è che viene creato temporaneamente un virtualenvironment dentro al quale viene eseguito il comando per poi essere distrutto.

Su visual studio è importante fare questo settaggio se si vuole usare pipx (lo si fa una volta sola)

```bash
# Installare il pacchetto
pipx install flake8

# visualizzare dove viene installato il pacchetto
which flake8
<path>

# Copiare il path e dire a visual studio quale binario prendere
# Dentro al file settings.json (vedere come si fa a prendere) inserire
"python.linting.flake8Path": "/Users/YOUR_USERNAME/.local/bin/flake8"
```
