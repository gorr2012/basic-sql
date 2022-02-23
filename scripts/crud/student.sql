-- CRUD for student

-- CREATE
INSERT INTO student (name, email, birth, origin) VALUES ('Rosemonde Pupkin', 'pupkin@pup.com', '1991-08-24T13:56:26.00Z', 'Izhevsk');

-- READ
SELECT * FROM student WHERE id = 101

SELECT
	s.id,
	s.name,
	s.birth,
	s.origin,
	array_agg(c.name) as courses
FROM student s
JOIN course_student cs ON s.id = cs.student_id 
JOIN course c ON c.id = cs.course_id
WHERE s.id = 101
GROUP BY
	s.id,
	s.name,
	s.birth,
	s.origin;

-- UPDATE
UPDATE student SET name= 'Rosemonde Zhopkin', email='zhopkin@pup.com', birth='1991-07-24T13:56:26.00Z', origin='Orsha' WHERE id=101

INSERT INTO course_student (course_id, student_id) VALUES (5, 101);
INSERT INTO course_student (course_id, student_id) VALUES (4, 101);

-- DELETE
DELETE FROM student WHERE id = 101;
