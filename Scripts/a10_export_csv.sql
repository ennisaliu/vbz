SELECT h.GPS_Latitude AS lat, h.GPS_Longitude AS lng, h2.halt_kurz AS name, '' AS color, a.delay AS note FROM vbzdat.haltepunkt h
LEFT JOIN (SELECT l.linie, a.id, a.fahrweg_id, a.haltepunkt_id, a.datumzeit_ist_an, a.datumzeit_soll_an, MAX(delay) as delay
FROM vbzdat.ankunftszeiten a 
LEFT JOIN vbzdat.linie l ON
    a.fahrweg_id = l.fahrweg_id
GROUP BY haltepunkt_id) a ON h.halt_punkt_id = haltepunkt_id 
LEFT JOIN vbzdat.haltestelle h2 ON
h.halt_id = h2.halt_id
LEFT JOIN vbzdat.linie l ON
a.fahrweg_id = l.fahrweg_id
ORDER BY delay DESC
LIMIT 20;