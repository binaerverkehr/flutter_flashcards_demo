import 'package:flutter/material.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/controllers/decks_controller.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/pages/decks_create_page.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/widgets/selectable_deck_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DecksListPage extends ConsumerWidget {
  const DecksListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final decksStreamValue = ref.watch(decksStreamProvider);

    // Get current screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return decksStreamValue.when(
      data: (decks) => Scaffold(
        appBar: AppBar(
          title: const Text('Decks'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Wrap(
                children: [
                  Text(
                    'Welcome ',
                    style: TextStyle(fontSize: 32),
                  ),
                  Text("User",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const Row(
                children: [
                  Flexible(child: Text('to your flashcard decks!', style: TextStyle(fontSize: 24))),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: decks.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // Dependend on screenWidth, we want to show 1 or 2 cards in a row
                    crossAxisCount: screenWidth > 400 ? 2 : 1,
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
                ),
              ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
