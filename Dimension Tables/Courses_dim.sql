/* In this file I will create a dimension table
which will have the primary key for course_id 
*/

CREATE TABLE courses(
    course_id INTEGER,
    course_name VARCHAR(10)
);

INSERT INTO courses
(course_id, course_name)
VALUES
(1, 'BCA'),
(2, 'BBA'),
(3, 'B.Tech'),
(4, 'B.Com'),
(5, 'B.Pharma')

SELECT * FROM courses;