SELECT
 fsi.linie,
 fsi.richtung,
 fsi.fahrzeug,
 fsi.kurs,
 fsi.seq_von,
 fsi.halt_id_von,
 fsi.halt_id_nach,
 fsi.halt_punkt_id_von,
 fsi.halt_punkt_id_nach,
 fsi.fahrt_id,
 fsi.fahrweg_id,
 fsi.fw_no,
 fsi.fw_typ,
 fsi.fw_kurz,
 fsi.fw_lang,
 fsi.betriebs_datum,
 fsi.datumzeit_soll_an_von,
 fsi.datumzeit_ist_an_von,
 fsi.datumzeit_soll_ab_von,
 fsi.datumzeit_ist_ab_von,
 fsi.datum__nach,
 TIMEDIFF (datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an,
 TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an_seconds,
 TIMEDIFF (datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab,
 TIMESTAMPDIFF (SECOND, datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab_seconds,
 TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_soll_ab_von) as halt_soll_time_seconds,
 TIMESTAMPDIFF (SECOND, datumzeit_ist_an_von, datumzeit_ist_ab_von) as halt_ist_time_seconds
FROM
 fahrzeiten_soll_ist fsi
WHERE linie = 2 AND fahrt_id = 1534 AND datum_nach = '29.12.19'
ORDER BY datumzeit_soll_an_von ASC
LIMIT 40000;