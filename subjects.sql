DROP TABLE SUBJECTS;

CREATE TABLE "Subjects" (
    "SubjectId"    INTEGER,
    "SubjectName"    TEXT,
    "DepartmentID"    INTEGER,
    PRIMARY KEY("SubjectId")
);

INSERT INTO Subjects (
    SubjectId,
    SubjectName,
    DepartmentID
  )
VALUES( 1,'Python',1)
        ,( 2,'Tableau',1)
        ,( 3,'Painting',2)
        ,( 4,'Spanish for travelers',3)
        ,( 5,'Spanish 200',3)
        ,( 6,'NASA during the Shuttle Era',4)
        ,( 7,'Chemistry',5)
        ,( 8,'Biology',5)
        ,( 9,'Jazz',6)
        ,(10,'Independant Study',7);

SELECT *
    FROM Subjects s;

-- --------------------------------------------------------
-- Alter table exercise
-- --------------------------------------------------------

alter table Subjects add column CreditHours Int;

update subjects set CreditHours = 3 where SubjectId <> 10;

-- Notice that the update is result set based. 
-- Only the rows satisfying the where clause are updated.

select * from subjects;

-- The following returns the table to it's original schema

alter table Subjects drop column CreditHours;