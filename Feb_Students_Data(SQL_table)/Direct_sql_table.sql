/* In this file I will create a 
SQL table and insert data in that table 
using SQL code(not importing this time) 
*/

CREATE TABLE feb_students(
    Student_ID INTEGER,
    Name Varchar(50),
    Course Varchar(10),
    Marks INTEGER, 
    Admission_Date DATE
); 

INSERT INTO feb_students
(Student_ID, Name, Course, Marks, Admission_Date)
VALUES
(201, 'Aditya Pratap Singh', 'BCA', 830, '21-02-2022'),
(202, 'Aditya Chaudhary', 'BCA', 710, '08-02-2022'),
(203, 'Utkarsh Singh', 'B.Tech', 768, '15-02-2023'),
(204, 'Shivam Mahajan', 'BCA', 810, '27-02-2023'),
(205, 'Herish Balyan', 'BCA', 750, '24-02-2024'),
(206, 'Gaurav Rajpur', 'B.Pharma', 820, '13-02-2023'); 


SELECT * FROM feb_students;