-- CRUD for course

-- CREATE
INSERT INTO course (name, start_date, end_date) VALUES ('PHP', '2022-01-01T04:08:16.000Z', '2022-03-01T18:41:46.000Z');

-- READ
SELECT
	c.id,
	c.name as course_name,
	c.start_date,
	c.end_date,
	count(distinct cs.student_id) as count_students,
	array_agg(distinct t.name) as tasks
FROM course c
LEFT JOIN task t ON t.course_id = c.id
LEFT JOIN course_student cs ON cs.course_id = c.id
group by 
	c.id,
	course_name,
	c.start_date,
	c.end_date

-- UPDATE
UPDATE course SET name='PHP and XAMP', start_date='2022-02-01T04:08:16.000Z', end_date='2022-04-01T18:41:46.000Z' WHERE id=6

-- DELETE
DELETE FROM course WHERE id = 6;
