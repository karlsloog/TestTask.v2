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
INSERT INTO patient (pn, first, last, dob) VALUES 
('000000001', 'Christine', 'Haas', '2065-01-02'), 
('000000002', 'Michael', 'Thompson', '2073-10-11'), 
('000000003', 'Sally', 'Kwan', '2075-04-05'), 
('000000004', 'John', 'Geyer', '2049-08-17'), 
('000000005', 'Irving', 'Stern', '2073-09-14');

-- Adding 2 insurance records for each patient
INSERT INTO insurance (patient_id, iname, from_date, to_date) VALUES 
(1, 'Medicare', '2017-02-03', '2020-02-03'),
(1, 'Blue Cross', '2020-02-03', '2023-02-03'),
(2, 'Mediafare', '2007-10-11', '2010-10-11'),
(2, 'Blue fross', '2001-10-11', '2007-10-11'),
(3, 'Mediamare', '2015-04-05', '2017-04-05'),
(3, 'Blue gloss', '2010-04-05', '2025-04-05'),
(4, 'MediaMedia', '2020-08-17-', '2021-08-17'),
(4, 'Red Cross', '2012-08-17', '2013-08-17'),
(5, 'CareMedia', '2014-09-14', '2015-09-14'),
(5, 'Cross Blue', '2015-09-14', '2016-09-14');