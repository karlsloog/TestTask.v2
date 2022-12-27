-- Create new database
CREATE DATABASE testtaskDB;

-- Create new table called 'patient'
CREATE TABLE patient (
    _id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    pn VARCHAR(11) DEFAULT NULL,
    first VARCHAR(15) DEFAULT NULL,
    last VARCHAR(25) DEFAULT NULL,
    dob DATE DEFAULT NULL,
    PRIMARY KEY (_id)
);

-- Create new table called 'insurance'
CREATE TABLE insurance (
    _id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    patient_id INT(10) UNSIGNED NOT NULL,
    iname VARCHAR(40) DEFAULT NULL,
    from_date DATE DEFAULT NULL,
    to_date DATE DEFAULT NULL,
    PRIMARY KEY (_id),
    FOREIGN KEY (patient_id) REFERENCES patient(_id)
);

-- Adding 5 patients record into patient table
INSERT INTO patient (pn, first, last, dob)
VALUES ('00000000001', 'Christine', 'Haas', str_to_date ('01-02-1965','%m-%d-%Y')), 
('00000000002', 'Michael', 'Thompson', str_to_date ('10-11-1973','%m-%d-%Y')), 
('00000000003', 'Sally', 'Kwan', str_to_date ('04-05-1975','%m-%d-%Y')), 
('00000000004', 'John', 'Geyer', str_to_date ('08-17-1949','%m-%d-%Y')), 
('00000000005', 'Irving', 'Stern', str_to_date ('09-14-1973','%m-%d-%Y'));

-- Adding 2 insurance records for each patient
INSERT INTO insurance (patient_id, iname, from_date, to_date)
VALUES (1, 'Medicare', str_to_date ('02-03-1961','%m-%d-%Y'), str_to_date ('02-03-1962','%m-%d-%Y')),
(1, 'Blue Cross', str_to_date ('02-03-1962','%m-%d-%Y'), str_to_date ('02-03-1963','%m-%d-%Y')),
(2, 'Mediafare', str_to_date ('10-11-1973','%m-%d-%Y'), str_to_date ('10-11-1974','%m-%d-%Y')),
(2, 'Blue fross', str_to_date ('10-11-1974','%m-%d-%Y'), str_to_date ('10-11-1975','%m-%d-%Y')),
(3, 'Mediamare', str_to_date ('04-05-1975','%m-%d-%Y'), str_to_date ('04-05-1976','%m-%d-%Y')),
(3, 'Blue gloss', str_to_date ('04-05-1976','%m-%d-%Y'), str_to_date ('04-05-1977','%m-%d-%Y')),
(4, 'MediaMedia', str_to_date ('08-17-1949','%m-%d-%Y'), str_to_date ('08-17-1950','%m-%d-%Y')),
(4, 'red Cross', str_to_date ('08-17-1950','%m-%d-%Y'), str_to_date ('08-17-1951','%m-%d-%Y')),
(5, 'CareMedia', str_to_date ('09-14-1973','%m-%d-%Y'), str_to_date ('09-14-1974','%m-%d-%Y')),
(5, 'Cross Blue', str_to_date ('09-14-1974','%m-%d-%Y'), str_to_date ('09-14-1975','%m-%d-%Y'));