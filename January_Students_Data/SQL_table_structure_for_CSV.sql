
/* - Creating a table structure 
     which will have the same 
     sturcture(columns with data types) 
     as our CSV file for january students 
     */


CREATE TABLE jan_students(
    Student_ID INTEGER,
    Name VARCHAR(50),
    Course VARCHAR(10),
    Marks INTEGER, 
    Admission_Date DATE
)