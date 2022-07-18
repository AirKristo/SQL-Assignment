-- Comments start with -- or are between /* and */

-- Clean up previously created tables; ignore error saying that the table does not exist



-- OLD
DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE DOG CASCADE CONSTRAINTS;
DROP TABLE BITES CASCADE CONSTRAINTS;

DROP TABLE TEMP0 CASCADE CONSTRAINTS;
DROP TABLE TEMP1 CASCADE CONSTRAINTS;
DROP TABLE TEMP2 CASCADE CONSTRAINTS;
DROP TABLE TEMP3 CASCADE CONSTRAINTS;
DROP TABLE TEMP4 CASCADE CONSTRAINTS;
DROP TABLE TEMP5 CASCADE CONSTRAINTS;
DROP TABLE TEMP6 CASCADE CONSTRAINTS;
DROP TABLE TEMP7 CASCADE CONSTRAINTS;
DROP TABLE TEMP8 CASCADE CONSTRAINTS;
DROP TABLE TEMP9 CASCADE CONSTRAINTS;
DROP TABLE TEMP10 CASCADE CONSTRAINTS;
DROP TABLE TEMP11 CASCADE CONSTRAINTS;
DROP TABLE TEMP12 CASCADE CONSTRAINTS;
DROP TABLE TEMP13 CASCADE CONSTRAINTS;
DROP TABLE TEMP14 CASCADE CONSTRAINTS;
DROP TABLE TEMP15 CASCADE CONSTRAINTS;
DROP TABLE TEMP16 CASCADE CONSTRAINTS;
DROP TABLE TEMP17 CASCADE CONSTRAINTS;
DROP TABLE TEMP18 CASCADE CONSTRAINTS;
DROP TABLE TEMP19 CASCADE CONSTRAINTS;
DROP TABLE TEMP20 CASCADE CONSTRAINTS;

DROP TABLE ANSWER0 CASCADE CONSTRAINTS;
DROP TABLE ANSWER1 CASCADE CONSTRAINTS;
DROP TABLE ANSWER2 CASCADE CONSTRAINTS;
DROP TABLE ANSWER3 CASCADE CONSTRAINTS;
DROP TABLE ANSWER4 CASCADE CONSTRAINTS;
DROP TABLE ANSWER5 CASCADE CONSTRAINTS;
DROP TABLE ANSWER6 CASCADE CONSTRAINTS;
DROP TABLE ANSWER7 CASCADE CONSTRAINTS;
DROP TABLE ANSWER8 CASCADE CONSTRAINTS;
DROP TABLE ANSWER9 CASCADE CONSTRAINTS;
DROP TABLE ANSWER10 CASCADE CONSTRAINTS;

-- Create the database

CREATE TABLE STUDENT(
  NNumber VARCHAR(255) NOT NULL,
  Deposit DECIMAL,
  NetID VARCHAR(255),
  CONSTRAINT COMPANY_PK PRIMARY KEY (NNumber)
);

CREATE TABLE DOG(
  SerialNumber VARCHAR(255) NOT NULL,
  DateBought DATE,
  Breed VARCHAR(255),
  Price DECIMAL,
  NNumber VARCHAR(255) NOT NULL,
  CONSTRAINT DOG_PK PRIMARY KEY (SerialNumber)
);

CREATE TABLE BITES(
  Biter VARCHAR(255) NOT NULL,
  Bitee VARCHAR(255) NOT NULL,
  CONSTRAINT BITES_PK PRIMARY KEY (Biter, Bitee)
);


ALTER TABLE STUDENT
ADD CONSTRAINT STUDENT_NET_ID_UNIQUE UNIQUE(NetID);

ALTER TABLE DOG ADD CONSTRAINT DOG_FK
FOREIGN KEY (NNumber)
REFERENCES STUDENT (NNumber)
;

ALTER TABLE BITES ADD CONSTRAINT BITES_BITER_FK
FOREIGN KEY (Biter)
REFERENCES DOG (SerialNumber)
;

ALTER TABLE BITES ADD CONSTRAINT BITES_BITEE_FK
FOREIGN KEY (Bitee)
REFERENCES DOG (SerialNumber)
;

/* Populate the database */

--STUDENT
INSERT INTO STUDENT (NNumber, Deposit, NetID) VALUES ('2', 100.50, 'aa1');
INSERT INTO STUDENT (NNumber, Deposit, NetID) VALUES ('3', 50.10, 'ab2');
INSERT INTO STUDENT (NNumber, Deposit, NetID) VALUES ('1', 90.0, 'ac3');
INSERT INTO STUDENT (NNumber, Deposit, NetID) VALUES ('4', NULL, 'ad4');
INSERT INTO STUDENT (NNumber, Deposit, NetID) VALUES ('5', 100.0, 'ae5');
INSERT INTO STUDENT (NNumber, Deposit, NetID) VALUES ('6', 100.0, 'af6');
INSERT INTO STUDENT (NNumber, Deposit, NetID) VALUES ('7', 10.0, 'ag7');
INSERT INTO STUDENT (NNumber, Deposit, NetID) VALUES ('8', 10.0, NULL);
INSERT INTO STUDENT (NNumber, Deposit, NetID) VALUES ('9', 10.0, NULL);

--DOG
INSERT INTO DOG (SerialNumber, DateBought, Breed, Price, NNumber) VALUES ('1', TO_DATE('12-07-2019','MM-DD-YYYY'), 'Beagle', 100.0, '2');
INSERT INTO DOG (SerialNumber, DateBought, Breed, Price, NNumber) VALUES ('2', TO_DATE('11-08-2019','MM-DD-YYYY'), 'Pug', 150.0, '1');
INSERT INTO DOG (SerialNumber, DateBought, Breed, Price, NNumber) VALUES ('3', TO_DATE('02-25-2021','MM-DD-YYYY'), 'Pug', 15.0, '3');
INSERT INTO DOG (SerialNumber, DateBought, Breed, Price, NNumber) VALUES ('4', TO_DATE('03-25-2021','MM-DD-YYYY'), 'Beagle', 15.0, '6');
INSERT INTO DOG (SerialNumber, DateBought, Breed, Price, NNumber) VALUES ('5', TO_DATE('04-25-2021','MM-DD-YYYY'), 'Pomerian', 15.0, '7');
INSERT INTO DOG (SerialNumber, DateBought, Breed, Price, NNumber) VALUES ('6', TO_DATE('04-27-2021','MM-DD-YYYY'), 'Poodle', 15.0, '7');
INSERT INTO DOG (SerialNumber, DateBought, Breed, Price, NNumber) VALUES ('1004', TO_DATE('02-21-2021','MM-DD-YYYY'), 'Bulldog', 25.0, '5');
INSERT INTO DOG (SerialNumber, DateBought, Breed, Price, NNumber) VALUES ('2005', TO_DATE('11-05-2021','MM-DD-YYYY'), 'Bulldog', 26.0, '6');

--BITES
INSERT INTO BITES (Biter, Bitee) VALUES ('1', '2');
INSERT INTO BITES (Biter, Bitee) VALUES ('1', '3');
INSERT INTO BITES (Biter, Bitee) VALUES ('1', '1004');
INSERT INTO BITES (Biter, Bitee) VALUES ('1', '2005');
INSERT INTO BITES (Biter, Bitee) VALUES ('1', '4');
INSERT INTO BITES (Biter, Bitee) VALUES ('5', '3');
INSERT INTO BITES (Biter, Bitee) VALUES ('6', '3');
INSERT INTO BITES (Biter, Bitee) VALUES ('1004', '2');
INSERT INTO BITES (Biter, Bitee) VALUES ('2005', '3');
INSERT INTO BITES (Biter, Bitee) VALUES ('2005', '2');
INSERT INTO BITES (Biter, Bitee) VALUES ('1004', '4');
INSERT INTO BITES (Biter, Bitee) VALUES ('5', '1004');
INSERT INTO BITES (Biter, Bitee) VALUES ('6', '1004');
INSERT INTO BITES (Biter, Bitee) VALUES ('2', '4');
INSERT INTO BITES (Biter, Bitee) VALUES ('2', '5');
INSERT INTO BITES (Biter, Bitee) VALUES ('5', '2');
INSERT INTO BITES (Biter, Bitee) VALUES ('6', '2');
INSERT INTO BITES (Biter, Bitee) VALUES ('2', '1');
