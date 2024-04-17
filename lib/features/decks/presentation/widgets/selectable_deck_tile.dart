import 'package:flutter/material.dart';
import 'package:flutter_lernkarten_app_test/core/utils/test_data.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/pages/decks_edit_page.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/pages/decks_play_page.dart';

class SelectableDeckTile extends StatelessWidget {
  const SelectableDeckTile({
    Key? key,
    required this.deck,
  }) : super(key: key);

  final DeckEntity deck;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DecksPlayPage(deck: deck);
            },
          ),
        );
      },
      child: Card(
        elevation: 0,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.layers, size: 50),
                  Text(
                    deck.name,
                    style: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  // Card count small text
                  const SizedBox(height: 8),
                  Text(
                    //* Make plural if there is more than one card
                    "${deck.cards.length} card${deck.cards.length > 1 ? 's' : ''}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton<int>(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text("Edit"),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text("Delete", style: TextStyle(color: Colors.red)),
                  ),
                ],
                onSelected: (value) {
                  if (value == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DecksEditPage(deck: deck);
                        },
                      ),
                    );
                  } else if (value == 2) {
                    // Delete the deck
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Delete Deck'),
                          content: Text(
                            'Do you really want to delete the deck "${deck.name}"?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Delete the deck
                                kTestDeckList.remove(deck);

                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
