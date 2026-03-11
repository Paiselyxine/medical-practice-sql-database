# medical-practice-sql-database
Relational SQL database modelling a medical practice system with schema design, queries, views, stored procedures, triggers, and data security features.

## Overview
This project demonstrates the design and implementation of a relational database for a medical practice using SQL and MySQL/MariaDB. The database models patients, practitioners, appointments, and practitioner availability using a normalized relational schema.

The project includes database schema creation, data population, query development, and the use of advanced database features including views, stored procedures, triggers, and hashing for sensitive data.

This project was developed as part of the **Certificate IV in Information Technology (Programming)** and demonstrates practical database design and SQL development skills.

---

## Key Features

- Relational database schema design
- Primary key and foreign key relationships
- Alternate key constraints
- Data import from CSV files
- SQL queries for data retrieval and analysis
- Views for filtered datasets
- Stored procedures for data access and modification
- Triggers for automated updates
- Data security using hashing (SHA) for sensitive data
- Test plan and validation of database functionality

---

## Technologies Used

- **SQL**
- **MySQL / MariaDB**
- **XAMPP**
- **macOS**
- Relational database modelling (Crow’s Foot ERD)

---

## Database Schema

The system models the following entities:

- **Patient**
- **Practitioner**
- **PractitionerType**
- **Appointment**
- **Availability**
- **WeekDays**

Key relationships include:

- Practitioners belong to a practitioner type
- Patients can have multiple appointments
- Practitioners can have multiple appointments
- Practitioner availability is recorded by weekday

The schema enforces referential integrity through foreign key constraints.

---

## Example Query

Example SQL query retrieving female patients living in selected suburbs:

```sql
SELECT FirstName, LastName
FROM Patient
WHERE Gender = 'female'
AND Suburb IN ('St Kilda', 'Lidcombe');

## Description

- **schema/** – Contains the SQL scripts to create tables (`Patient`, `Practitioner`, `Appointment`, etc.) and populate them with test data.  
- **queries/** – Includes example SQL queries demonstrating database usage, joins, and data retrieval.  
- **dumps/** – Full database export from XAMPP/phpMyAdmin for testing or restoration.  
- **README.md** – Overview of the project, instructions, and context.  
- **.gitignore** – Optional file to ignore unnecessary files from version control (e.g., system or editor files).

## How to Run Locally

1. **Install XAMPP** (or any local MySQL/MariaDB server).  
   - Download: [https://www.apachefriends.org/index.html](https://www.apachefriends.org/index.html)

2. **Start Apache & MySQL** in XAMPP control panel.  

3. **Create the database**:  
   - Open **phpMyAdmin** (usually `http://localhost/phpmyadmin`)  
   - Click **New** → Enter database name: `MedicalPractice` → **Create**.

4. **Import the schema**:  
   - Go to the **Import** tab in your new database.  
   - Select `schema/database_schema.sql` and run it.  
   - This will create the tables and insert test data.

5. **Optional: Restore full dump**:  
   - If you want the full dataset from XAMPP, import `dumps/xampp_full_dump.sql`.

6. **Run queries**:  
   - Open `queries/example_queries.sql` in phpMyAdmin SQL tab, or use any MySQL client to test queries.

---
