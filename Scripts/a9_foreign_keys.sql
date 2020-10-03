ALTER TABLE vbzdat.ankunftszeiten ADD CONSTRAINT ankunftszeiten_FK FOREIGN KEY (fahrweg_id) REFERENCES vbzdat.linie(fahrweg_id);
ALTER TABLE vbzdat.ankunftszeiten ADD CONSTRAINT ankunftszeiten_FK_1 FOREIGN KEY (haltepukt_id) REFERENCES vbzdat.haltepunkt(halt_punkt_id);
