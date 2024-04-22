import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedDepartment = 'Technologie Informatique';
  String _selectedClass = '1ère';

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();





  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Êtes-vous sûr de vouloir enregistrer les informations ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Enregistrer'),
              onPressed: () {
                // Sauvegardez les informations du formulaire
                final name = _nameController.text;
                
                final email = _emailController.text;
                final address = _addressController.text;

                print('Nom: $name');
                
                print('Email: $email');
                print('Adresse: $address');
                print('Département: $_selectedDepartment');
                print('Classe: $_selectedClass');

                // Fermez la boîte de dialogue
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Étudiant'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Informations Personnelles',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                ),
              ),
              SizedBox(height: 16.0),
          
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Adresse Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Adresse',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Mot de Passe',
                ),
              ),
              SizedBox(height: 16.0),
             
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Affichez la boîte de dialogue de confirmation
                  _showConfirmationDialog();
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


