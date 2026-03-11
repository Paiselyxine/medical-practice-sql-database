
-- medical-practice-database/schema/database_schema.sql
-- Medical Practice Database Schema
-- Created for portfolio demonstration

USE MedicalPractice;

CREATE TABLE Patient (
    Patient_ID INT,              
    Title VARCHAR(20) NOT NULL,              
    FirstName VARCHAR(50) NOT NULL,          
    MiddleInitial CHAR(1) NOT NULL,          
    LastName VARCHAR(50) NOT NULL,           
    HouseUnitLotNum VARCHAR(5) NOT NULL,     
    Street VARCHAR(50) NOT NULL,             
    Suburb VARCHAR(50) NOT NULL, 
    State VARCHAR (3) NOT NULL,            
    Postcode CHAR(4) NOT NULL,               
    HomePhone CHAR(10),             
    MobilePhone CHAR(10),           
    MedicareNumber CHAR(16),        
    DateOfBirth DATE,               
    Gender VARCHAR(20),                      
    PRIMARY KEY (Patient_ID), 
    CONSTRAINT unique_Patient_Ref UNIQUE (Patient_Ref)		
);

CREATE TABLE PractitionerType (PractitionerType VARCHAR(50) NOT NULL,
    PRIMARY KEY (PractitionerType)
);

CREATE TABLE Practitioner (
    Practitioner_ID INT,              
    Title VARCHAR(20) NOT NULL,              
    FirstName VARCHAR(50) NOT NULL,          
    MiddleInitial CHAR(1) NOT NULL,          
    LastName VARCHAR(50) NOT NULL,           
    HouseUnitLotNum VARCHAR(5) NOT NULL,     
    Street VARCHAR(50) NOT NULL,             
    Suburb VARCHAR(50) NOT NULL,
    State VARCHAR(3) NOT NULL,             
    Postcode CHAR(4) NOT NULL,               
    HomePhone CHAR(10) NOT NULL,             
    MobilePhone CHAR(10) NOT NULL,           
    MedicareNumber CHAR(16) NOT NULL, 
    MedicalRegistrationNumber CHAR(11) NOT NULL,       
    DateOfBirth DATE NOT NULL,               
    Gender VARCHAR(20), 
    PractitionerType_Ref VARCHAR(50) NOT NULL,                     
    PRIMARY KEY (Practitioner_ID), 
    FOREIGN KEY (PractitionerType_Ref) REFERENCES PractitionerType (PractitionerType),
    CONSTRAINT unique_MedicalRegistrationNumber UNIQUE (MedicalRegistrationNumber)		
);

CREATE TABLE Appointment (
    Practitioner_Ref INT,
    ApptDate DATE,
    ApptStartTime TIME,
    Patient_Ref INT,
    PRIMARY KEY (ApptDate,ApptStartTime),
    FOREIGN KEY (Practitioner_Ref) REFERENCES Practitioner (Practitioner_ID),
    FOREIGN KEY (Patient_Ref) REFERENCES Patient (Patient_ID),
   
);



CREATE TABLE WeekDays (WeekDayName VARCHAR(9) NOT NULL,
    PRIMARY KEY (WeekDayName)
);

CREATE TABLE Availability (WeekDayName_Ref VARCHAR(9) NOT NULL, Practitioner_Ref INT,
    FOREIGN KEY (WeekDayName_Ref) REFERENCES WeekDays (WeekDayName),
    FOREIGN KEY (Practitioner_Ref) REFERENCES Practitioner (Practitioner_ID)
);


--TEST DATA----------------------------------------------


INSERT INTO Patient
(Patient_ID,Title,FirstName,MiddleInitial,LastName,HouseUnitLotNum,Street,Suburb,State,Postcode,HomePhone,MobilePhone,MedicareNumber,DateOfBirth,Gender)
VALUES 
(10000,	 'Mr',	 'Mackenzie',	 'J',	 'Fleetwood',	'233'	, 'Dreaming Street'	, 'Roseville'	 ,'NSW'	,'2069'	,'0298654743',	'0465375486'	,'7253418356478253'	,'2000-03-12'	, 'male'),
(10001	, 'Ms',	 'Jane'	, 'P'	, 'Killingsworth'	,'34'	, 'Southern Road'	, 'Yarramundi'	 ,'NSW'	,'2753',	'0234654345',	'0342134679'	,'9365243640183640'	,'1943-04-08'	, 'female'),
(10002,	 'Mr'	, 'Peter'	, 'D'	, 'Leons'	,'21'	, 'Constitution Drive',	 'West Hoxton'	 ,'NSW'	,'2171'	,'0276539183'	,'0125364927',	'1873652945578932',	'1962-07-08'	, 'male');



INSERT INTO PractitionerType
(PractitionerType)
VALUES
('Diagnostic radiographer'),
('Enrolled nurse'),
('Registered nurse'),
('Medical Practitioner (Doctor or GP)');


INSERT INTO Practitioner 
( Practitioner_ID, Title, FirstName,MiddleInitial,LastName,HouseUnitLotNum,Street,Suburb,State,Postcode,HomePhone,MobilePhone, MedicareNumber,MedicalRegistrationNumber,DateOfBirth,Gender,PractitionerType_Ref)
VALUES
(10000,	 'Dr',	 'Mark',	 'P',	 'Huston',	'21',	 'Fuller Street',	 'Sunshine',	 'NSW',	'2343',	'0287657483',	'0476352638',	'9878986473892753',	'63738276173',	'1975-07-07',	 'male',	 'Medical Practitioner (Doctor or GP)'),
(10001,	 'Mrs',	 'Hilda',	 'D',	 'Brown',	'32',	 'Argyle Street',	 'Bonnels Bay',	 'NSW',	'2264',	'0249756544',	'0318466453',	'4635278435099921',	'37876273849',	'1993-12-03',	 'female',	 'Registered nurse'),
(10002,	 'Mrs',	 'Jennifer',	 'J',	 'Dunsworth',	'45',	 'Dora Street',	 'Morriset',	 'NSW',	'2264',	'0249767574',	'0228484373',	'7666777833449876',	'48372678939',	'1991-06-04',	 'female',	 'Registered nurse'); 


INSERT INTO Appointment (Practitioner_Ref, ApptDate, ApptStartTime, Patient_Ref)
VALUES
(10005,	'2019-09-17',	'08:15:00',	10000),
(10006,	'2019-09-18',	'10:00:00',	10000),
(10006,	'2019-09-18',	'10:15:00',	10000);

INSERT INTO WeekDays (WeekDayName)
VALUES
('Friday'),
('Monday'),
('Thursday'),
('Tuesday'),
('Wednesday');

INSERT INTO Availability (Practitioner_Ref, WeekDayName_Ref)
VALUES
(10000	, 'Friday'),
(10000	 ,'Monday'),
(10000	, 'Wednesday');
