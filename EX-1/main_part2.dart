import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My Hobbies')),
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HobbyCard(
                icon: Icons.flight_takeoff,
                title: 'Travelling',
                color: Colors.green,
              ),
              SizedBox(height: 10),
              HobbyCard(
                icon: Icons.skateboarding,
                title: 'Skating',
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const HobbyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
