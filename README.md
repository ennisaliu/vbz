# vbz
Datenbank-Prüfung VBZ

## Aufgabe 6 - Entity Relation Diagram

![](https://github.com/ennisaliu/vbz/blob/master/Screenshots/ERM.png)  

## Aufgabe 7 - Abfrage über Zeitdifferenzen 
```sql
SELECT
 linie,
 richtung,
 fahrzeug,
 kurs,
 seq_von,
 halt_id_von,
 halt_id_nach,
 halt_punkt_id_von,
 halt_punkt_id_nach,
 fahrt_id,
 fahrweg_id,
 fw_no,
 fw_typ,
 fw_kurz,
 fw_lang,
 betriebs_datum,
 datumzeit_soll_an_von,
 datumzeit_ist_an_von,
 datumzeit_soll_ab_von,
 datumzeit_ist_ab_von, 
 datum__nach,
 TIMEDIFF (datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an,
 TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an_seconds,
 TIMEDIFF (datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab,
 TIMESTAMPDIFF (SECOND, datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab_seconds,
 TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_soll_ab_von) as halt_soll_time_seconds,
 TIMESTAMPDIFF (SECOND, datumzeit_ist_an_von, datumzeit_ist_ab_von) as halt_ist_time_seconds
FROM
 fahrzeiten_soll_ist
WHERE linie = 2 AND fahrt_id = 1534 AND datum_nach = '29.12.19'
ORDER BY datumzeit_soll_an_von ASC
LIMIT 40000;
```

![](https://github.com/ennisaliu/vbz/blob/master/Screenshots/a7_fahrwegdatum.JPG)  

## Aufgabe 8 - Linien Tabelle
### Aufgabe 8a - Linien-Abfrage
```sql
SELECT DISTINCT
	linie,
    richtung,
    fw_no,
    fw_lang
FROM
    vbzdat.fahrzeiten_soll_ist
WHERE linie = 2
ORDER BY richtung;
```
![](https://github.com/ennisaliu/vbz/blob/master/Screenshots/a8a_linienabfrage.JPG)  

### Aufgabe 8b - Erstellen einer View
```sql
CREATE VIEW query_line AS
SELECT DISTINCT
	linie,
    richtung,
    fw_no,
    fw_lang
FROM
    vbzdat.fahrzeiten_soll_ist
WHERE linie = 2
ORDER BY richtung;
```
![](https://github.com/ennisaliu/vbz/blob/master/Screenshots/a8b_view.JPG)  

### Aufgabe 8c - Neue Tabelle Linie mit Hilfe einer Abfrage
```sql
CREATE TABLE linie (PRIMARY KEY (fahrweg_id)) AS
SELECT DISTINCT
	linie,
    richtung,
    fw_no,
    fw_lang
    fahrweg_id
FROM
    vbzdat.fahrzeiten_soll_ist
WHERE linie = 2;
```
![](https://github.com/ennisaliu/vbz/blob/master/Screenshots/a8c_create_line_table.JPG)

## Aufgabe 9 - Ankunftszeiten Tabelle

## Aufgabe 10 - Verspätungsliste pro Linie

Query zur Ermittlung der 20 grössten Verspätungen
```sql
SELECT
    fsi.id,
    fsi.halt_punkt_id_von AS haltepunkt_id,
    h2.halt_lang,
    h.GPS_Latitude,
    h.GPS_Longitude,
    fsi.fahrweg_id,
    fsi.linie,
    fsi.datumzeit_ist_an_von AS datumzeit_ist_an, 
    fsi.datumzeit_soll_an_von AS datumzeit_soll_an,
    timestampdiff(SECOND, datumzeit_soll_an_von, datumzeit_ist_an_von) AS delay
FROM
    vbzdat.fahrzeiten_soll_ist fsi
INNER JOIN vbzdat.haltepunkt h ON
    fsi.halt_punkt_id_von = h.halt_punkt_id
INNER JOIN vbzdat.haltestelle h2 ON
    h.halt_id = h2.halt_id
WHERE linie = 2
GROUP BY halt_lang
ORDER BY delay DESC
LIMIT 20;
```

![](https://github.com/ennisaliu/vbz/blob/master/Screenshots/a10_20_groesste_verspaetungen.JPG)

## Aufgabe 11 - Verspätungsliste pro Linie

CSV Export mit 20 grössten Verspätungen

|           |          |                                 |       |      | 
|-----------|----------|---------------------------------|-------|------| 
| lat       | lng      | name                            | color | note | 
| 47.389226 | 8.482644 | Zuerich Bachmattstrasse         |       | 528  | 
| 47.369628 | 8.538333 | Zuerich Paradeplatz             |       | 464  | 
| 47.37584  | 8.537164 | Zuerich Löwenplatz              |       | 439  | 
| 47.376032 | 8.533937 | Zuerich Sihlpost / HB           |       | 436  | 
| 47.377351 | 8.538997 | Zuerich Bahnhofplatz/HB         |       | 431  | 
| 47.376804 | 8.543541 | Zuerich Central                 |       | 423  | 
| 47.372998 | 8.547287 | Zuerich Neumarkt                |       | 413  | 
| 47.370783 | 8.548606 | Zuerich Kunsthaus               |       | 404  | 
| 47.369289 | 8.555262 | Zuerich Hottingerplatz          |       | 323  | 
| 47.366504 | 8.557666 | Zuerich Englischviertelstrasse  |       | 279  | 
| 47.368125 | 8.560242 | Zuerich Römerhof                |       | 270  | 
| 47.364783 | 8.554241 | Zuerich Kreuzplatz              |       | 269  | 
| 47.355101 | 8.557004 | Zuerich Fröhlichstrasse         |       | 66   | 
| 47.357825 | 8.554345 | Zuerich Höschgasse              |       | 47   | 
| 47.374207 | 8.525279 | Zuerich Bezirksgebäude          |       | 34   | 
| 47.353376 | 8.558699 | Zuerich Wildbachstrasse         |       | 28   | 
| 47.387938 | 8.485811 | Zuerich Lindenplatz             |       | 27   | 
| 47.374659 | 8.520793 | Zuerich Kalkbareite/Bhf.Wiedikon|       | 27   | 
| 47.385258 | 8.494672 | Zuerich Kappeli                 |       | 25   | 
| 47.391377 | 8.478527 | Zuerich Farbhof                 |       | 24   | 
 
20 grösste Verspätungen Visualisierung in maps.co
![](https://github.com/ennisaliu/vbz/blob/master/Screenshots/a11_linie_mit_einer_fahrt.JPG)

CSV Export mit Linie einer Fahrt

| lat       | long     | name                            | color | delay |
|-----------|----------|---------------------------------|-------|-------|
| 47.374659 | 8.520793 | Zuerich Kalkbreite/Bhf.Wiedikon |       | -3    |
| 47.375541 | 8.517236 | Zuerich Lochergut               |       | -9    |
| 47.376841 | 8.513689 | Zuerich Zypressenstrasse        |       | -17   |
| 47.378388 | 8.510096 | Zuerich Albisriederplatz        |       | -19   |
| 47.381336 | 8.50352  | Zuerich Letzigrund              |       | -21   |
| 47.383281 | 8.499414 | Zuerich Freihofstrasse          |       | -24   |
| 47.385258 | 8.494672 | Zuerich Kappeli                 |       | -16   |
| 47.387075 | 8.489728 | Zuerich Grimselstrasse          |       | -20   |
| 47.387938 | 8.485811 | Zuerich Lindenplatz             |       | -21   |
| 47.389226 | 8.482644 | Zuerich Bachmattstrasse         |       | -24   |
| 47.391377 | 8.478527 | Zuerich Farbhof                 |       | -26   |
| 47.393133 | 8.474336 | Zuerich Micafil                 |       | -24   |
| 47.396117 | 8.466472 | Schlieren Muelligen             |       | -22   |
| 47.397803 | 8.45996  | Schlieren Gasometerbruecke      |       | -20   |
| 47.398558 | 8.453973 | Schlieren Wagonsfabrik          |       | -18   |
| 47.397915 | 8.448265 | Schlieren Zentrum/Bahnhof       |       | -19   |
| 47.374659 | 8.520793 | ZuerichKalkbreite/Bhf.Wiedikon  |       | 6     |
| 47.375541 | 8.517236 | Zuerich Lochergut               |       | -11   |
| 47.376841 | 8.513689 | Zuerich Zypressenstrasse        |       | -12   |
| 47.378388 | 8.510096 | Zuerich Albisriederplatz        |       | 28    |
| 47.381336 | 8.50352  | Zuerich Letzigrund              |       | 20    |
| 47.383281 | 8.499414 | Zuerich Freihofstrasse          |       | 24    |
| 47.385258 | 8.494672 | Zuerich Kappeli                 |       | 34    |
| 47.387075 | 8.489728 | Zuerich Grimselstrasse          |       | 33    |
| 47.387938 | 8.485811 | Zuerich Lindenplatz             |       | 29    |
| 47.389226 | 8.482644 | Zuerich Bachmattstrasse         |       | 20    |
| 47.391377 | 8.478527 | Zuerich Farbhof                 |       | 14    |
| 47.393133 | 8.474336 | Zuerich Micafil                 |       | 14    |
| 47.396117 | 8.466472 | Schlieren Muelligen             |       | 9     |
| 47.397803 | 8.45996  | Schlieren Gasometerbruecke      |       | 11    |
| 47.398558 | 8.453973 | Schlieren Wagonsfabrik          |       | 9     |
| 47.397915 | 8.448265 | Schlieren Zentrum/Bahnhof       |       | 18    |
| 47.374659 | 8.520793 | ZuerichKalkbreite/Bhf.Wiedikon  |       | 42    |
| 47.375541 | 8.517236 | Zuerich Lochergut               |       | 59    |
| 47.376841 | 8.513689 | Zuerich Zypressenstrasse        |       | 47    |
| 47.378388 | 8.510096 | Zuerich Albisriederplatz        |       | 44    |
| 47.381336 | 8.50352  | Zuerich Letzigrund              |       | 25    |
| 47.383281 | 8.499414 | Zuerich Freihofstrasse          |       | 23    |
| 47.385258 | 8.494672 | Zuerich Kappeli                 |       | 21    |
| 47.387075 | 8.489728 | Zuerich Grimselstrasse          |       | 16    |
| 47.387938 | 8.485811 | Zuerich Lindenplatz             |       | 6     |
| 47.389226 | 8.482644 | Zuerich Bachmattstrasse         |       | -2    |
| 47.391377 | 8.478527 | Zuerich Farbhof                 |       | -12   |
| 47.393133 | 8.474336 | Zuerich Micafil                 |       | -11   |
| 47.396117 | 8.466472 | Schlieren Muelligen             |       | -26   |
| 47.397803 | 8.45996  | Schlieren Gasometerbruecke      |       | -32   |
| 47.398558 | 8.453973 | Schlieren Wagonsfabrik          |       | -41   |
| 47.397915 | 8.448265 | Schlieren Zentrum/Bahnhof       |       | -44   |


Linie mit einer Fahrt Visualisierung in maps.co

![](https://github.com/ennisaliu/vbz/blob/master/Screenshots/a11_linie_mit_20_groesssten_verspeatungen.png.JPG)

##Aufgabe 12


