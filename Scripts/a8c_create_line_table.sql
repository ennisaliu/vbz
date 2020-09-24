CREATE TABLE linie (PRIMARY KEY (fahrweg_id)) AS
SELECT DISTINCT
	linie,
    richtung,
    fw_no,
    fw_lang
    fahrweg_id
FROM
    vbzdat.fahrzeiten_soll_ist
WHERE linie = 2;