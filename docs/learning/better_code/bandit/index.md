# Bandit

Bandit è uno strumento per trovare problemi di sicurezza più comuni all’interno del codice Python.

Utilizzandolo così com’è però, senza un’adeguata configurazione, fornisce anche un po' di falsi positivi.

Spendendo un po' di tempo a configurarlo correttamente per i vostri progetti è possibile avere informazioni utili riguardo:

- utilizzo insicuro di alcuni moduli
- possibili SQL Injection
- se il codice ignora silenziosamente alcune eccezioni
- e molto altro

È un utilissimo strumento soprattutto per principianti per revisionare il proprio codice.

Per usare bandit il consiglio è quello di installare l’estensione di Flake8 `flake8-bandit` in modo da non dover installare e usare bandit separatamente, ma integrandolo direttamente nel vostro progetto.
