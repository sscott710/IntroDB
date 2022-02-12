#Savannah Scott
#DSA-230 Quiz
#create the database
CREATE DATABASE Tutor_DB;
USE Tutor_DB;
#create the tables
CREATE TABLE Tutor_T(
	tutorId INT PRIMARY KEY,
    certDate DATE,
    currentStatus VARCHAR(9)
);
CREATE TABLE Student_T(
	studentId INT PRIMARY KEY,
    section VARCHAR(5)
);
CREATE TABLE MatchHistory_T(
	matchId INT AUTO_INCREMENT PRIMARY KEY,
    tutorId INT,
    studentId INT,
    startDate DATE,
    endDate DATE,
    FOREIGN KEY (tutorId) REFERENCES Tutor_T (tutorId),
    FOREIGN KEY (studentId) REFERENCES Student_T (studentId)
);
#insert the data
INSERT INTO Tutor_T VALUES
	(100, '2008-01-05', "Active"),
    (101, '2008-01-05', "Temp Stop"),
    (102, '2008-01-05', "Dropped"),
    (103, '2008-05-22', "Active"),
    (104, '2008-05-22', "Active"),
    (105, '2008-05-22', "Temp Stop"),
    (106, '2008-05-22', "Active");
INSERT INTO Student_T VALUES
	(3000, "2.3"),
    (3001, "5.6"),
    (3002, "1.3"),
    (3003, "3.3"),
    (3004, "2.7"),
    (3005, "4.8"),
    (3006, "7.8"),
    (3007, "1.5");
INSERT INTO MatchHistory_T VALUES
	(DEFAULT, 100, 3000, '2008-01-10', NULL),
    (DEFAULT, 101, 3001, '2008-01-15', '2008-05-15'),
    (DEFAULT, 102, 3002, '2008-02-10', '2008-03-01'),
    (DEFAULT, 106, 3003, '2008-05-28', NULL),
    (DEFAULT, 103, 3004, '2008-06-01', '2008-06-15'),
    (DEFAULT, 104, 3005, '2008-06-01', '2008-06-28'),
    (DEFAULT, 104, 3006, '2008-06-01', NULL);
