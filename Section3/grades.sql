DROP TABLE Grades;

CREATE TABLE "Grades" (
	"StudentId"	INTEGER NOT NULL,
	"SubjectId"	INTEGER NOT NULL,
	"Grade"	INTEGER
);

-- Notice that the columns are mapped
-- You don't need to insert in order of creation

INSERT INTO Grades 
    (SubjectId
    , StudentId
    , Grade)
VALUES (1,1,85)
        ,(3,1,90)
        ,(6,1,78)
        ,(2,2,99)
        ,(4,2,87)
        ,(7,2,77);

SELECT *
    FROM Grades;

-- Active Students don't have grades
-- Notice that you don't need to insert nullable rows

INSERT INTO Grades 
    (SubjectId
    , StudentId
    )
VALUES (1,3)
        ,(2,3)
        ,(5,3)
        ,(3,4)
        ,(4,4)
        ,(10,4);

SELECT *
    FROM Grades;


-- In this example - NULL grades mean that the student is currently enrolled and not yet graded. 