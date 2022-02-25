-- CRUD for student

-- CREATE
INSERT INTO student (name, email, birth, origin) VALUES ('Rosemonde Pupkin', 'pupkin@pup.com', '1991-08-24T13:56:26.00Z', 'Izhevsk');

-- READ
SELECT
	s.id,
	s.name,
	s.birth,
	s.origin,
	array_agg(c.name) as courses
FROM student s
LEFT JOIN course_student cs ON s.id = cs.student_id 
LEFT JOIN course c ON c.id = cs.course_id
GROUP BY
	s.id,
	s.name,
	s.birth,
	s.origin;

-- UPDATE
UPDATE student SET name= 'Rosemonde Zhopkin', email='zhopkin@pup.com', birth='1991-07-24T13:56:26.00Z', origin='Orsha' WHERE id=101

INSERT INTO course_student (course_id, student_id) VALUES (5, 101);
INSERT INTO course_student (course_id, student_id) VALUES (4, 101);

INSERT INTO student_course_task (course_id, student_id, task_id)
SELECT
    t.course_id as course_id,
    101 as student_id,
    t.id as task_id
FROM task t
WHERE t.course_id = 5;

-- DELETE
DELETE FROM student WHERE id = 101;
