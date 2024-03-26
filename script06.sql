-- execute data setup script
@dataSetupScript06.sql

spool spool06.txt

PROMPT kp1404
/*

YOU START YOUR ANSWERS AFTER THE END OF THIS COMMENT BLOCK

ANSWER0 is an example to show you the structure of what you need to produce, unless instructed otherwise in the assignment. Please read carefully what you are asked to do.

Insert your solution for ANSWERX between the string -- ANSWERX and the string PROMPT ANSWERX

You DO NOT have to run the "spool on" comand yourself. This script file does that for you.

The spool06.txt file generated when you run this script will be a part of your submission.

*/
-- Answer 0 represents a sample quert that uses the temp table TEMP0 just to demonstrate the usage of temp table.
-- ANSWER0
CREATE TABLE TEMP0
AS SELECT *
FROM DOG;

CREATE TABLE ANSWER0
AS SELECT DISTINCT Breed
FROM TEMP0
ORDER BY Breed DESC;


PROMPT ANSWER0
SELECT * FROM ANSWER0;

-- ANSWER1
CREATE TABLE ANSWER1
AS SELECT DISTINCT NNumber, Deposit
FROM STUDENT
ORDER BY NNumber DESC;

PROMPT ANSWER1
SELECT * FROM ANSWER1;

-- ANSWER2
CREATE TABLE ANSWER2
AS SELECT DISTINCT NNUMBER
FROM STUDENT
WHERE Deposit > 100
ORDER BY NNumber ASC;

PROMPT ANSWER2
SELECT * FROM ANSWER2;

-- ANSWER3
CREATE TABLE TEMP1
AS SELECT Student.NNumber, NetID, Breed
FROM STUDENT, DOG
WHERE Student.NNumber = Dog.NNumber;

CREATE TABLE TEMP2
AS SELECT Student.NNumber, NetID, Breed
FROM STUDENT, DOG
WHERE Student.NNumber = Dog.NNumber;

CREATE TABLE ANSWER3
AS SELECT DISTINCT TEMP1.NetID student1NetID, TEMP2.NetID student2NetID
FROM TEMP1, TEMP2
WHERE TEMP1.Breed = TEMP2.Breed AND TEMP1.NNumber <> TEMP2.NNumber
ORDER BY student1NetID, student2NetID;

PROMPT ANSWER3
SELECT * FROM ANSWER3;

-- ANSWER4
CREATE TABLE TEMP3
AS SELECT DISTINCT Dog.SerialNumber SerialNumber, Dog.NNumber NNumber, Bites.Bitee BB
FROM DOG, BITES
WHERE DOG.SerialNumber = BITES.Biter;

CREATE TABLE ANSWER4
AS SELECT DISTINCT TEMP3.SerialNumber, TEMP3.NNumber
FROM TEMP3, TEMP3 t
WHERE TEMP3.BB = '3' AND t.BB = '2'
ORDER BY TEMP3.SerialNumber ASC, TEMP3.NNumber ASC;

PROMPT ANSWER4
SELECT * FROM ANSWER4;

-- ANSWER5
CREATE TABLE TEMP4
AS SELECT Student.NetID, Student.NNumber, Dog.SerialNumber
FROM STUDENT, DOG
WHERE Student.NNumber = DOG.NNumber;

CREATE TABLE ANSWER5
AS SELECT DISTINCT NetID, NNumber
FROM TEMP4
WHERE NOT (SerialNumber > 0 AND SerialNumber < 1001)
ORDER BY NetID ASC, NNumber ASC;
--MINUS (kept returning command not found error)
--SELECT DISTINCT NetID, NNumber
--FROM TEMP4
--WHERE SerialNumber > 0  AND SerialNumber < 1001;

PROMPT ANSWER5
SELECT * FROM ANSWER5;

-- ANSWER6
CREATE TABLE TEMP5
AS SELECT Bites.Biter SerialNumberA, Bites.Bitee SerialNumberB
FROM DOG, BITES
WHERE Dog.SerialNumber = Bites.Biter;

CREATE TABLE TEMP6
AS SELECT Bites.Biter SerialNumberB, Bites.Bitee SerialNumberC
FROM DOG, BITES
WHERE Dog.SerialNumber = Bites.Biter;

CREATE TABLE ANSWER6
AS SELECT DISTINCT TEMP5.SerialNumberA biter, SerialNumberC bitee
FROM TEMP5, TEMP6
WHERE TEMP5.SerialNumberB = TEMP6.SerialNumberB
ORDER BY biter ASC, bitee ASC;

PROMPT ANSWER6
SELECT * FROM ANSWER6;

-- ANSWER7
CREATE TABLE TEMP7
AS SELECT SerialNumber, NNumber
FROM DOG, BITES
WHERE SerialNumber = Biter AND Bitee = '4'; 

CREATE TABLE TEMP8
AS SELECT DISTINCT Bites.Bitee, NNumber
FROM DOG, BITES, Bites b
WHERE Dog.SerialNumber = Bites.Bitee AND Bites.Biter = '5' AND b.Biter = '6';

CREATE TABLE ANSWER7
AS SELECT UNIQUE SerialNumber, NNumber
FROM TEMP7
UNION
SELECT UNIQUE Bitee, NNumber
FROM TEMP8
ORDER BY SerialNumber, NNumber;

--AS SELECT DISTINCT TEMP7.SerialNumber, TEMP7.NNumber
--FROM TEMP7, TEMP7 t
--WHERE TEMP7.Bitee = '4' OR (TEMP7.Biter = '5' AND t.Biter = '6')
--ORDER BY TEMP7.SerialNumber ASC, TEMP7.NNumber ASC; 

PROMPT ANSWER7
SELECT * FROM ANSWER7;



spool off
