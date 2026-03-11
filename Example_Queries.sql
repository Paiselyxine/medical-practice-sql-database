SELECT FirstName, LastName FROM Patient
WHERE (Suburb = 'St Kilda' or Suburb = 'Lidcombe');

SELECT FirstName, LastName, State, MedicareNumber
FROM Patient
WHERE State != 'NSW';

SELECT FirstName, LastName, MedicareNumber, DateOfBirth
FROM Patient
ORDER BY DateofBirth DESC;

SELECT p.Practitioner_Id,
       p.FirstName,
       p.LastName,
       COUNT(a.WeekDayName_Ref) AS WeekDayName,
       COUNT(a.WeekDayName_Ref) * 9 AS total_hours_per_week
FROM Practitioner p
JOIN Availability a ON p.Practitioner_ID = a.Practitioner_Ref
GROUP BY p.Practitioner_ID, p.FirstName, p.LastName;

SELECT p.FirstName,
       p.LastName,
       a.ApptDate,
       a.ApptStarttime
FROM Patient p
JOIN Appointment a ON p.Patient_Ref = a.Patient_ID
JOIN Practitioner d ON a.Practitioner_ID = d.Practitioner_Ref
WHERE d.Title = 'Dr'
     AND d.FirstName = 'Anne' 
     AND d.LastName = 'Funsworth'
  AND a.ApptDate = '2019-09-18';

SELECT p.Patient_ID, 
       p.DateOfBirth
FROM Patient p
LEFT JOIN Appointment a ON p.Patient_ID = a.Patient_Ref
WHERE a.ApptDate IS NULL 
  AND p.DateOfBirth < '1950-01-01';

SELECT p.Patient_ID, 
       p.FirstName, 
       p.LastName, 
       COUNT(a.ApptDate) AS NumberOfAppointments
FROM Patient p
JOIN Appointment a ON p.Patient_ID = a.Patient_Ref
GROUP BY p.Patient_ID
HAVING COUNT(a.ApptDate) >= 3;

SELECT p.FirstName, 
       p.LastName, 
       p.Gender,
       DATEDIFF('2024-11-23', MAX(a.ApptDate)) AS DaysSinceLastAppointment
FROM Patient p
JOIN Appointment a ON p.Patient_ID = a.Patient_Ref
GROUP BY p.Patient_ID;


SELECT CONCAT(
         d.Title, ' ', 
         d.FirstName, ' ',
         IFNULL(SUBSTRING(d.MiddleInitial, 1, 1), ''), '. ', 
         d.LastName, '. ', 
         d.HouseUnitLotNum, ' ', 
         d.Street, ' ', 
         UPPER(d.Suburb), ', ', 
         d.State, ' ', 
         d.Postcode) AS FullDetails
FROM Practitioner d
ORDER BY d.LastName, d.FirstName, IFNULL(d.MiddleInitial, '');

SELECT p.Patient_ID, 
       p.FirstName, 
       p.LastName, 
       p.DateOfBirth
FROM Patient p
ORDER BY p.DateOfBirth
LIMIT 1 OFFSET 4;

SELECT p.Patient_ID,
       p.FirstName,
       p.LastName,
       DATE_FORMAT(a.ApptDate, '%W %d %M, %Y') AS AppointmentDate,
       DATE_FORMAT(a.ApptStartTime, '%H:%i %p') AS AppointmentTime
FROM Patient p
JOIN Appointment a ON p.Patient_ID = a.Patient_Ref
WHERE DAYNAME(a.ApptDate) = 'Tuesday'
  AND a.ApptStartTime > '10:00:00'
ORDER BY a.ApptDate, a.ApptStartTime;

SELECT 
    HouseUnitLotNum,
    Street, 
    Suburb, 
    UPPER(Suburb) AS UppercaseSuburb, 
    State, 
    Postcode
FROM (
    SELECT Patient.HouseUnitLotNum,
           Patient.Street, 
           Patient.Suburb, 
           Patient.State, 
           Patient.Postcode
    FROM Patient
    UNION
    SELECT Practitioner.HouseUnitLotNum,
           Practitioner.Street, 
           Practitioner.Suburb, 
           Practitioner.State, 
           Practitioner.Postcode
    FROM Practitioner
) AS combined_addresses
GROUP BY HouseUnitLotNum, Street, Suburb, State, Postcode
ORDER BY Suburb, Street;

