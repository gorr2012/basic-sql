CREATE TABLE student(
  id serial PRIMARY KEY,
  name text NOT NULL,
  email text NOT NULL UNIQUE,
  birth timestamptz NOT NULL,
  origin text NOT NULL
);

CREATE TABLE course(
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE,
  start_date timestamptz NOT NULL,
  end_date timestamptz NOT NULL
);

CREATE TABLE task(
  id serial PRIMARY KEY,
  course_id int NOT NULL REFERENCES course ON DELETE CASCADE,
  name text NOT NULL UNIQUE,
  start_date timestamptz NOT NULL,
  end_date timestamptz NOT NULL
);

CREATE TABLE student_course(
  student_id int NOT NULL REFERENCES student ON DELETE CASCADE,
  course_id int NOT NULL REFERENCES course ON DELETE CASCADE
);

CREATE TABLE student_course_task(
  student_id int NOT NULL REFERENCES student ON DELETE CASCADE,
  task_id int NOT NULL REFERENCES task ON DELETE CASCADE,
  course_id int NOT NULL REFERENCES course ON DELETE CASCADE
);

CREATE TABLE student_task(
  student_id int NOT NULL REFERENCES student ON DELETE CASCADE,
  task_id int NOT NULL REFERENCES task ON DELETE CASCADE,
  score int,
  finish_date timestamptz
);
