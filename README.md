# Hospital-Management-System
This project is a comprehensive Hospital Management System (HMS) database developed using MySQL. The goal of the system is to efficiently manage and organize essential hospital operations, including patient data, doctor information, medical history, appointments, ward admissions, and treatment prescriptions. The database is structured using relational tables, designed to maintain data integrity and support complex queries for effective hospital administration.

Key Features
Department Management: Organizes hospital departments like Cardiology, Neurology, Pediatrics, etc., with unique department IDs and names.

Doctor Management: Stores details about doctors, including name, gender, specialty, and associated department. Also manages doctor schedules and their appointments with patients.

Patient Management: Maintains patient records, including personal information (name, address, gender), admission details, medical history, diagnoses, and prescriptions.

Appointment Scheduling: Manages doctor-patient appointments, including date, time, and assigned doctors.

Ward and Admission Management: Tracks patient admissions into hospital wards, including admission/discharge dates and ward capacities.

Medical History and Diagnosis: Stores patients’ medical conditions, surgeries, and diagnosis information. Allows tracking of prescriptions linked to diagnoses and appointments.

Medication Tracking: Keeps records of the medications prescribed by doctors to patients, ensuring easy access to prescription details.

Nurse and Support Staff Management: Includes information about nurses and other support staff, including their departments and specialties.

Database Schema
The database is composed of the following main tables:

Department: Stores department information.
Doctor: Stores doctor details along with their specialties and associated departments.
Patient: Stores patient records, including personal and medical details.
Nurse: Stores nurse and support staff details.
Ward: Stores ward information, including capacities.
Admit: Tracks patient admission and discharge in hospital wards.
Schedule: Stores doctor schedules, including working hours and break times.
Appointment: Tracks doctor-patient appointments.
Diagnose: Stores diagnosis and prescription details linked to appointments.
MedicalHistory: Stores patient medical histories, including conditions, surgeries, and involved doctors.
Junction Tables: Includes junction tables like Doctor_Schedule, Doctor_Patient, Patient_Appointment, Doctor_Medication, and Patient_Medication to manage relationships between different entities.
Data Integrity:
The database employs Foreign Key Constraints to maintain referential integrity between related tables.
Relational design ensures normalization and avoids data redundancy while supporting efficient query execution.
Dummy Data:
Dummy data has been inserted into the tables to simulate a real-world hospital environment. The dataset includes:

10 Departments, 10 Doctors, and 10 Nurses across various specialties.
10 Patients with corresponding medical records, diagnoses, and medications.
Sample schedules, appointments, and ward admission details.
Usage
This system can be used by hospitals to:

Manage doctor schedules and patient appointments.
Store and access patient medical histories and diagnoses.
Organize ward admissions and track patient treatments.
Ensure efficient handling of prescriptions and medications.
How to Use
Clone the Repository: Clone this project to your local machine.

Set Up MySQL: Ensure that you have MySQL installed on your system.

Import the SQL Script: Run the provided SQL script to create the database and tables, and insert the dummy data.
mysql -u [username] -p < hms_database.sql

Interact with the Database: Use MySQL queries to interact with the database, manage data, and generate reports based on hospital operations.

Technologies Used:
MySQL: Database management system.
SQL: Query language used to manage and retrieve data from the MySQL database.

Future Enhancements:
Integration with a web-based front-end interface.
Adding support for billing and insurance processing.
Implementing a role-based access system for different hospital staff.
