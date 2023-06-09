CREATE TABLE Cars
(
    CarModel VARCHAR(20) PRIMARY KEY UNIQUE,
    YearLaunched DATE,
    Price INT
);

INSERT INTO Cars VALUES('SUV','2019-01-01',150000);
INSERT INTO Cars VALUES('Tata','2018-11-11',300000);
INSERT INTO Cars VALUES('Fiet','2021-12-01',450000);
INSERT INTO Cars VALUES('Toyota','2020-08-09',100000);
INSERT INTO Cars VALUES('Scorpio','2022-09-09',120000);

SELECT COUNT(CarModel)
FROM Cars
GROUP BY YearLaunched
HAVING Price>200000;
