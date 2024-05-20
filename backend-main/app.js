const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const port = 5050;
app.use(bodyParser.json());
app.use(cors());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'isett2'
});

db.connect(err => {
  if (err) {
    console.error('Erreur de connexion à la base de données : ' + err.stack);
    return;
  }
  console.log('Connecté à la base de données MySQL');
});


app.get('/', (req, res) => {
  res.send('Welcome to the API');
});


app.get('/etudiant', (req, res) => {
  const query = 'SELECT * FROM etudiant';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

app.post('/etudiant', async (req, res) => {
  const { cin, nom, prenom, numtel, email, department, classe, password } = req.body;
  try {
    await pool.query('INSERT INTO etudiant (cin, nom, prenom, numtel, email, department, classe, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', [cin, nom, prenom, numtel, email, department, classe, password]);
    res.status(201).json({ message: 'Student added successfully' });
  } catch (error) {
    console.error('Error adding student:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});



app.get('/enseignant', (req, res) => {
  const query = 'SELECT * FROM enseignant';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});


app.post('/enseignant', async (req, res) => {
  const { cin, nom, prenom, email, department, password } = req.body;
  try {
    await pool.query('INSERT INTO enseignant (cin, nom, prenom, email, department, password) VALUES (?, ?, ?, ?, ?, ?)', [cin, nom, prenom, email, department, password]);
    res.status(201).json({ message: 'Teacher added successfully' });
  } catch (error) {
    console.error('Error adding teacher:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Ajouter d'autres routes pour les cours, les départements, les notifications, les examens, les événements, etc.
// Route pour récupérer tous les cours


app.get('/courses', (req, res) => {
  const query = 'SELECT * FROM courses';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});



// Route pour ajouter un cours
app.post('/courses', async (req, res) => {
  const { nom, department, classe, enseignant_id } = req.body;
  try {
    await pool.query('INSERT INTO courses (nom, department, classe, enseignant_id) VALUES (?, ?, ?, ?)', [nom, department, classe, enseignant_id]);
    res.status(201).json({ message: 'Course added successfully' });
  } catch (error) {
    console.error('Error adding course:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});



app.get('/departments', (req, res) => {
  const query = 'SELECT * FROM departments';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Route pour ajouter un département
app.post('/departments', async (req, res) => {
  const { nom } = req.body;
  try {
    await pool.query('INSERT INTO departments (nom) VALUES (?)', [nom]);
    res.status(201).json({ message: 'Department added successfully' });
  } catch (error) {
    console.error('Error adding department:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});



app.get('/department_notifications', (req, res) => {
  const query = 'SELECT * FROM department_notifications';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Route pour ajouter une notification de département
app.post('/department_notifications', async (req, res) => {
  const { department_id, message } = req.body;
  try {
    await pool.query('INSERT INTO department_notifications (department_id, message) VALUES (?, ?)', [department_id, message]);
    res.status(201).json({ message: 'Department notification added successfully' });
  } catch (error) {
    console.error('Error adding department notification:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});




app.get('/exams', (req, res) => {
  const query = 'SELECT * FROM exams';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});
// Route pour ajouter un examen
app.post('/exams', async (req, res) => {
  const { nom, exam_date, description } = req.body;
  try {
    await pool.query('INSERT INTO exams (nom, exam_date, description) VALUES (?, ?, ?)', [nom, exam_date, description]);
    res.status(201).json({ message: 'Exam added successfully' });
  } catch (error) {
    console.error('Error adding exam:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});



app.get('/events', (req, res) => {
  const query = 'SELECT * FROM events';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Route pour ajouter un événement
app.post('/events', async (req, res) => {
  const { nom, event_date, description } = req.body;
  try {
    await pool.query('INSERT INTO events (nom, event_date, description) VALUES (?, ?, ?)', [nom, event_date, description]);
    res.status(201).json({ message: 'Event added successfully' });
  } catch (error) {
    console.error('Error adding event:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/grades', (req, res) => {
    let query = 'SELECT * FROM grades';
    const { student_id, course_id, semester } = req.query;

    let conditions = [];
    if (student_id) conditions.push(`student_id = ${mysql.escape(student_id)}`);
    if (course_id) conditions.push(`course_id = ${mysql.escape(course_id)}`);
    if (semester) conditions.push(`semester = ${mysql.escape(semester)}`);

    if (conditions.length > 0) {
        query += ' WHERE ' + conditions.join(' AND ');
    }

    db.query(query, (err, results) => {
        if (err) return res.status(500).json({ error: 'Internal Server Error', details: err });
        res.json(results);
    });
});

app.post('/grades', async (req, res) => {
    const { student_id, course_id, grade, semester } = req.body;
    const query = 'INSERT INTO grades (student_id, course_id, grade, semester) VALUES (?, ?, ?, ?)';
    
    db.query(query, [student_id, course_id, grade, semester], (error, results) => {
        if (error) {
            console.error('Error adding grade:', error);
            return res.status(500).json({ error: 'Internal Server Error', details: error });
        }
        res.status(201).json({ message: 'Grade added successfully', gradeId: results.insertId });
    });
});


app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
