import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String selectedDepartment = 'Génie Civil';
  String selectedClass = '1ère année';
  String title = '';
  String description = '';

  final List<String> departments = [
    'Génie Civil',
    'Technologie Informatique',
    'Génie Mécanique',
    'Génie Électrique',
  ];

  final List<String> classes = [
    '1ère année',
    '2ème année',
    '3ème année',
    'Master',
    'À tout',
  ];

  Future<void> fetchData(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('http://localhost:5050/$endpoint'));

      if (response.statusCode == 200) {
        // Handle the response data accordingly
        print('Data from $endpoint: ${jsonDecode(response.body)}');
      } else {
        print('Failed to fetch data from $endpoint. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data from $endpoint: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'Administration'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Changer la couleur de la barre d'applications
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  value: selectedDepartment,
                  items: departments.map((String department) {
                    return DropdownMenuItem<String>(
                      value: department,
                      child: Text(department),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedDepartment = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Département',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 245, 240, 240), // Changer la couleur de fond
                  ),
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: selectedClass,
                  items: classes.map((String classItem) {
                    return DropdownMenuItem<String>(
                      value: classItem,
                      child: Text(classItem),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedClass = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Classe',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 245, 240, 240),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Titre',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 245, 240, 240),
                  ),
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 245, 240, 240),
                  ),
                  maxLines: 3,
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Ajouter la logique pour enregistrer la notification ici
                    print('Département: $selectedDepartment');
                    print('Classe: $selectedClass');
                    print('Titre: $title');
                    print('Description: $description');
                  },
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Changer la couleur du bouton
                    padding: EdgeInsets.all(16.0),
                    shadowColor: Colors.grey,
                    elevation: 5.0,
                  ),
                ),
                SizedBox(height: 16.0),
               ElevatedButton(
  onPressed: () => fetchData('enseignant'),
  child: Text('Enseignants Data'),
  style: ElevatedButton.styleFrom(
     foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
    minimumSize: Size(double.infinity, 50), // Set a minimum button size
  ),
),
SizedBox(height: 16.0), // Add this SizedBox to create space
ElevatedButton(
  onPressed: () => fetchData('courses'),
  child: Text('Courses Data'),
  style: ElevatedButton.styleFrom(
     foregroundColor: Colors.white, backgroundColor: Colors.blue,
    minimumSize: Size(double.infinity, 50),
  ),
),
SizedBox(height: 16.0), // Add this SizedBox to create space
ElevatedButton(
  onPressed: () => fetchData('departments'),
  child: Text('Departments Data'),
  style: ElevatedButton.styleFrom(
     foregroundColor: Colors.white, backgroundColor: Colors.blue,
    minimumSize: Size(double.infinity, 50),
  ),
),
SizedBox(height: 16.0), // Add this SizedBox to create space
ElevatedButton(
  onPressed: () => fetchData('department_notifications'),
  child: Text('Department Notifications Data'),
  style: ElevatedButton.styleFrom(
     foregroundColor: Colors.white, backgroundColor: Colors.blue,
    minimumSize: Size(double.infinity, 50),
  ),
),
SizedBox(height: 16.0), // Add this SizedBox to create space
ElevatedButton(
  onPressed: () => fetchData('exams'),
  child: Text('Exams Data'),
  style: ElevatedButton.styleFrom(
     foregroundColor: Colors.white, backgroundColor: Colors.blue,
    minimumSize: Size(double.infinity, 50),
  ),
),
SizedBox(height: 16.0), // Add this SizedBox to create space
ElevatedButton(
  onPressed: () => fetchData('events'),
  child: Text('Events Data'),
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.blue,
    minimumSize: Size(double.infinity, 50),
  ),
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
