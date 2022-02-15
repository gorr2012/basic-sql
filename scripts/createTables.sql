CREATE TABLE student (
  id SERIAL PRIMARY KEY,
  name text NOT NULL,
  email text,
  birth DATE,
  origin VARCHAR (255)
)

CREATE TABLE course (
  id SERIAL PRIMARY KEY,
  name text NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
)

CREATE TABLE task (
  id SERIAL PRIMARY KEY,
  course_id SERIAL REFERENCES course ON DELETE CASCADE,
  name text NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
)

CREATE TABLE student_course (
  student_id SERIAL REFERENCES student ON DELETE CASCADE,
  course_id SERIAL REFERENCES course ON DELETE CASCADE,
)

CREATE TABLE student_task (
  student_id SERIAL REFERENCES student ON DELETE CASCADE,
  task_id SERIAL REFERENCES task ON DELETE CASCADE,
  name text NOT NULL,
  score int,
  finish_date DATE NOT NULL default CURRENT_DATE
)
