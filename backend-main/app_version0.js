//code arij 
const express = require('express');
const bodyParser = require('body-parser');

const { Pool } = require('pg');
const cors = require('cors');
const app = express();
const port = 5050;
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'Isett',
  password: '0000',
  port: 5432,
});

const corsOptions = {
  origin: 'http://127.0.0.1:58565',
  methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
  credentials: true,
  optionsSuccessStatus: 204,
};

app.use(cors(corsOptions));
app.use(bodyParser.json());

app.post('/login/etudiant', async (req, res) => {
  const { cin, password } = req.body;

  try {
    const result = await pool.query('SELECT * FROM etudiant WHERE cin = $1 AND password = $2', [cin, password]);

    if (result.rows.length === 1) {
      res.status(200).json({ success: true, message: 'Student login successful' });
    } else {
      res.status(401).json({ success: false, message: 'Invalid CIN or password for student' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});



// Get all students
app.get('/etudiant', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM etudiant');
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Get all teachers
app.get('/enseignant', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM enseignant');
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Get all courses
app.get('/courses', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM courses');
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Modify courses
/*app.put('/courses/:courseId', async (req, res) => {
  const courseId = req.params.courseId;
  const { nom, department, classe } = req.body;

  try {
    const result = await pool.query(
      'UPDATE courses SET nom = $1, department = $2, classe = $3 WHERE id = $4 RETURNING *',
      [nom, department, classe, courseId]
    );

    if (result.rows.length === 0) {
      res.status(404).json({ error: 'Course not found' });
    } else {
      res.json(result.rows[0]); // Return the modified row
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});*/

// Add courses
/*app.post('/courses', async (req, res) => {
  const { nom, department, classe } = req.body;

  try {
    const result = await pool.query(
      'INSERT INTO courses (nom, department, classe) VALUES ($1, $2, $3) RETURNING *',
      [nom, department, classe]
    );

    res.json(result.rows[0]); // Return the inserted row
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});*/

// Get all departments
app.get('/departments', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM departments');
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});
// Get all department notifications
app.get('/department_notifications', async (req, res) => {
    try {
      const result = await pool.query('SELECT * FROM department_notifications');
      res.json(result.rows);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  // Get all exams
app.get('/exams', async (req, res) => {
    try {
      const result = await pool.query('SELECT * FROM exams');
      res.json(result.rows);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  // Get all events
app.get('/events', async (req, res) => {
    try {
      const result = await pool.query('SELECT * FROM events');
      res.json(result.rows);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });

/*
// Insert sample department notification
app.post('/department_notifications', async (req, res) => {
  const { department_id, message } = req.body;

  try {
    const result = await pool.query(
      'INSERT INTO department_notifications (department_id, message) VALUES ($1, $2) RETURNING *',
      [department_id, message]
    );

    res.json(result.rows[0]); // Return the inserted row
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Insert sample exam
app.post('/exams', async (req, res) => {
  const { course_id, exam_date, exam_type } = req.body;

  try {
    const result = await pool.query(
      'INSERT INTO exams (course_id, exam_date, exam_type) VALUES ($1, $2, $3) RETURNING *',
      [course_id, exam_date, exam_type]
    );

    res.json(result.rows[0]); // Return the inserted row
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Insert sample event
app.post('/events', async (req, res) => {
  const { nom, event_date, description } = req.body;

  try {
    const result = await pool.query(
      'INSERT INTO events (nom, event_date, description) VALUES ($1, $2, $3) RETURNING *',
      [nom, event_date, description]
    );

    res.json(result.rows[0]); // Return the inserted row
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

*/ 

// Login endpoint for students
app.post('/login/etudiant', async (req, res) => {
  const { cin, password } = req.body;

  try {
    const result = await pool.query('SELECT * FROM etudiant WHERE cin = $1 AND password = $2', [cin, password]);

    if (result.rows.length === 1) {
      res.status(200).json({ success: true, message: 'Student login successful' });
    } else {
      res.status(401).json({ success: false, message: 'Invalid CIN or password for student' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Login endpoint for teachers
app.post('/login/enseignant', async (req, res) => {
  const { cin, password } = req.body;

  try {
    const result = await pool.query('SELECT * FROM enseignant WHERE cin = $1 AND password = $2', [cin, password]);

    if (result.rows.length === 1) {
      res.status(200).json({ success: true, message: 'Teacher login successful' });
    } else {
      res.status(401).json({ success: false, message: 'Invalid CIN or password for teacher' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
