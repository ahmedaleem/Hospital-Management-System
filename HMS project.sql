create database HMS;
use hms;
-- Create Department table
CREATE TABLE Department (
  DepartmentID INT PRIMARY KEY,
  Name VARCHAR(255)
);

-- Create Doctor table
CREATE TABLE Doctor (
  DoctorID INT PRIMARY KEY,
  Name VARCHAR(255),
  Gender VARCHAR(10),
  Speciality VARCHAR(255),
  DepartmentID INT,
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Patient table
CREATE TABLE Patient (
  PatientID INT PRIMARY KEY,
  Name VARCHAR(255),
  Gender VARCHAR(10),
  Address VARCHAR(255)
);

-- Create Nurse table
CREATE TABLE Nurse (
  NurseID INT PRIMARY KEY,
  Name VARCHAR(255),
  Department VARCHAR(255),
  Speciality VARCHAR(255)
);

-- Create Ward table
CREATE TABLE Ward (
  WardID INT PRIMARY KEY,
  Name VARCHAR(255),
  Capacity INT
);

-- Create Admit table
CREATE TABLE Admit (
  AdmissionDate DATE,
  DischargeDate DATE,
  PatientID INT,
  WardID INT,
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
  FOREIGN KEY (WardID) REFERENCES Ward(WardID)
);

-- Create Schedule table
CREATE TABLE Schedule (
  ScheduleID INT PRIMARY KEY,
  Day VARCHAR(20),
  StartTime TIME,
  EndTime TIME,
  BreakTime TIME
);

-- Create Appointment table
CREATE TABLE Appointment (
  AppointmentID INT PRIMARY KEY,
  Date DATE,
  StartTime TIME,
  EndTime TIME,
  DoctorID INT,
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Create Diagnose table
CREATE TABLE Diagnose (
  DiagnoseID INT PRIMARY KEY,
  Prescription VARCHAR(255),
  Diagnosis VARCHAR(255),
  AppointmentID INT,
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

-- Create MedicalHistory table
CREATE TABLE MedicalHistory (
  MedicalHistoryID INT PRIMARY KEY,
  Conditions VARCHAR(255),
  Date DATE,
  Surgeries VARCHAR(255),
  DoctorID INT,
  PatientID INT,
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Create Doctor_Schedule junction table
CREATE TABLE Doctor_Schedule (
  DoctorID INT,
  ScheduleID INT,
  PRIMARY KEY (DoctorID, ScheduleID),
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
  FOREIGN KEY (ScheduleID) REFERENCES Schedule(ScheduleID)
);

-- Create Doctor_Patient junction table
CREATE TABLE Doctor_Patient (
  DoctorID INT,
  PatientID INT,
  PRIMARY KEY (DoctorID, PatientID),
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Create Patient_Appointment junction table
CREATE TABLE Patient_Appointment (
  PatientID INT,
  AppointmentID INT,
  PRIMARY KEY (PatientID, AppointmentID),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

-- Create Doctor_Medication junction table
CREATE TABLE Doctor_Medication (
  DoctorID INT,
  Medication VARCHAR(255),
  PRIMARY KEY (DoctorID, Medication),
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Create Patient_Medication junction table
CREATE TABLE Patient_Medication (
  PatientID INT,
  Medication VARCHAR(255),
  PRIMARY KEY (PatientID, Medication),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
-- Insert dummy data into Department table
INSERT INTO Department (DepartmentID, Name) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Gastroenterology'),
(5, 'Dermatology'),
(6, 'Ophthalmology'),
(7, 'ENT'),
(8, 'Pediatrics'),
(9, 'Internal Medicine'),
(10, 'Psychiatry');

-- Insert dummy data into Doctor table
INSERT INTO Doctor (DoctorID, Name, Gender, Speciality, DepartmentID) VALUES
(1, 'Dr. John Smith', 'Male', 'Cardiologist', 1),
(2, 'Dr. Emily Johnson', 'Female', 'Neurologist', 2),
(3, 'Dr. Michael Brown', 'Male', 'Orthopedic Surgeon', 3),
(4, 'Dr. Sarah Davis', 'Female', 'Gastroenterologist', 4),
(5, 'Dr. Robert Wilson', 'Male', 'Dermatologist', 5),
(6, 'Dr. Jennifer Thompson', 'Female', 'Ophthalmologist', 6),
(7, 'Dr. David Martinez', 'Male', 'ENT Specialist', 7),
(8, 'Dr. Laura Adams', 'Female', 'Pediatrician', 8),
(9, 'Dr. Christopher Lee', 'Male', 'Internist', 9),
(10, 'Dr. Samantha Moore', 'Female', 'Psychiatrist', 10);

-- Insert dummy data into Patient table
INSERT INTO Patient (PatientID, Name, Gender, Address) VALUES
(1, 'John Doe', 'Male', '123 Main St, City'),
(2, 'Jane Smith', 'Female', '456 Elm St, City'),
(3, 'Michael Johnson', 'Male', '789 Oak St, City'),
(4, 'Emily Davis', 'Female', '321 Pine St, City'),
(5, 'William Wilson', 'Male', '654 Maple St, City'),
(6, 'Olivia Taylor', 'Female', '987 Cedar St, City'),
(7, 'James Brown', 'Male', '234 Walnut St, City'),
(8, 'Sophia Anderson', 'Female', '567 Birch St, City'),
(9, 'Alexander Clark', 'Male', '890 Spruce St, City'),
(10, 'Mia Rodriguez', 'Female', '123 Oak St, City');

-- Insert dummy data into Nurse table
INSERT INTO Nurse (NurseID, Name, Department, Speciality) VALUES
(1, 'Nurse Lisa Johnson', 'Cardiology', 'Critical Care'),
(2, 'Nurse Jessica Wilson', 'Neurology', 'Stroke Unit'),
(3, 'Nurse Amanda Davis', 'Orthopedics', 'Surgical Ward'),
(4, 'Nurse Rachel Taylor', 'Gastroenterology', 'Endoscopy Unit'),
(5, 'Nurse Megan Anderson', 'Dermatology', 'Skin Care Clinic'),
(6, 'Nurse Emily Clark', 'Ophthalmology', 'Eye Surgery'),
(7, 'Nurse Samantha Moore', 'ENT', 'ENT Clinic'),
(8, 'Nurse Ashley Thompson', 'Pediatrics', 'NICU'),
(9, 'Nurse Andrew Martin', 'Internal Medicine', 'General Ward'),
(10, 'Nurse Benjamin Garcia', 'Psychiatry', 'Mental Health Unit');

-- Insert dummy data into Ward table
INSERT INTO Ward (WardID, Name, Capacity) VALUES
(1, 'Cardiac Ward', 20),
(2, 'Neurology Ward', 15),
(3, 'Orthopedic Ward', 10),
(4, 'Gastroenterology Ward', 12),
(5, 'Dermatology Ward', 8),
(6, 'Ophthalmology Ward', 6),
(7, 'ENT Ward', 10),
(8, 'Pediatric Ward', 18),
(9, 'General Ward', 30),
(10, 'Psychiatric Ward', 20);

-- Insert dummy data into Admit table
INSERT INTO Admit (AdmissionDate, DischargeDate, PatientID, WardID) VALUES
('2023-05-01', '2023-05-10', 1, 1),
('2023-05-02', '2023-05-08', 2, 2),
('2023-05-03', '2023-05-09', 3, 3),
('2023-05-04', '2023-05-07', 4, 4),
('2023-05-05', '2023-05-11', 5, 5),
('2023-05-06', '2023-05-13', 6, 6),
('2023-05-07', '2023-05-12', 7, 7),
('2023-05-08', '2023-05-14', 8, 8),
('2023-05-09', '2023-05-15', 9, 9),
('2023-05-10', '2023-05-16', 10, 10);

-- Insert dummy data into Schedule table
INSERT INTO Schedule (ScheduleID, Day, StartTime, EndTime, BreakTime) VALUES
(1, 'Monday', '09:00:00', '17:00:00', '12:00:00'),
(2, 'Tuesday', '09:00:00', '17:00:00', '12:00:00'),
(3, 'Wednesday', '09:00:00', '17:00:00', '12:00:00'),
(4, 'Thursday', '09:00:00', '17:00:00', '12:00:00'),
(5, 'Friday', '09:00:00', '17:00:00', '12:00:00'),
(6, 'Saturday', '09:00:00', '13:00:00', '12:00:00'),
(7, 'Sunday', '09:00:00', '13:00:00', '12:00:00'),
(8, 'Monday', '13:00:00', '21:00:00', '16:00:00'),
(9, 'Tuesday', '13:00:00', '21:00:00', '16:00:00'),
(10, 'Wednesday', '13:00:00', '21:00:00', '16:00:00');

-- Insert dummy data into Appointment table
INSERT INTO Appointment (AppointmentID, Date, StartTime, EndTime, DoctorID) VALUES
(1, '2023-05-01', '09:00:00', '09:30:00', 1),
(2, '2023-05-02', '10:00:00', '10:30:00', 2),
(3, '2023-05-03', '11:00:00', '11:30:00', 3),
(4, '2023-05-04', '12:00:00', '12:30:00', 4),
(5, '2023-05-05', '13:00:00', '13:30:00', 5),
(6, '2023-05-06', '14:00:00', '14:30:00', 6),
(7, '2023-05-07', '15:00:00', '15:30:00', 7),
(8, '2023-05-08', '16:00:00', '16:30:00', 8),
(9, '2023-05-09', '17:00:00', '17:30:00', 9),
(10, '2023-05-10', '18:00:00', '18:30:00', 10);

-- Insert dummy data into Diagnose table
INSERT INTO Diagnose (DiagnoseID, Prescription, Diagnosis, AppointmentID) VALUES
(1, 'Medication A, Medication B', 'Hypertension', 1),
(2, 'Medication C, Medication D', 'Migraine', 2),
(3, 'Medication E, Medication F', 'Fractured Arm', 3),
(4, 'Medication G, Medication H', 'Gastritis', 4),
(5, 'Medication I, Medication J', 'Acne', 5),
(6, 'Medication K, Medication L', 'Cataract', 6),
(7, 'Medication M, Medication N', 'Sinusitis', 7),
(8, 'Medication O, Medication P', 'Fever', 8),
(9, 'Medication Q, Medication R', 'Diabetes', 9),
(10, 'Medication S, Medication T', 'Depression', 10);

-- Insert dummy data into MedicalHistory table
INSERT INTO MedicalHistory (MedicalHistoryID, Conditions, Date, Surgeries, DoctorID, PatientID) VALUES
(1, 'Hypertension, Diabetes', '2022-01-01', 'None', 1, 1),
(2, 'Migraine, Anxiety', '2021-11-15', 'Appendectomy', 2, 2),
(3, 'Fractured Arm', '2023-03-05', 'None', 3, 3),
(4, 'Gastritis, High Cholesterol', '2022-09-20', 'None', 4, 4),
(5, 'Acne', '2023-02-10', 'None', 5, 5),
(6, 'Cataract', '2022-07-07', 'None', 6, 6),
(7, 'Sinusitis, Allergies', '2023-04-12', 'Tonsillectomy', 7, 7),
(8, 'Fever', '2023-05-03', 'None', 8, 8),
(9, 'Diabetes', '2022-11-30', 'None', 9, 9),
(10, 'Depression', '2022-08-18', 'None', 10, 10);

-- Insert dummy data into Doctor_Schedule junction table
INSERT INTO Doctor_Schedule (DoctorID, ScheduleID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insert dummy data into Doctor_Patient junction table
INSERT INTO Doctor_Patient (DoctorID, PatientID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insert dummy data into Patient_Appointment junction table
INSERT INTO Patient_Appointment (PatientID, AppointmentID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insert dummy data into Doctor_Medication junction table
INSERT INTO Doctor_Medication (DoctorID, Medication) VALUES
(1, 'Medication A'),
(2, 'Medication B'),
(3, 'Medication C'),
(4, 'Medication D'),
(5, 'Medication E'),
(6, 'Medication F'),
(7, 'Medication G'),
(8, 'Medication H'),
(9, 'Medication I'),
(10, 'Medication J');

-- Insert dummy data into Patient_Medication junction table
INSERT INTO Patient_Medication (PatientID, Medication) VALUES
(1, 'Medication A'),
(2, 'Medication B'),
(3, 'Medication C'),
(4, 'Medication D'),
(5, 'Medication E'),
(6, 'Medication F'),
(7, 'Medication G'),
(8, 'Medication H'),
(9, 'Medication I'),
(10, 'Medication J');

