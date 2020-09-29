CREATE TABLE ankunftszeiten AS
SELECT
    fsi.halt_punkt_id_nach,
    fsi.fahrweg_id,
    fsi.fahrt_id,
    fsi.datumzeit_ist_an_von,
    fsi.datumzeit_soll_an_von,
    fsi.datumzeit_soll_ab_von,
    timestampdiff(SECOND, datumzeit_soll_an_von, datumzeit_ist_an_von) AS delay
FROM
    vbzdat.fahrzeiten_soll_ist fsi
WHERE fsi.linie = 2 AND fsi.fahrt_id = '1482'
UNION
SELECT
    fsi.halt_punkt_id_nach,
    fsi.fahrweg_id,
    fsi.fahrt_id,
    fsi.datumzeit_ist_an_von,
    fsi.datumzeit_soll_an_von,
    fsi.datumzeit_soll_ab_von,
    timestampdiff(SECOND, datumzeit_soll_an_von, datumzeit_ist_an_von) AS delay
FROM
    vbzdat.fahrzeiten_soll_ist fsi
WHERE fsi.linie = 2 AND fsi.fahrt_id = '1482'
AND fsi.seq_von = 1
ORDER BY fahrt_id;

ALTER TABLE ankunftszeiten ADD id int PRIMARY KEY AUTO_INCREMENT FIRST;
