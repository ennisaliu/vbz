SELECT h.GPS_Latitude AS lat, h.GPS_Longitude AS lng, h2.halt_kurz AS name, '' AS color, fsi.fahrweg_id as note FROM vbzdat.haltepunkt h
LEFT JOIN vbzdat.haltestelle h2 ON
h.halt_id = h2.halt_id
INNER JOIN vbzdat.fahrzeiten_soll_ist fsi ON
    h.halt_punkt_id = fsi.halt_punkt_id_von
WHERE h.GPS_Latitude IS NOT NULL AND fsi.linie = 2 AND fsi.fahrweg_id = 122269
GROUP BY h2.halt_kurz
ORDER BY h2.halt_id DESC;