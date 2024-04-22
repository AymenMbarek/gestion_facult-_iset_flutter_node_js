import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualités Universitaires'),
        backgroundColor: Color(0xFF1900FD), // Couleur de l'application universitaire
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NewsCard(
              title: 'Inauguration du Nouveau Bâtiment',
              date: '15 Septembre 2023',
              imageAsset: 'assets/iset.jpg', // Chemin de l'image depuis les assets
              description:
                  'Nous sommes heureux d\'inaugurer notre nouveau bâtiment qui offrira des installations modernes à nos étudiants.',
            ),
            NewsCard(
              title: 'Événement Culturel Annuel',
              date: '22 Septembre 2023',
              imageAsset: 'assets/iset.jpg', // Chemin de l'image depuis les assets
              description:
                  'Ne manquez pas notre événement culturel annuel qui mettra en valeur la richesse de notre diversité culturelle.',
            ),
            // Ajoutez d'autres cartes d'actualités ici
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String date;
  final String imageAsset;
  final String description;

  NewsCard({
    required this.title,
    required this.date,
    required this.imageAsset,
    required this.description,
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
              imageAsset, // Chemin de l'image depuis les assets
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
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
