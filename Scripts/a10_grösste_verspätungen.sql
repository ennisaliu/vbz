SELECT a.id, a.haltepunkt_id, h2.halt_lang, h.GPS_Latitude, h.GPS_Longitude, a.fahrweg_id, l.linie, a.datumzeit_ist_an, a.datumzeit_soll_an, a.delay FROM vbzdat.haltepunkt h
LEFT JOIN (SELECT a.id, a.fahrweg_id, a.haltepunkt_id, a.datumzeit_ist_an, a.datumzeit_soll_an, MAX(delay) as delay
FROM vbzdat.ankunftszeiten a 
GROUP BY haltepunkt_id) a ON h.halt_punkt_id = haltepunkt_id 
LEFT JOIN vbzdat.haltestelle h2 ON
h.halt_id = h2.halt_id
LEFT JOIN vbzdat.linie l ON
a.fahrweg_id = l.fahrweg_id
ORDER BY delay DESC
LIMIT 20;