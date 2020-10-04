SELECT
    fsi.fahrt_id,
    fsi.datum__nach,
    fsi.linie,
    h2.halt_lang
FROM
    fahrzeiten_soll_ist fsi
INNER JOIN vbzdat.haltestelle h2
WHERE
    fsi.linie = 2;

