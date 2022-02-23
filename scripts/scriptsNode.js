const fs = require( "fs" );

// let array = ``.split(';');

// const cities = ['Minsk', 'Grodno', 'Gomel', 'Pinsk', 'Vitebsk', 'Mogilev', 'Lida', 'Baranovichi', 'Soligorsk'];
// const arrayWithCities = array.map((q, i) => q.replace('Afganistan', cities[i % 9]).replace('2222', i+1));

const getRandomIntInclusive = (min, max) => {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

const startsTasks = ['2022-01-16T04:08:16Z', '2022-02-10T12:02:00Z', '2022-01-31T18:30:08Z', '2022-02-21T04:14:17Z', '2021-11-30T21:09:29Z'];

// const arrayWithCities = array.map((q, i) => {
//   const startDate = new Date(startsTasks[i % 5]);
//   return q
//     .replace('2222', i+1 )
//     .replace('start1', startDate.toISOString())
//     .replace('end1', new Date(startDate.setDate(startDate.getDate() + getRandomIntInclusive(10, 35) )).toISOString())
// });

// const arrayWithCities = array.map((q, i) => q.replace('3333', i+1).replace('2222', i % 5 || 5));

const arrayWithCities = [];

for (let j = 0; j < 5; j++) {
  const startCountStudents = j + 1;
  for (let index = startCountStudents; index < 50; index = index + 5) {
    const startDate = new Date(startsTasks[index % 5]);
    for (let i = startCountStudents; i <= 100; i = i +5) {
      const score = getRandomIntInclusive(0, 10) < 5 ? null : getRandomIntInclusive(0, 10);
      const finishDate = score === null ? null : `'${new Date(startDate.setDate(startDate.getDate() +  getRandomIntInclusive(1, 10))).toISOString()}'`;
      arrayWithCities.push(
        `insert into student_course_task (student_id, task_id, score, finish_date) values (${i % 100 || 100}, ${index}, ${score}, ${finishDate})`
        );
    }
  }
}

const stream = fs.createWriteStream('./scripts/inserts/student_task.sql');
stream.write(arrayWithCities.join(';\n'));

