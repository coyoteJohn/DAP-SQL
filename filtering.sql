-- --------------------------------------------------------
-- Like - Basic pattern matching
-- --------------------------------------------------------

select StudentName 
    from Students s
    where s.StudentName like 'm%';

select StudentName 
    from Students s
    where s.StudentName like '%n';

-- --------------------------------------------------------
-- GLOB - Unix style pattern matching
-- This is not implimented in other SQL engines I work with
-- --------------------------------------------------------

SELECT 1 where 'Mariah' GLOB 'm%';

SELECT 1 where 'Mariah' LIKE 'm%';

-- Notice that a select statement does not need any other
-- clauses.

SELECT 1;

-- --------------------------------------------------------
-- Where ... and, or, and both
-- --------------------------------------------------------
-- and

select s.StudentName
    ,s.StudentId
    from Students s
        where s.StudentID > 5
            and s.StudentName like 'm%';

-- or

select s.StudentName
    ,s.StudentId
    from Students s
        where s.StudentID > 5
            or s.StudentName like 'm%'

-- both

select s.StudentName
    ,s.StudentId
    from Students s
        where s.StudentID > 5
            and s.StudentName like 'm%'
            or s.StudentName like 's%'
            
-- with parens

select s.StudentName
    ,s.StudentId
    from Students s
        where s.StudentID > 5
            and (s.StudentName like 'm%'
            or s.StudentName like 's%');

-- --------------------------------------------------------
-- Range based filtering
-- --------------------------------------------------------

select s.StudentName as "Student Name"
    ,c.SubjectName as "Class"
    ,g.Grade as 'Result'
    from Grades g
        inner join Students s
            on g.StudentId = s.StudentId
        inner join Subjects C --classes
            on g.SubjectId = c.SubjectId
    where g.Grade between 80 and 90;

-- Caveat Emptor

select s.StudentName as "Student Name"
    ,c.SubjectName as "Class"
    ,g.Grade as 'Result'
    from Grades g
        inner join Students s
            on g.StudentId = s.StudentId
        inner join Subjects C --classes
            on g.SubjectId = c.SubjectId
    where g.Grade >= 80 
        and g.Grade <= 90;




