SELECT h.GPS_Latitude, longitude, SQRT(
    POW(69.1 * (h.GPS_Latitude - [47.350614]), 2) +
    POW(69.1 * ([8.560933] - longitude) * COS(h.GPS_Latitude / 57.3), 2)) AS distance
FROM vbzdat.haltespunkt h HAVING distance < 4 ORDER BY distance;