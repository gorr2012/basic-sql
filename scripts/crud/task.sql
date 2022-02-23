-- CRUD for task

-- CREATE
INSERT INTO task (name, course_id, start_date, end_date)
VALUES ('Variables JS', 1, '2022-01-10T04:08:16.000Z', '2022-03-11T18:41:46.000Z');

-- READ
SELECT * FROM task WHERE id = 51

SELECT
	t.id,
	t.name,
	t.course_id,
	c.name,
	count(st.student_id) as students,
	array_agg(distinct s."name") as students_names
FROM task t
JOIN course c ON c.id = t.course_id
JOIN student_task st ON st.task_id = t.id
JOIN student s ON s.id = st.student_id 
WHERE st.score > 0 AND st.finish_date <= t.end_date
GROUP BY 
	t.id,
	t.name,
	t.course_id,
	c.name

-- UPDATE
UPDATE task SET name='Variables in JS', start_date='2022-02-01T04:08:16.000Z', end_date='2022-04-01T18:41:46.000Z' WHERE id=51

-- DELETE
DELETE FROM task WHERE id = 51;
