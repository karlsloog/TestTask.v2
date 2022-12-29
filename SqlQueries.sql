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
('000000001', 'Christine', 'Haas', '1965-01-02'), 
('000000002', 'Michael', 'Thompson', '1973-10-11'), 
('000000003', 'Sally', 'Kwan', '1975-04-05'), 
('000000004', 'John', 'Geyer', '1949-08-17'), 
('000000005', 'Irving', 'Stern', '1973-09-14');

-- Adding 2 insurance records for each patient
INSERT INTO insurance (patient_id, iname, from_date, to_date) VALUES 
(1, 'Medicare', '1961-02-03', '1962-02-03'),
(1, 'Blue Cross', '1962-02-03', '1963-02-03'),
(2, 'Mediafare', '1973-10-11', '1974-10-11'),
(2, 'Blue fross', '1974-10-11', '1975-10-11'),
(3, 'Mediamare', '1975-04-05', '1976-04-05'),
(3, 'Blue gloss', '1976-04-05', '1977-04-05'),
(4, 'MediaMedia', '1949-08-17-', '1950-08-17'),
(4, 'red Cross', '1950-08-17', '1951-08-17'),
(5, 'CareMedia', '1973-09-14', '1974-09-14'),
(5, 'Cross Blue', '1974-09-14', '1975-09-14');