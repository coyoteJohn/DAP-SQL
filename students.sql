DROP TABLE Students;

CREATE TABLE "Students" (
	"StudentId"	INTEGER NOT NULL,
	"StudentName"	TEXT,
	PRIMARY KEY("StudentId")
)

INSERT INTO Students 
    (StudentId
    , StudentName)
VALUES (1,'Sarah')
        ,(2,'Maria')
        ,(3,'Brandon')
        ,(4,'Stephen')
        ,(5,'Ronnie')
        ,(6,'Matthew')
        ,(7,'Mariah')
        ,(8,'Ray')
        ,(9,'Brandi')
        ,(10,'Hunter')
        ,(11,'Sophia');

SELECT *
    FROM Students;

-- --------------------------------------------------------
-- Update exercise
-- Notice SQLite is not case sensitive
-- --------------------------------------------------------

update students
    set StudentName = 'Steve' 
    where StudentId = 4;

SELECT *
    FROM Students;
