import 'package:flutter/material.dart';

class FormationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formations en Informatique'),
        backgroundColor: Color(0xFF1900FD), // Couleur de l'application universitaire
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormationCard(
              title: 'Développement Web',
              description:
                  'Apprenez à créer des sites Web interactifs et responsifs avec les dernières technologies front-end et back-end.',
              imageAsset: 'assets/dev.png', // Chemin de l'image depuis les assets
            ),
            FormationCard(
              title: 'Réseau Informatique',
              description:
                  'Maîtrisez les concepts de réseaux, configurez des routeurs, commutateurs et assurez la sécurité des données.',
              imageAsset: 'assets/reseau.png', // Chemin de l'image depuis les assets
            ),
            // Ajoutez d'autres formations ici
          ],
        ),
      ),
    );
  }
}

class FormationCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  FormationCard({
    required this.title,
    required this.description,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imageAsset, // Image depuis les assets
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Ajoutez l'action à effectuer lorsque le bouton est pressé
                  },
                  child: Text('En savoir plus'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
