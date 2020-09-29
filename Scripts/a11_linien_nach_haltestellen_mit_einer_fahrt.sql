SELECT
    fsi.id,
    fsi.halt_punkt_id_von AS haltepunkt_id,
    fsi.fahrt_id,
    fsi.fw_lang,
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
WHERE linie = 2 AND fsi.fahrt_id = 1534
ORDER BY fsi.datumzeit_ist_an_von