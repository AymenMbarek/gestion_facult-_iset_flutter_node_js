# isettozeur

A new Flutter project for Iset Tozeur .

## Getting Started
 ### ressource code 
 https://github.com/ChetouiArij11/FlutterProjectIsetApp.git

## Get Started preparation 

### Step 1: Project Setup
1. **Create Flutter Project:**
   - Use the Flutter CLI to create a new project.
     ```bash
     flutter create isett
     cd isett
     ```

2. **Set Up Project Structure:**
            ```
   -- Database: Isett

-- DROP DATABASE IF EXISTS "Isett";

CREATE DATABASE "Isett"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'French_France.1252'
    LC_CTYPE = 'French_France.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "Isett"
    IS 'project Iset Tozeur ';

    CREATE TABLE Etudiant (
    Cin SERIAL PRIMARY KEY,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    NumTel VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Department VARCHAR(50),
    Classe VARCHAR(50)
);
CREATE TABLE enseignant (
    cin SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    department VARCHAR(50)
);
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    department VARCHAR(50),
    classe VARCHAR(50),
    enseignant_id INT REFERENCES enseignant(cin)
);
CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    etudiant_id INT REFERENCES etudiant(cin),
    course_id INT REFERENCES courses(id)
    
);
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    recipient_id INT, -- References either student_id or teacher_id based on the recipient type
    recipient_type VARCHAR(10), -- 'student' or 'teacher'
    message TEXT,
    date_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
);
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) UNIQUE
   
);
CREATE TABLE events (
   	id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    event_date DATE,
    description TEXT
    
);
CREATE TABLE department_notifications (
    id SERIAL PRIMARY KEY,
    department_id INT REFERENCES departments(id),
    message TEXT,
    date_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
);
             ```

### Step 2: User Authentication
3. **Implement User Authentication:**
   - Integrate a user authentication system using Firebase Authentication or any other authentication service.
   - Allow students, teachers, and administrators to register and log in.

### Step 3: User Profiles
4. **Create User Profiles:**
   - Develop user profiles for students, teachers, and administrators.
   - Store user information in a database (Firebase Firestore, SQLite, or any database of your choice).

### Step 4: Student-Teacher Interaction
5. **Implement Messaging:**
   - Create a messaging system to facilitate communication between students and teachers.
   - Allow students to ask questions and receive answers from teachers.

### Step 5: Administration Features
6. **Admin Panel:**
   - Develop an admin panel for managing courses, schedules, and notifications.
   - Provide CRUD (Create, Read, Update, Delete) operations for courses and notifications.

### Step 6: Course Management
7. **Course Information:**
   - Implement a feature for students to view course details, schedules, and materials.
   - Allow teachers to upload course materials.

### Step 7: Exam Schedule
8. **Calendar and Exam Schedule:**
   - Create a calendar to display exam schedules.
   - Implement notifications for upcoming exams and events.

### Step 8: Department-specific Features
9. **Department Differentiation:**
   - Differentiate features based on departments (if applicable).
   - Tailor notifications and course information according to the user's department.

### Step 9: Testing
10. **Test the Application:**
    - Perform unit testing and integration testing to ensure the application functions as expected.

### Step 10: Deployment
11. **Deploy the Application:**
    - Choose an appropriate deployment platform (Google Play Store for Android, App Store for iOS).
    - Follow the deployment guidelines for the chosen platform.

### Step 11: Continuous Improvement
12. **Gather Feedback:**
    - Release the application to a limited audience and gather feedback.
    - Use feedback to make improvements and add additional features.

### Additional Tips:
- **Documentation:**
  - Document your code and project structure for future reference.
- **Version Control:**
  - Use a version control system like Git to track changes.
