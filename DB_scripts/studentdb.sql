drop database if exists studentdb;
create database studentdb;
use studentdb;

CREATE TABLE student(
    student_id int NOT NULL AUTO_INCREMENT,
    firstname varchar(50) NOT NULL,
    lastname varchar(50) NOT NULL,
    credits int NOT NULL,
    PRIMARY KEY (student_id)
);

CREATE TABLE course(
    course_id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    credits int NOT NULL,
    PRIMARY KEY (course_id)
);

CREATE TABLE course_attendance(
    student_id int NOT NULL,
    course_id int NOT NULL,
    grade enum('0','1','2','3','4','5', 'K', 'H'),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO student (firstname, lastname, credits) VALUES 
    ("John", "Doe",0), ("Lisa", "Simpson",5), ("Marco", "Polo",5), ("Donald", "Duck",20),
    ("Julia", "Roberts",35), ("Mandy", "Monroe",25), ("Jack", "Black", 5);


INSERT INTO course (name, credits) VALUES 
    ("Engineering English", 3), ("HTML and CSS programming",5), ("Object Oriented Programming",5),
    ("Web Programming Project", 10), ("Cloud Services", 5), ("Working Life Skills", 3);


INSERT INTO course_attendance (student_id, course_id, grade) VALUES
    (1, 1, null), (1, 5, '3'), (1, 6, '4'), (2, 4, '5'), (2, 1, '2'),  (3, 4, null), (3, 5, null), (3, 6, '3'), 
    (4,2,'2'),(5,6, '1'), (7,1, null);
    
    