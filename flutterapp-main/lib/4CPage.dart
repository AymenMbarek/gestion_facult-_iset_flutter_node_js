import 'package:flutter/material.dart';

class FourCClubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Club 4C'),
        backgroundColor: Color(0xFF001AFF), // Couleur du club 4C
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/4c.png', // Chemin de votre image du logo du club 4C (assurez-vous que le chemin est correct)
              width: 150.0, // Largeur du logo
              height: 150.0, // Hauteur du logo
            ),
            SizedBox(height: 20.0),
            Text(
              'Bienvenue au Club 4C',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Centre de Carrières et de Certification des Compétences de l\'ISET Tozeur',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'À propos du Centre:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Le Centre 4C est un Centre pour étudiants dédié à la créativité, la communication, la culture et le codage. Nous organisons des ateliers, des événements et des activités pour les étudiants intéressés par ces domaines. Rejoignez-nous pour développer vos compétences et rencontrer d\'autres passionnés!',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Mettez ici l'action que vous souhaitez exécuter lorsque le bouton est pressé
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color(0xFF001AFF), // Couleur du texte du bouton
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              child: Text(
                'Rejoindre le Club',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
