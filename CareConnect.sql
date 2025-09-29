-- ------------------------------
-- CareConnectHospital Database
-- My first Database  reation
-- I got my values from ChatGPT
-- ------------------------------

-- Create database
CREATE DATABASE CareConnectHospital;
USE CareConnectHospital;

-- Create Tables

CREATE TABLE Departments (
    Department_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Patients (
    Patient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Contact VARCHAR(20),
    Address VARCHAR(255),
    Admission_date DATE,
    Discharge_date DATE NULL
);

CREATE TABLE Doctors (
    Doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Speciality VARCHAR(100),
    Department_id INT,
    Contact VARCHAR(20),
    Email VARCHAR(100),
    FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);

CREATE TABLE Staff (
    Staff_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Department_id INT,
    Shift VARCHAR(20),
    FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);

CREATE TABLE Prescriptions (
    Prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    Patient_id INT,
    Doctor_id INT,
    Medication VARCHAR(100),
    Dosage VARCHAR(50),
    Prescription_date DATE,
    FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctors(Doctor_id)
);

CREATE TABLE Billing (
    Billing_id INT PRIMARY KEY AUTO_INCREMENT,
    Patient_id INT,
    Service VARCHAR(100),
    Cost DECIMAL(10,2),
    Payment_status ENUM('Paid','Pending'),
    Billing_date DATE,
    FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id)
);

-- Insert Data

INSERT INTO Departments (Name, Location) VALUES
('Cardiology', 'Building A, Floor 2'),
('Pediatrics', 'Building B, Floor 1'),
('Neurology', 'Building C, Floor 3'),
('Orthopedics', 'Building A, Floor 4'),
('Dermatology', 'Building B, Floor 2'),
('ENT', 'Building C, Floor 1'),
('Gastroenterology', 'Building D, Floor 1'),
('Oncology', 'Building D, Floor 2'),
('Radiology', 'Building E, Floor 1'),
('General Surgery', 'Building E, Floor 3');

INSERT INTO Patients (First_name, Last_name, Age, Gender, Contact, Address, Admission_date, Discharge_date) VALUES
('John','Doe',45,'M','+27123450001','123 Main St, Johannesburg','2025-09-01',NULL),
('Mary','Smith',30,'F','+27123450002','456 Oak Rd, Pretoria','2025-09-02','2025-09-05'),
('James','Brown',60,'M','+27123450003','789 Pine St, Durban','2025-09-03',NULL),
('Linda','Johnson',25,'F','+27123450004','321 Maple Ave, Cape Town','2025-09-04',NULL),
('Michael','Williams',55,'M','+27123450005','222 Birch St, Johannesburg','2025-09-05','2025-09-10'),
('Patricia','Jones',40,'F','+27123450006','777 Cedar Rd, Pretoria','2025-09-06',NULL),
('Robert','Miller',35,'M','+27123450007','888 Willow Ave, Durban','2025-09-07','2025-09-09'),
('Barbara','Davis',28,'F','+27123450008','999 Spruce St, Cape Town','2025-09-08',NULL),
('William','Garcia',50,'M','+27123450009','101 Elm St, Johannesburg','2025-09-09','2025-09-12'),
('Elizabeth','Martinez',33,'F','+27123450010','202 Birch Rd, Pretoria','2025-09-10',NULL),
('Daniel','Harris',29,'M','+27123450011','303 Oak St, Durban','2025-09-11',NULL),
('Jennifer','Clark',37,'F','+27123450012','404 Pine Rd, Cape Town','2025-09-12','2025-09-15'),
('Matthew','Lewis',42,'M','+27123450013','505 Maple St, Johannesburg','2025-09-13',NULL),
('Jessica','Lee',31,'F','+27123450014','606 Cedar Rd, Pretoria','2025-09-14','2025-09-17'),
('Anthony','Walker',48,'M','+27123450015','707 Spruce St, Durban','2025-09-15',NULL),
('Sarah','Hall',27,'F','+27123450016','808 Willow Ave, Cape Town','2025-09-16',NULL),
('Christopher','Allen',36,'M','+27123450017','909 Birch St, Johannesburg','2025-09-17','2025-09-20'),
('Karen','Young',39,'F','+27123450018','1010 Elm Rd, Pretoria','2025-09-18',NULL),
('Joshua','Hernandez',44,'M','+27123450019','1111 Oak St, Durban','2025-09-19','2025-09-22'),
('Lisa','King',26,'F','+27123450020','1212 Pine Ave, Cape Town','2025-09-20',NULL);

INSERT INTO Doctors (First_name, Last_name, Speciality, Department_id, Contact, Email) VALUES
('Alice','Williams','Cardiologist',1,'+27110000001','alice.williams@hospital.com'),
('Robert','Taylor','Pediatrician',2,'+27110000002','robert.taylor@hospital.com'),
('Michael','Anderson','Neurologist',3,'+27110000003','michael.anderson@hospital.com'),
('Susan','Martin','Orthopedic',4,'+27110000004','susan.martin@hospital.com'),
('David','Lee','Dermatologist',5,'+27110000005','david.lee@hospital.com'),
('Nancy','Brown','ENT Specialist',6,'+27110000006','nancy.brown@hospital.com'),
('John','Clark','Gastroenterologist',7,'+27110000007','john.clark@hospital.com'),
('Emma','Scott','Oncologist',8,'+27110000008','emma.scott@hospital.com'),
('Paul','Walker','Radiologist',9,'+27110000009','paul.walker@hospital.com'),
('Linda','Young','Surgeon',10,'+27110000010','linda.young@hospital.com');

INSERT INTO Staff (Name, Role, Department_id, Shift) VALUES
('Alice Thompson','Nurse',1,'Morning'),
('Bob White','Admin',2,'Morning'),
('Clara Lewis','Technician',3,'Evening'),
('David Harris','Nurse',4,'Night'),
('Emma Scott','Admin',5,'Morning'),
('Frank Clark','Technician',6,'Evening'),
('Grace Hill','Nurse',7,'Night'),
('Harry King','Admin',8,'Morning'),
('Isla Green','Technician',9,'Evening'),
('Jack Brown','Nurse',10,'Night');

INSERT INTO Prescriptions (Patient_id, Doctor_id, Medication, Dosage, Prescription_date) VALUES
(1, 1, 'Aspirin', '100mg', '2025-09-21'),
(2, 2, 'Paracetamol', '500mg', '2025-09-22'),
(3, 3, 'Ibuprofen', '200mg', '2025-09-23'),
(4, 4, 'Painkiller', '50mg', '2025-09-24'),
(5, 1, 'Beta Blocker', '10mg', '2025-09-25'),
(6, 5, 'Hydrocortisone Cream', 'Apply Twice Daily', '2025-09-26'),
(7, 6, 'Antibiotic Ear Drops', '3 Times Daily', '2025-09-27'),
(8, 2, 'Vitamin Syrup', '5ml Daily', '2025-09-28'),
(9, 3, 'Migraine Relief', '50mg', '2025-09-29'),
(10, 4, 'Muscle Relaxant', '10mg', '2025-09-30'),
(11, 5, 'Acne Lotion', 'Apply Daily', '2025-10-01'),
(12, 6, 'Ear Wax Softener', '2 Drops', '2025-10-02'),
(13, 7, 'Antacid', '10mg', '2025-10-03'),
(14, 8, 'Chemo Med', 'Dose per protocol', '2025-10-04'),
(15, 9, 'Painkiller', '50mg', '2025-10-05'),
(16, 10, 'Pre-op Meds', 'As instructed', '2025-10-06'),
(17, 1, 'Nitroglycerin', '1 Tablet', '2025-10-07'),
(18, 2, 'Cough Syrup', '10ml', '2025-10-08'),
(19, 3, 'Neuro Med', '20mg', '2025-10-09'),
(20, 4, 'Bone Healing Med', '500mg', '2025-10-10');

-- Billing
INSERT INTO Billing (Patient_id, Service, Cost, Payment_status, Billing_date) VALUES
(1, 'ECG Test', 500.00, 'Paid', '2025-09-21'),
(2, 'Consultation', 300.00, 'Pending', '2025-09-22'),
(3, 'MRI Scan', 2000.00, 'Paid', '2025-09-23'),
(4, 'X-Ray', 700.00, 'Paid', '2025-09-24'),
(5, 'Heart Checkup', 1500.00, 'Pending', '2025-09-25'),
(6, 'Skin Treatment', 400.00, 'Paid', '2025-09-26'),
(7, 'Ear Exam', 250.00, 'Paid', '2025-09-27'),
(8, 'Child Checkup', 300.00, 'Pending', '2025-09-28'),
(9, 'Neurology Consultation', 1200.00, 'Paid', '2025-09-29'),
(10, 'Orthopedic Consultation', 1000.00, 'Pending', '2025-09-30'),
(11, 'Dermatology Consultation', 450.00, 'Paid', '2025-10-01'),
(12, 'Hearing Test', 350.00, 'Paid', '2025-10-02'),
(13, 'Gastro Consultation', 800.00, 'Pending', '2025-10-03'),
(14, 'Oncology Checkup', 5000.00, 'Paid', '2025-10-04'),
(15, 'Radiology Exam', 600.00, 'Paid', '2025-10-05'),
(16, 'Surgery Consultation', 2000.00, 'Pending', '2025-10-06'),
(17, 'Heart Medication', 100.00, 'Paid', '2025-10-07'),
(18, 'Cough Medicine', 50.00, 'Paid', '2025-10-08'),
(19, 'Neurology Medication', 300.00, 'Pending', '2025-10-09'),
(20, 'Bone Healing Medication', 400.00, 'Paid', '2025-10-10');
