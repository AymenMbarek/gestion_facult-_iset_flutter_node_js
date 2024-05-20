import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:isettozeur/acc.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController cinController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedUserType = 'Student';

  Future<void> _login(BuildContext context) async {
    final cin = cinController.text;
    final password = passwordController.text;

    if (cin.isEmpty || password.isEmpty) {
      // Show an error message if CIN or Password is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('CIN and Password cannot be empty'),
        ),
      );
      return;
    }

    // Fetch data from both endpoints
    final etudiantUrl = Uri.parse('http://localhost:5050/etudiant');
    final enseignantUrl = Uri.parse('http://localhost:5050/enseignant');

    try {
      final etudiantResponse = await http.get(etudiantUrl);
      final enseignantResponse = await http.get(enseignantUrl);

      if (etudiantResponse.statusCode == 200 && enseignantResponse.statusCode == 200) {
        final etudiantData = jsonDecode(etudiantResponse.body);
        final enseignantData = jsonDecode(enseignantResponse.body);

        bool isValidUser = false;

        // Check if the user is a student
        if (selectedUserType == 'Student') {
          isValidUser = etudiantData.any((user) => user['cin'].toString() == cin && user['password'] == password);
        } 
        // Check if the user is a teacher
        else {
          isValidUser = enseignantData.any((user) => user['cin'].toString() == cin && user['password'] == password);
        }

        if (isValidUser) {
          // Navigate to the AccPage if login is successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccPage()),
          );
        } else {
          // Show an error message if login failed
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid CIN or Password'),
            ),
          );
        }
      } else {
        // Show an error message if the server returned an error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Server error. Please try again later.'),
          ),
        );
      }
    } catch (error) {
      // Show an error message if there was an issue with the request
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ISET de Tozeur'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/welcome.png',
                width: 250.0,
                height: 250.0,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20.0),
              Text(
                'Welcome to our application \n Iset Tozeur',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: cinController,
                  decoration: InputDecoration(
                    labelText: 'CIN',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: DropdownButton<String>(
                  value: selectedUserType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedUserType = newValue!;
                    });
                  },
                  items: <String>['Student', 'Teacher']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 26, 255),
                ),
                child: Text('Se connecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
