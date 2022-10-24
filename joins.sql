-- --------------------------------------------------------
-- Inner Join
-- --------------------------------------------------------

-- Grades and Students

select * 
    from Grades g
    inner join Students s
        on g.StudentId = s.StudentId
    inner join Subjects C --classes
        on g.SubjectId = c.SubjectId
        ;

-- Grades and Students
-- Pertinent columns only

select s.StudentName
    ,c.SubjectName
    ,g.Grade 
    from Grades g
    inner join Students s
        on g.StudentId = s.StudentId
    inner join Subjects c --classes
        on g.SubjectId = c.SubjectId
        ;

-- Grades and Students
-- Renaming columns

select s.StudentName as "Student Name"
    ,c.SubjectName as "Class"
    ,g.Grade as 'Result'
    from Grades g
    inner join Students s
        on g.StudentId = s.StudentId
    inner join Subjects C --classes
        on g.SubjectId = c.SubjectId
        ;

-- --------------------------------------------------------
-- Left Join
-- --------------------------------------------------------

-- All Students and the classes they are registered for (if any)

select s.StudentName as "Student Name"
    ,c.SubjectName as "Class"
    ,g.Grade as 'Result'
    from Students s
        left join Grades g
            on s.StudentId = g.StudentId
        left join Subjects C --classes
            on g.SubjectId = c.SubjectId
        ;

-- --------------------------------------------------------
-- Right Join
-- --------------------------------------------------------

-- No, just... No.

-- I mean it!

