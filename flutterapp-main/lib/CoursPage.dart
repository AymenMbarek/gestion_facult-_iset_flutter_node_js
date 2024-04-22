import 'package:flutter/material.dart';

class CoursPage extends StatelessWidget {
  final List<Course> courses = [
    Course(
      title: 'Culture Entrepreneuriale 2 ',
      professor: 'Ben Belgacem OTHMEN',
      date: '26 Septembre 2023',
      pdfUrl: 'lien_vers_le_pdf1.pdf',
    ),
    Course(
      title: 'Redaction d\'un cahier de charges',
      professor: 'Hedfi SOUHIR',
      date: '22 Septembre 2023',
      pdfUrl: 'lien_vers_le_pdf2.pdf',
    ),
    // Ajoutez d'autres cours ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cours'),
        backgroundColor:  Color.fromARGB(255, 25, 0, 253), // Couleur de l'application universitaire
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseCard(course: courses[index]);
        },
      ),
    );
  }
}

class Course {
  final String title;
  final String professor;
  final String date;
  final String pdfUrl;

  Course({
    required this.title,
    required this.professor,
    required this.date,
    required this.pdfUrl,
  });
}

class CourseCard extends StatelessWidget {
  final Course course;

  CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Professeur: ${course.professor}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Date de partage: ${course.date}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Ajoutez l'action pour télécharger le PDF ici
                  },
                  child: Text('Télécharger le cours PDF'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


