import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bibliothèque en Ligne'),
        backgroundColor: Color.fromARGB(255, 25, 0, 253),
      ),
      body: ListView(
        children: [
          CategoryList(categories: [
            'Livres',
            'Support de cours',
            'Rapport de Stage et PFE ',
          ]),
          BookList(
            category: 'Livres',
            books: [
              Book(title: 'JAVA', imageUrl: 'assets/java.jpg', url: 'lien_vers_livre1'),
              Book(title: 'PostgreSQL', imageUrl: 'assets/Postgr.jpg', url: 'lien_vers_livre2'),
              // Ajoutez plus de livres pour cette catégorie
            ],
          ),
          BookList(
            category: 'Support de cours',
            books: [
              Book(title: 'Big Data', imageUrl: 'assets/data.jpg', url: 'lien_vers_livre3'),
              Book(title: 'Cloud', imageUrl: 'assets/cloudin.jpg', url: 'lien_vers_livre4'),
              // Ajoutez plus de livres pour cette catégorie
            ],
          ),
          BookList(
            category: 'Rapport de Stage et PFE ',
            books: [
              Book(title: 'Stage 1ere electro', imageUrl: 'assets/stage1.jpg', url: 'lien_vers_livre5'),
              // Ajoutez plus de livres pour cette catégorie
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final List<String> categories;

  CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((category) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Mettez ici le code pour afficher les livres de cette catégorie
                    },
                    child: Text(category),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class BookList extends StatelessWidget {
  final String category;
  final List<Book> books;

  BookList({required this.category, required this.books});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: books
                .map((book) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Mettez ici le code pour ouvrir le livre en ligne
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                image: DecorationImage(
                                  image: AssetImage(book.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              book.title,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class Book {
  final String title;
  final String imageUrl;
  final String url;

  Book({required this.title, required this.imageUrl, required this.url});
}
