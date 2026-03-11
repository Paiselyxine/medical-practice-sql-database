
CREATE VIEW vwNurseDays AS
SELECT 
    p.FirstName, 
    p.LastName,
    p.HomePhone, 
    p.MobilePhone,
    a.WeekDayName_Ref
FROM 
    Practitioner p
JOIN 
    PractitionerType pt ON p.PractitionerType_Ref = pt.PractitionerType
JOIN 
    Availability a ON p.Practitioner_ID = a.Practitioner_Ref
WHERE 
    pt.PractitionerType IN ('nurse', 'Registered nurse');



SELECT 
    FirstName, 
    LastName, 
    HomePhone, 
    MobilePhone
FROM 
    vwNurseDays
WHERE 
    WeekDayName_Ref = 'Wednesday';


CREATE VIEW vwNSWPatients AS
SELECT 
    Patient_ID, 
    Title,
    FirstName, 
    MiddleInitial,
    LastName, 
    HouseUnitLotNum,
    Street,
    Suburb, 
    State,
    Postcode,
    HomePhone,
    MobilePhone,
    MedicareNumber,
    DateOfBirth,
    Gender
FROM 
    Patient
WHERE 
    State = 'NSW';



DELIMITER $$

CREATE PROCEDURE spSelect_vwNSWPatients()
BEGIN
    SELECT 
      Patient_ID, 
      Title,
      FirstName, 
      MiddleInitial,
      LastName, 
      HouseUnitLotNum,
      Street,
      Suburb, 
      State,
      Postcode,
      HomePhone,
      MobilePhone,
      MedicareNumber,
      DateOfBirth,
      Gender
 FROM 
        vwNSWPatients
    ORDER BY 
        postcode ASC;
END $$



DELIMITER $$

CREATE PROCEDURE spInsert_vwNSWPatients(
    IN p_Patient_ID INT,
    IN p_Title VARCHAR(20),
    IN p_FirstName VARCHAR(50),
    IN p_MiddleInitial VARCHAR(1),
    IN p_LastName VARCHAR(50),
    IN p_HouseUnitLotNum VARCHAR(5),
    IN p_Street VARCHAR(50),
    IN p_Suburb VARCHAR(50),
    IN p_State VARCHAR(3),
    IN p_Postcode CHAR(4)
   
    
)
BEGIN
    INSERT INTO vwNSWPatients (Patient_ID, Title, FirstName, MiddleInitial, LastName, HouseUnitLotNum, Street, Suburb, State, Postcode)
    VALUES (p_Patient_ID, p_Title, p_FirstName, p_MiddleInitial, p_LastName, p_HouseUnitLotNum, p_Street, p_Suburb, p_State, p_Postcode);
END $$

DELIMITER ;



CALL spInsert_vwNSWPatients(
    1001,               
    'Mr',              
    'Mickey',           
    'M',                
    'Mouse',         
    '1',               
    'Smith St',         
    'Smithville',       
    'NSW',             
    '2222'              
);



SELECT * FROM Patient
WHERE FirstName = 'Mickey' AND LastName = 'Mouse' AND State = 'NSW' AND Postcode = '2222';


DELIMITER $$

CREATE PROCEDURE spModify_PractitionerMobilePhone(
    IN p_FirstName VARCHAR(50),       
    IN p_LastName VARCHAR(50),        
    IN p_NewMobilePhone VARCHAR(15)  
)
BEGIN
  
    UPDATE Practitioner
    SET MobilePhone = p_NewMobilePhone
    WHERE FirstName = p_FirstName
      AND LastName = p_LastName;
    
END $$

DELIMITER ;




CALL spModify_PractitionerMobilePhone('Hilda', 'Brown', '0412345678');

SELECT Practitioner_ID, FirstName, LastName, MobilePhone
FROM Practitioner
WHERE FirstName = 'Hilda' AND LastName = 'Brown';




ALTER TABLE Practitioner
ADD COLUMN DriversLicenceHash CHAR(64);

UPDATE Practitioner
SET DriversLicenceHash = SHA2('1066AD', 256)  
WHERE Practitioner_ID = 10005;


SELECT Practitioner_ID, FirstName, LastName, DriversLicenceHash
FROM Practitioner
WHERE Practitioner_ID = 10005;



ALTER TABLE Patient
ADD COLUMN LastContactDate DATE DEFAULT CURRENT_DATE;


DELIMITER $$

CREATE TRIGGER tr_Appointment_AfterInsert
AFTER INSERT ON Appointment
FOR EACH ROW
BEGIN
    -- Update LastContactDate in the Patient table for the patient related to the appointment
    UPDATE Patient
    SET LastContactDate = CURRENT_DATE
    WHERE Patient_ID = NEW.Patient_Ref;
END $$

DELIMITER ;




DROP VIEW IF EXISTS vwNurseDays;


DROP PROCEDURE IF EXISTS spSelect_vwNSWPatients;



