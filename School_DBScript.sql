#practice script for DSA-230 11/22 quiz
CREATE DATABASE Registration_DB;
USE Registration_DB;
CREATE TABLE Student_T(
	studentID INT PRIMARY KEY,
	studentName VARCHAR(25)
);
CREATE TABLE Faculty_T(
	facultyID INT PRIMARY KEY,
	faciltyName VARCHAR(25)
);
CREATE TABLE Course_T(
	courseID VARCHAR(8) PRIMARY KEY,
	courseName VARCHAR(15)
);
CREATE TABLE Qualified_T(
	facultyID INT,
	courseID VARCHAR(8),
	dateQualified DATE,
	PRIMARY KEY (facultyID, courseID),
	FOREIGN KEY (facultyID) REFERENCES Faculty_T (facultyID),
	FOREIGN KEY (courseID) REFERENCES Course_T (courseID)
);
CREATE TABLE Section_T(
	sectionNo INT,
	semester VARCHAR(7),
	courseID VARCHAR(8),
	PRIMARY KEY (sectionNo, semester, courseID),
	FOREIGN KEY (courseID) REFERENCES Course_T (courseID)
);
CREATE TABLE Registration_T(
	studentID INT,
	sectionNo INT,
	semester VARCHAR(7),
	PRIMARY KEY (studentID, sectionNo, semester),
	FOREIGN KEY (studentID) REFERENCES Student_T (studentID),
	FOREIGN KEY (sectionNo) REFERENCES Section_T (sectionNo)
);
#insert data into tables
INSERT INTO Student_T VALUES
	(38214, "Letersky"),
	(54907, "Altvater"),
	(66324, "Aiken"),
	(70542, "Marra");
INSERT INTO Faculty_T VALUES
	(2143, "Birkin"),
	(3467, "Berncit"),
	(4756, "Collins");
INSERT INT0 Course_T VALUES
	("ISM 3113", "Syst Analysis"),
	("ISM 3112", "Syst Design"),
	("ISM 4212", "Database"),
	("ISM 4930", "Networking");
INSERT INTO Qualified_T VALUES
	(2143, "ISM 3112", '1988-09-00'),
	(2143, "ISM 3113", '1988-09-00'),
	(3467, "ISM 4212", '1995-09-00'),
	(3467, "ISM 4930", '1996-09-00'),
	(4756, "ISM 3113", '1996-09-00'),
	(4756, "ISM 3112", '1991-09-00');
INSERT INTO Section_T VALUES
	(2712, "I-2008", "ISM 3113"),
	(2713, "I-2008", "ISM 3113"),
	(2714, "I-2008", "ISM 4212"),
	(2715, "I-2008", "ISM 4930");
INSERT INTO Registration_T VALUES 
	(38214, 2714, "I-2008"),
	(54907, 2714, "I-2008"),
	(54907, 2715, "I-2008"),
	(66324, 2713, "I-2008");
