SELECT
	s.id,
	s.name,
	s.email,
	s.origin,
	sum(st.score) as total_score
FROM student s
JOIN student_task st ON s.id = st.student_id
JOIN task t ON t.id = st.task_id
JOIN course c ON c.id = t.course_id
WHERE c.name = 'Typescript'
AND now() + interval '1 month' > c.end_date
AND now() < c.end_date
AND st.score IS NOT NULL
GROUP BY
	s.id,
	s.name,
	s.email,
	s.origin
ORDER BY total_score DESC;
