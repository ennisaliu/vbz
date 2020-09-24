SELECT
 linie,
 richtung,
 fahrzeug,
 kurs,
 seq_von,
 halt_id_von,
 halt_id_nach,
 halt_punkt_id_von,
 halt_punkt_id_nach,
 fahrt_id,
 fahrweg_id,
 fw_no,
 fw_typ,
 fw_kurz,
 fw_lang,
 betriebs_datum,
 datumzeit_soll_an_von,
 datumzeit_ist_an_von,
 datumzeit_soll_ab_von,
 datumzeit_ist_ab_von,
 datum_nach,
 TIMEDIFF (datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an,
 TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an_seconds,
 TIMEDIFF (datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab,
 TIMESTAMPDIFF (SECOND, datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab_seconds,
 TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_soll_ab_von) as halt_soll_time_seconds,
 TIMESTAMPDIFF (SECOND, datumzeit_ist_an_von, datumzeit_ist_ab_von) as halt_ist_time_seconds
FROM
 fahrzeiten_soll_ist
WHERE linie = 2 AND fahrt_id = 1534 AND datum_nach = '29.12.19'
ORDER BY datumzeit_soll_an_von ASC
LIMIT 40000;