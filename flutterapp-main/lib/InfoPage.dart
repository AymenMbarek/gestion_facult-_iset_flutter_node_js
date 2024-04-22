import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iset Tozeur")),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) {
              return ImageCard(index: index);
            },
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final int index;

  const ImageCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SecondPage(heroTag: index)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Hero(
              tag: index,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  _images[index]['url']!,
                  width: 200,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _images[index]['name']!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _images[index]['content']!,
                    style: Theme.of(context).textTheme.bodyLarge,
                    
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;

  const SecondPage({Key? key, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hero ListView Page 2")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(_images[heroTag]['url']!),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _images[heroTag]['name']!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Content goes here", // Replace with actual content
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> _images = [
  {
    'name': 'Votre Document ',
    'url': '../assets/1.png',
    'content': 'Le attestation de présence est prête',
  },
  {
    'name': 'Club ',
    'url': '../assets/undraw_Team_page_re_cffb.png',
    'content': 'un nouveau club est lancé dans des jours',
  },
  {
    'name': 'Cellule de écoute',
    'url': '../assets/undraw_Portfolio_website_re_jsdd.png',
    'content': 'Avec Madame IKRAM ',
  },
  {
    'name': 'Information de le iset',
    'url': '../assets/iset.jpg',
    'content': 'https://isett.rnu.tn/',
  },
  {
    'name': 'Association pour la vie étudiante',
    'url': '../assets/accteam.png',
    'content': 'association pour les etudiants de iset Tozeur ',
  },
  {
    'name': 'Administration',
    'url': '../assets/hh.png',
    'content': '',
  },
];
