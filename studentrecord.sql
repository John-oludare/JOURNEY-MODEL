-- create database
create database if not exists studentRecord;
use studentRecord;
-- create a students table

create table students (
studentID int,
firstname varchar(255) not null, 
lastname varchar(255) not null,
age int,
email varchar(255) unique not null,
address varchar(255)
);

create table courses(
courseID int primary key,
coursename varchar(100) not null,
instructor varchar(50) not null
);

alter table students  
modify column studentID int auto_increment primary key;

alter table courses
modify column courseID int auto_increment;

create table enrolls(
enrolID int auto_increment primary key,
studentID int,
courseID int, 
enrollDate date
);

select * from enrolls;

-- add foreign key
alter table  enrolls
add constraint foreign key (studentID) references students(studentID);

alter table enrolls
add constraint foreign key (courseID) references courses(courseID);

-- insert into table students
insert into students (firstname, lastname, age, email, address)
values ("ola", "ade", "12", "olaade@gmail.com", null),
	("rala", "fol", "15", "rala@gmail.com", "lagos"),
    ("shaya", "tawo", "23", "shaya.tawo@gmail.com", "ikoyi"),
    ("samba", "con", "21", "sambacon@gmail.com", "lagos") ;
    select * from students;
    
    insert into courses(coursename, instructor)
    values ("data science", "ojo abiodun"),
    ("UI/UX", "Daniel sam");
    select * from courses;
    
    alter table enrolls
    add column amount double default 0.0;
    
    -- insert into eneroll
    insert into enrolls (studentID, courseID, enrollDate, amount)
    values (1, 1, "2023-10-01", 50000),
    (2, 1, "2023-10-05", 70000),
    (3, 2, "2023-10-09", null);
    
    -- analysis on data
    select firstname, lastname
    from students;
    
    select concat(firstname," ",lastname) as "fullname"
    from students;
    
    
    -- find the number of students enrolled in each course
    select coursename, count(students.studentID) as "number of students"
    from students 
   inner join courses on courses.courseID = courses.courseId
    group by coursename;
    
    -- find the course with the highest amount paid so far
    select coursename, max(amount)
    from courses 
    inner join enrolls on courses.courseID = enrolls.courseID
    group by coursename;
    
    
