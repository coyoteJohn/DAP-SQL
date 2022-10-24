DROP TABLE DEPARTMENTS;

CREATE TABLE Departments
    (DepartmentId int
    , DepartmentName text
    )

-- Insert one row:

INSERT INTO Departments 
    (DepartmentId
    , DepartmentName)
VALUES (1, "IT");

-- Insert two rows:

INSERT INTO Departments 
    (DepartmentId
    , DepartmentName)
VALUES (2, "Arts")
        ,(3,"Spanish");

-- Insert many rows:

INSERT INTO Departments 
    (DepartmentId
    , DepartmentName)
VALUES(4, "History")
        ,(5,"Science")
        ,(6, "Band")
        ,(7,"StudyHall");

SELECT *
    FROM Departments;
