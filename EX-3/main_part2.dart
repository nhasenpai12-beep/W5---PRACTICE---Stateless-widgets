import 'package:flutter/material.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'the best object language',
    imagePath: 'assets/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best UI framework',
    imagePath: 'assets/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best backend platform',
    imagePath: 'assets/firebase.png',
  );

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String description;
  final String imagePath;
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Products', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4.0,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image
                      Image.asset(
                        'assets/dart.png',
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 12.0),
                      // Product Title
                      const Text(
                        'Dart',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      // Product Description
                      const Text(
                        'the best object language',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
