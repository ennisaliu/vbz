-- aufgabe 11
SELECT DISTINCT
    h.GPS_Latitude AS lat,
    h.GPS_Longitude AS lng,
    h2.halt_kurz AS name,
    a.datumzeit_ist_an AS note
FROM
    vbzdat.haltepunkt h
INNER JOIN vbzdat.haltestelle h2 ON
    h.halt_id = h2.halt_id
JOIN vbzdat.ankunftszeiten a

WHERE
    a.fahrt_id = 1480 AND DATE(a.datumzeit_ist_an) LIKE '2020-01-02'
ORDER BY a.datumzeit_ist_an;