/* We have created 2 fact tables "jan_students", "feb_students", 
and a dimension table "courses".

/* REST OF THE WORK WILL BE DONE HERE(any kind of transformation,
   verification, analysis, etc) 
*/


SELECT * FROM jan_students;

/* The INSERT statement for the jan_students table was accidentally 
executed twice, which resulted in duplicate rows being inserted.

In a production scenario, this issue would normally be prevented by 
enforcing a PRIMARY KEY or UNIQUE constraint on the student_id column 

But this project is more about flexing skills
*/

-- we will delete duplicate rows using CTID 

DELETE FROM jan_students
WHERE ctid NOT IN(
    SELECT MIN(ctid)
    FROM jan_students
    GROUP BY student_id
);

SELECT * FROM jan_students;

-- Issue 1 solved...........................
----------------------------------------------------------------------

/* Now I will ALTER tables. 
    */

ALTER TABLE courses
ADD CONSTRAINT pk_course_id
PRIMARY KEY(course_id);

ALTER TABLE jan_students
ADD COLUMN course_id INTEGER;

UPDATE jan_students
SET course_id = CASE
WHEN course ='BCA' THEN 1
WHEN course = 'BBA' THEN 2
WHEN course = 'B.Tech' THEN 3
WHEN course = 'B.Com' THEN 4
WHEN course = 'B.Pharma' THEN 5
END;

ALTER TABLE jan_students
DROP COLUMN course;

ALTER TABLE jan_students
ADD CONSTRAINT fk_jan_students_courseID
FOREIGN KEY(course_id)
REFERENCES courses(course_id);

--...............................................................


-- Now same transformation for the fab_students table

ALTER TABLE feb_students
ADD COLUMN course_id INTEGER, 
ADD CONSTRAINT fk_feb_students_courseID
FOREIGN KEY (course_id)
REFERENCES courses(course_id);

UPDATE feb_students AS fs 
SET course_id = c.course_id
FROM courses C
WHERE fs.course = c.course_name;

ALTER TABLE feb_students
DROP COLUMN course;

SELECT * FROM feb_students; --Verification.

-- .........................We are all good............................


/*
Q1- Find the details of the students enrolled in the 'BCA' course
who have scored higher than the average marks calculated across
both student tables combined.
*/


SELECT name, course_name, marks 
FROM jan_students AS JS
LEFT JOIN courses AS C
ON JS.course_id = C.course_id

WHERE course_name = 'BCA'
AND
marks>
(SELECT AVG(marks) FROM
(SELECT marks FROM jan_students
UNION ALL
SELECT marks FROM feb_students)
AS combines_marks_avg)



UNION ALL



SELECT name, course_name, marks
FROM feb_students AS FS
LEFT JOIN courses AS C
ON FS.course_id = C.course_id

WHERE course_name = 'BCA'
AND
marks>
    (SELECT AVG(marks) FROM 
    (SELECT marks FROM jan_students
    UNION ALL
    SELECT marks FROM feb_students
     ) AS combined_marks_avg)


/* 
Insights- 
   - We have found the top BCA students relative to 
     the whole database/college.
   
   - Which BCA students stand out even when compared with 
     the students from all other courses.
     */

/* If we have to find the top students(the students who scored above average),
   then we can just remove course_name filter from 'WHERE' clause. */

-- We can solve this problem using CTEs as well.
