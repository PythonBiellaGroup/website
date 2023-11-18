---
title: Tipi
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Categorie, granularità, livelli e tipi di test

In generale, i test sono definiti dai requisiti.  Poiché esistono
requisiti funzionali e non funzionali, esistono anche tipi di test che
rientrano in una di queste categorie.

| Funzionale                | Non funzionale       |
|---------------------------|----------------------|
| Test unitari (o di unità) | Test di carico       |
| Test di integrazione      | Test della usability |
| Test di sistema           | Test di penetrazione |
| Test di accettazione      | Test di compliance   |
| [...][guru99:types]       | [...][guru99:types]  |

[guru99:types]: https://www.guru99.com/types-of-software-testing.html

Per quanto riguarda i test, consideriamo quattro livelli di test,
caratterizzati dalla granularità dei dettagli del sistema per cui vengono
sviluppati.

| Granularità | Livello di test         | Scopo di test                 |
|-------------|-------------------------|-------------------------------|
| ++++        | Testing di unità        | Componente individuale        |
| +++         | Testing di integrazione | Interazione dei componenti    |
| ++          | Testing di sitema       | Sistema interamente deployato |
| +           | Testing di accettazione | Criterio di accettazione      |

## La piramide dei test

Una linea guida popolare nel campo dei test è la piramide dei test, che
ha lo scopo di aiutare a porre la giusta attenzione sull'implementazione
dei vari tipi di test.

```console
           ____
          /    \               ⇧  più integrazione
         / test \              ⇧
        /  di UI \             ⇧  più lento
       /__________\            ⇧
      /            \           |
     /     test     \          |
    /   di servizio  \         |
   /__________________\        ⇩
  /                    \       ⇩  più veloce
 /     test unitari     \      ⇩
/________________________\     ⇩  più isolazione
```

I tre livelli corrispondono all'incirca ai livelli di test menzionato in
precedenza e, come regola generale, i tipi di test di tutti e tre i
livelli dovrebbero essere presenti nella suite di test del progetto,
mentre si dovrebbero avere più test di esecuzione rapida e meno test più
lenti.  Inoltre, si dovrebbero eseguire più spesso i test più vicini alla
base della piramide.

Seguendo questa linea guida, si dovrebbe ottenere una suite di test
sufficientemente veloce da evitare la frustrazione, ma che catturi tutti
i problemi del software per garantire un prodotto solido in ogni momento.

## Gestire il rischio

In sintesi, i vari tipi di test sono destinati a coprire diverse aree di
rischio.  Progetti diversi, e persino fasi di progetto, hanno esigenze
diverse, quindi è una buona idea cercare di capire qual è il rischio
attuale più grande e concentrarsi su quello.

Ad esempio, come agenzia di sviluppo il rischio maggiore potrebbe essere
quello di non riuscire a soddisfare i criteri di accettazione del cliente
(con il risultato di non essere pagati), quindi potrebbe essere una buona
idea dedicare i primi sforzi alla creazione di test di accettazione.  In
seguito, quando quest'area sarà sotto controllo, l'attenzione potrà
spostarsi sui test di integrazione e di unità.  Come sviluppatore di
librerie, la vostra preoccupazione principale potrebbe essere quella dei
test unitari fin dall'inizio.

Detto questo, se vogliamo un prodotto solido, non dobbiamo per forza
sostituire un tipo di test per un altro solo per guadagnare velocità.
Si potrebbe invece ottimizzare la strategia di *esecuzione* dei test,
ad esempio eseguendo i test più lunghi solo prima di pubblicare
effettivamente un rilascio, ma non su ogni singolo commit.

Scegli saggiamente il tuo focus e ottimizza strada facendo!
