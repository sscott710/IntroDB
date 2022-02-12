#Savannah Scott
#DSA-230 Final Exam
#make the database
create database Millennium_DB;
use Millennium_DB;
#construct tables
create table Student_T(
	studentID int primary key,
    firstName varchar(30),
    lastName varchar(30),
    address varchar(100),
    major varchar(30));
create table Course_T(
	courseID varchar(10) primary key,
    title varchar(100));
create table Instructor_T(
	instructorID int auto_increment primary key,
    instructorName varchar(30),
    location varchar(10));
create table Registration_T(
	courseID varchar(10),
    semester varchar(10),
    instructor int,
    primary key(semester, courseID),
    foreign key (courseID) references Course_T(courseID),
    foreign key (instructor) references Instructor_T(instructorID)
    );
create table Grade_T(
	studentID int,
    courseID varchar(10),
    semester varchar(10),
    grade char(2),
    primary key (studentID, courseID, semester),
    foreign key (studentID) references Student_T(studentID),
    foreign key (courseID) references Course_T(courseID),
    foreign key (semester) references Registration_T(semester)
    );
#insert data
insert into Student_T values
	(268300458, "Emily", "Williams", "208 Brooks Hall", "Information Systems");
insert into Course_T values
	("IS 350", "Database Mgt."),
    ("IS 465", "System Analysis");
insert into Instructor_T values 
	(default, "Codd", "B104"),
    (default, "Parsons", "B317");
insert into Registration_T values
	("IS 350", "Fall 2021", "1"),
    ("IS 465", "Fall 2021", "2");
insert into Grade_T values
	(268300458, "IS 350", "Fall 2021", "A"),
    (268300458, "IS 465", "Fall 2021", "B"); 
/*#select statements
#1)
#select course_t.title as courseNames from course_t, grade_t where course_t.courseID = grade_t.courseID and grade_t.studentID = 268300458;
#2)
#select instructorName, location from instructor_t;
#3)
select courseID from grade_t where grade = "A" and studentID = 268300458;*/

    
    

