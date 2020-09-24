CREATE VIEW query_line AS
SELECT DISTINCT
	linie,
    richtung,
    fw_no,
    fw_lang
FROM
    vbzdat.fahrzeiten_soll_ist
WHERE linie = 2
ORDER BY richtung;