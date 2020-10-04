SELECT * FROM vbzdat.haltepunkt h
INNER JOIN (SELECT haltepunkt_id, MAX(delay) as Verspätung
FROM vbzdat.ankunftszeiten a GROUP BY a.id ) a ON h.halt_punkt_id = haltepunkt_id 
ORDER BY Verspätung ASC;