import 'package:flutter/material.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/widgets/decks_grid.dart';

class DecksListPage extends StatelessWidget {
  const DecksListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decks'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(' Welcome ', style: TextStyle(fontSize: 32)),
                Text("User", style: TextStyle(fontSize: 32, color: Colors.purple, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text(' to your flashcard decks!', style: TextStyle(fontSize: 32)),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: DecksGrid()),
          ],
        ),
      ),
    );
  }
}