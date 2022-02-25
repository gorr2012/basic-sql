-- CRUD for task

-- CREATE
INSERT INTO task (name, course_id, start_date, end_date)
VALUES ('Variables JS', 1, '2022-01-10T04:08:16.000Z', '2022-03-11T18:41:46.000Z');

-- READ
SELECT
	t.id,
	t.name as task_name,
	c.name as course_name,
	count(distinct st.student_id) FILTER (WHERE st.score IS NOT NULL) as students
FROM task t
LEFT JOIN course c ON c.id = t.course_id
LEFT JOIN student_task st ON st.task_id = t.id
GROUP BY 
	t.id,
	task_name,
	course_name

-- UPDATE
UPDATE task SET name='Variables in JS', start_date='2022-02-01T04:08:16.000Z', end_date='2022-04-01T18:41:46.000Z' WHERE id=51

-- DELETE
DELETE FROM task WHERE id = 51;
