import 'package:flutter/material.dart';
import 'package:flutter_lernkarten_app_test/core/utils/test_data.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/pages/decks_create_page.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/widgets/selectable_deck_tile.dart';

class DecksGrid extends StatelessWidget {
  const DecksGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final decks = kTestDeckList;

    return GridView.builder(
      itemCount: decks.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        if (index == 0 || decks.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DecksCreatePage(),
                ));
              },
              child: const Card(
                elevation: 0,
                child: Center(
                  child: Icon(Icons.add, size: 64),
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SelectableDeckTile(deck: decks[index - 1]),
          );
        }
      },
    );
  }
}