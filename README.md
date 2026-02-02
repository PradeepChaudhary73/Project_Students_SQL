# SMART STUDENTS (Advanced SQL Project 1)

## Introduction
This project focuses on creating, managing, and analyzing a relational database that stores student enrollment(and other) information.  
The database is designed using a **fact–dimension model** and supports analytical SQL queries across multiple datasets.

---

## Database Structure

**Database Name:** `Students_information`

The database consists of **three tables**:
- **2 Fact Tables**
- **1 Dimension Table**

---

## Fact Tables

### 1. jan_students
- Initially created in **Microsoft Excel**
- Saved as a **CSV file**
- A matching table structure was created in the SQL database
- CSV data was imported into the SQL table
- Contains a **foreign key (`course_id`)** referencing the `courses` table

### 2. feb_students
- Created **directly in the SQL database**
- No external data import was used
- Contains a **foreign key (`course_id`)** referencing the `courses` table

**Note:**  
Both fact tables:
- Share the **same schema**
- Store student enrollment(and other) data for **different months (January & February)**

---

## Dimension Table

### courses
- Stores course-related information
- Columns:
  - `course_id` (Primary Key)
  - `course_name`
- The `course_id` column is referenced as a **foreign key** by both fact tables

---
---

## OBJECTIVE

- Identify top-performing BCA students who stand out even when compared with students from other courses.

## SOLUTION

- The database consists of **two fact tables** and **one dimension table**.

- To calculate the overall average marks of all students, marks from both fact tables are combined using `UNION ALL`.  
  The average of this combined result set represents the total average marks across all students.

- This total average is then used in the `WHERE` clause to filter students whose marks are **above the overall average**.

- Since the `course_name` column is not present in either of the fact tables, the fact tables are joined with the dimension table using a `LEFT JOIN` on `course_id` to retrieve the course information.

- The `course_name` obtained from the dimension table is then used in the `WHERE` clause to filter and include only **BCA students**.

## Extras

- Some actions were performed intentionally in a more complex way to showcase additional skills and technical understanding.
- Duplicate rows were removed using PostgreSQL system column `ctid`.

---

## Project Structure Guide (VS Code)

### 📁 Feb_students_Data (SQL_table)
Contains all files related to the February students table.

---

### 📁 January_Students_Data
Includes:
- `January_Students_Data_Custom_CSV_File.csv` – raw January students data
- `SQL_table_structure_for_CSV.sql` – SQL script used to create a table structure matching the CSV file
- `Importing_CSV.sql` – SQL script used to import January students data into the `jan_students` table

---

### 📁 Dimension_Tables
Contains dimension tables, including:
- `courses_dim` – course dimension table

---

### 📄 Final.sql
This file contains the core transformation and analysis logic, including:
- Data transformations
- Creating and dropping columns
- Defining primary keys and foreign keys
- Writing queries to solve the project objectives

---

### 📁 Other Files & Folders
Other files and folders are related to:
- Database creation
- Establishing a connection between PostgreSQL and VS Code
