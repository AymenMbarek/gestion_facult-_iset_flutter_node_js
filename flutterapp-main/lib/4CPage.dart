import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Modèle pour représenter les notes des étudiants
class Grade {
  final int id;
  final int studentId;
  final int courseId;
  final double grade;
  final String semester;

  Grade({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.grade,
    required this.semester,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      id: json['id'],
      studentId: json['student_id'],
      courseId: json['course_id'],
      grade: json['grade'].toDouble(),
      semester: json['semester'],
    );
  }
}

// Page principale du Club 4C avec affichage des notes
class FourCClubPage extends StatefulWidget {
  @override
  _FourCClubPageState createState() => _FourCClubPageState();
}

class _FourCClubPageState extends State<FourCClubPage> {
  Future<List<Grade>> fetchGrades() async {
    final response = await http.get(Uri.parse('http://localhost:5050/grades'));

    if (response.statusCode == 200) {
      List<dynamic> gradesJson = json.decode(response.body);
      return gradesJson.map((json) => Grade.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load grades');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Notes'),
        backgroundColor: Color(0xFF001AFF), // Couleur du club 4C
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/4c.png', // Chemin de votre image du logo du club 4C
              width: 150.0, // Largeur du logo
              height: 150.0, // Hauteur du logo
            ),
            SizedBox(height: 20.0),
            Text(
              'Bienvenue au Iset Tozeur',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Administration Iset Tozeur',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: FutureBuilder<List<Grade>>(
                future: fetchGrades(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  return DataTable(
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Student ID')),
                      DataColumn(label: Text('Course ID')),
                      DataColumn(label: Text('Grade')),
                      DataColumn(label: Text('Semester')),
                    ],
                    rows: snapshot.data!
                        .map(
                          (grade) => DataRow(cells: [
                            DataCell(Text(grade.id.toString())),
                            DataCell(Text(grade.studentId.toString())),
                            DataCell(Text(grade.courseId.toString())),
                            DataCell(Text(grade.grade.toString())),
                            DataCell(Text(grade.semester)),
                          ]),
                        )
                        .toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
