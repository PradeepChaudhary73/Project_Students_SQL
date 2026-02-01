
/* In this .sql file we will
   import CSV file data
   into our jan_students table. 
   
   BUT first we will drag and drop
   our CSV file into our January_Students_Data
   folder(on the left) so that it can 
   be easily accessed and it is easy 
   to copy the file path directly from 
   The VS Code whenever we want.
   */ 

COPY jan_students(Student_ID, Name, Course, Marks, Admission_Date)
FROM 'C:\My Professional Work\SQL Work\Project_Students_SQL\January_Students_Data\January_Students_Data_Cutom_CSV_File.csv'
DELIMITER ','
CSV HEADER;