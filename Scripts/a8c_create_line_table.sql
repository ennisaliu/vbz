CREATE TABLE linie (PRIMARY KEY (fahrweg_id))
SELECT DISTINCT
	fsi.linie,
    fsi.richtung,
    fsi.fw_no,
    fsi.fw_lang,
    fsi.fahrweg_id
FROM
    vbzdat.fahrzeiten_soll_ist fsi;