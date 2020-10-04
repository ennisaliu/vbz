SELECT h.gps_latitude, h.gps_longitude, h2.halt_lang
FROM vbzdat.haltepunkt h
INNER JOIN vbzdat.haltestelle h2 ON
h.halt_id = h2.halt_id
INNER JOIN vbz.datfahrzeiten_soll_ist fsi ON

WHERE h.halt_punkt_ist_aktiv = 'true' AND h.GPS_Longitude IS NOT NULL 
GROUP BY h2.halt_lang
ORDER BY
ABS(ABS(h.GPS_Latitude-47.37081) +
ABS(h.GPS_Longitude-8.53701)) ASC LIMIT 4;