import 'package:flutter/material.dart';
import 'package:flutter_lernkarten_app_test/core/utils/test_data.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/card_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';

class DecksCreatePage extends StatefulWidget {
  const DecksCreatePage({
    Key? key,
  }) : super(key: key);

  @override
  State<DecksCreatePage> createState() => _DecksCreatePageState();
}

class _DecksCreatePageState extends State<DecksCreatePage> {
  late TextEditingController _deckNameController;
  late List<CardEntity> _cards;

  late List<TextEditingController> frontControllers;
  late List<TextEditingController> backControllers;

  @override
  void initState() {
    // Initialize the deck name controller and the list of cards
    _deckNameController = TextEditingController(text: "");
    _cards = [];

    // Initialize a list of controllers for the front and back of the cards
    frontControllers = List.generate(_cards.length, (index) => TextEditingController(text: ''));
    backControllers = List.generate(_cards.length, (index) => TextEditingController(text: ''));

    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
    for (final controller in frontControllers) {
      controller.dispose();
    }
    for (final controller in backControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new deck"),
        actions: [
          IconButton(
            onPressed: () async {
              // If any of the text fields are empty, return
              if (frontControllers.any((controller) => controller.text.isEmpty) ||
                  backControllers.any((controller) => controller.text.isEmpty)) {
                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All cards must have a value on the front and back')),
                );
              } else if (_cards.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('The deck must have at least one card')),
                );
              } else if (_deckNameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('The deck must have a name')),
                );
              } else {
                // Create list of cards from the controllers
                final cards = <CardEntity>[];

                final newDeckId = kTestDeckList.length + 1;

                for (var i = 0; i < frontControllers.length; i++) {
                  final cardEntity = CardEntity(
                    deckId: newDeckId,
                    front: frontControllers[i].text,
                    back: backControllers[i].text,
                  );
                  cards.add(cardEntity);
                }

                // Create a new deck with the updated name and cards
                final newDeck = DeckEntity(
                  id: newDeckId,
                  name: _deckNameController.text,
                  cards: cards,
                );

                // Add the new deck to the list of decks
                kTestDeckList.add(newDeck);

                // Navigate back to the deck list page
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _deckNameController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Deck name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ReorderableListView.builder(
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  final frontText = frontControllers[index].text;
                  final backText = backControllers[index].text;

                  final frontTextIsEmpty = frontText.isEmpty;
                  final backTextIsEmpty = backText.isEmpty;

                  final hasEmptyFields = frontTextIsEmpty || backTextIsEmpty;

                  return Dismissible(
                    // key using the id of the card
                    key: ValueKey(_cards[index].deckId.toString() + index.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        _cards.removeAt(index);
                        frontControllers.removeAt(index);
                        backControllers.removeAt(index);
                      });
                    },
                    background: Container(color: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ExpansionTile(
                        //initiallyExpanded: true,
                        shape: ShapeBorder.lerp(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          1,
                        ),
                        key: ValueKey(_cards[index].deckId + index),
                        title: Text(
                          'Card ${index + 1}',
                          style: TextStyle(color: hasEmptyFields ? Colors.red : null),
                        ),

                        trailing: const Icon(Icons.arrow_drop_down),

                        collapsedShape: ShapeBorder.lerp(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          1,
                        ),
                        iconColor: Colors.blue, // Icon color when expanded
                        textColor: hasEmptyFields ? Colors.red : Colors.blue, // Text color when expanded
                        childrenPadding: const EdgeInsets.all(8.0), // Pa
                        children: <Widget>[
                          // Two text fields
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: frontControllers[index],
                                  //initialValue: card.front,
                                  decoration: InputDecoration(
                                    focusColor: frontTextIsEmpty ? Colors.red : Colors.blue,
                                    labelText: 'Enter front side text',
                                    labelStyle: TextStyle(
                                      color: frontTextIsEmpty ? Colors.red : Colors.blue,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: frontTextIsEmpty ? Colors.red : Colors.blue,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      frontControllers[index].text = value;
                                    });

                                    //debugPrint("Front: ${frontControllers[index].text}");
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  controller: backControllers[index],
                                  //initialValue: card.back,
                                  decoration: InputDecoration(
                                    focusColor: backTextIsEmpty ? Colors.red : Colors.blue,
                                    labelText: 'Enter back side text',
                                    labelStyle: TextStyle(
                                      color: backTextIsEmpty ? Colors.red : Colors.blue,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: backTextIsEmpty ? Colors.red : Colors.blue,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      backControllers[index].text = value;
                                    });

                                    //debugPrint("Back: ${backControllers[index].text}");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final card = _cards.removeAt(oldIndex);
                    _cards.insert(newIndex, card);

                    final frontController = frontControllers.removeAt(oldIndex);
                    frontControllers.insert(newIndex, frontController);

                    final backController = backControllers.removeAt(oldIndex);
                    backControllers.insert(newIndex, backController);
                  });
                },
              ),
            ),
          ],
        ),
      ),
      // Add a new expansion tile to add a new card
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _cards.add(CardEntity(front: '', back: '', deckId: _cards.length + 1));
            frontControllers.add(TextEditingController());
            backControllers.add(TextEditingController());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
