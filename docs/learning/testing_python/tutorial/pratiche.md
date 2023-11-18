---
title: Buone pratiche per scrivere test di qualità
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Buone pratiche per scrivere test di qualità

Affinché i nostri test siano utili, è necessario che abbiano determinate
caratteristiche.

- **Veloce.** Nessuno sarà felice di eseguirli se impiegano secoli per
  essere eseguiti.  Dovreste volerli eseguire per ogni singola modifica.
- **Semplice.** Non vogliamo scrivere test per i nostri test, quindi
  dovrebbe essere facile individuare se un test è implementato
  correttamente o meno.
- **Focalizzato.** Se un test fallisce, deve essere chiaro cosa si è
  rotto esattamente. Non si vuole iniziare ad analizzare ciò che si deve
  correggere, soprattutto quando si ha fretta.
- **Deterministico.** Lo stesso test eseguito sullo stesso codice
  business deve dare di nuovo lo stesso risultato.  Nessuno vuole
  eseguire una suite di test che è imprevedibile o difettosa.

## Implementazione dei test

- Un singolo test dovrebbe fare una singola cosa.  Se vogliamo verificare
  3 aspetti del codice, scriviamo 3 test.
- È essenziale che il codice di test è leggibile e facile da capire.
  Quando torniamo ad aggiornare il codice di test, tutto dovrebbe essere
  autoesplicativo.
- Con i test unitari, bisogna testare solo il proprio codice.  Evitate di
  pilotare un browser Web, un database o un'API esterna con i test.
  Invece, è consigliabile ristrutturare il codice o scrivere un mock per
  isolare le dipendenze.

## Impostazione dei test

- Aggiungete strumenti di QA alla vostra suite di test, come i linters.
  Questi strumenti individuano errori di sintassi, code smells e altri
  problemi prima ancora che il codice di test li riveli.  È anche
  possibile eseguirli sul proprio codice di test.
- Fate girare i test in modo automatico.  Localmente, ad esempio
  configurati nell'IDE, e nella pipeline CI/CD, ogni volta che si
  apporta una modifica.
