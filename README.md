# AAUScheduleFinder
AAUScheduleFinder vil hjælpe dig med at finde din kalender fra på moodle, men du kan gøre det før din studiesekratær har offentliggørt jeres semester moodle side.
Selve kalenderen vil ofte være tilgængelig ca 14 dag før semester start. 
Kalenderens tilstand vil variere meget alt efter hvor mange er dine kurser der er blevet skemalagt, men den kan hjælpe dig til en tidlig adgang til kalenderen.

## Brug
Eksekvering af programmet under linux:
```bash
./AAUScheduleFinder.sh
```
Du vil under kørslen af programmet blive bedt om at indtaste to ting.
1. Navnet på dit semester
2. Sidste kendte kalender id

Du skal bruge navnet for dit semester til at søge efter navnet kan fx være Dansk, Matematik, Software eller lignende. 
Det anbefales at du også skrive hvilket semester det er efter navnet, fx Dansk 6, Matematik 3, Software 4 eller lignende. 
Dette vil give et mere præcis svar og knap tå mange kalendre at kontrollere efterfølgende. 

Du skal bruge id'et på din sidste kalender for at gøre søgningen hurtigere. 
Du kan finde dit gamle kalender id din sidst kende kalender på moodle. 
```url
https://www.moodle.aau.dk/calmoodle/public/?sid=XXXX
```
Kender du ikke den sidste kalender kan du med fordel starte din søgning på id 5000. 

## Resultat
Efter du har startet søgningen vil programmet systematisk gå alle kalendre igennem i sin søgen efter din kalender. 
Efter et stykke tid vil programmet begynde at give dig de kalendre det har funder der matcher som fx:
```bash
Søgningen er nu igang, vi giver besked hvis vi finder noget!
Vi fandt en kalender på https://www.moodle.aau.dk/calmoodle/public/?sid=5375 der passer dine søgekriterier.
Vi forsætter søgningen i tilfælde at der er flere kalendre der passer
Vi fandt en kalender på https://www.moodle.aau.dk/calmoodle/public/?sid=5376 der passer dine søgekriterier.
Vi forsætter søgningen i tilfælde at der er flere kalendre der passer
Vi fandt en kalender på https://www.moodle.aau.dk/calmoodle/public/?sid=5377 der passer dine søgekriterier.
Vi forsætter søgningen i tilfælde at der er flere kalendre der passer
Vi fandt en kalender på https://www.moodle.aau.dk/calmoodle/public/?sid=5378 der passer dine søgekriterier.
Vi forsætter søgningen i tilfælde at der er flere kalendre der passer
Vi fandt en kalender på https://www.moodle.aau.dk/calmoodle/public/?sid=5559 der passer dine søgekriterier.
Vi forsætter søgningen i tilfælde at der er flere kalendre der passer
Vi fandt en kalender på https://www.moodle.aau.dk/calmoodle/public/?sid=5606 der passer dine søgekriterier.
Vi forsætter søgningen i tilfælde at der er flere kalendre der passer

```
