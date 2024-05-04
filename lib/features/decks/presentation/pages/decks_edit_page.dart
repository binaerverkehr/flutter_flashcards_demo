import 'package:flutter/material.dart';
import 'package:flutter_lernkarten_app_test/core/utils/test_data.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/card_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';

class DecksEditPage extends StatefulWidget {
  const DecksEditPage({
    Key? key,
    required this.deck,
  }) : super(key: key);

  final DeckEntity deck;

  @override
  State<DecksEditPage> createState() => _DecksEditPageState();
}

class _DecksEditPageState extends State<DecksEditPage> {
  late TextEditingController _deckNameController;
  late List<CardEntity> _cards;

  late List<TextEditingController> frontControllers;
  late List<TextEditingController> backControllers;

  @override
  void initState() {
    // Initialize the deck name controller with the deck name
    _deckNameController = TextEditingController(text: widget.deck.name);
    // Initialize the cards with the cards from the deck
    _cards = [...widget.deck.cards];

    // Initialize a list of controllers for the front and back of the cards
    frontControllers = List.generate(_cards.length, (index) => TextEditingController(text: _cards[index].front));
    backControllers = List.generate(_cards.length, (index) => TextEditingController(text: _cards[index].back));

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
        title: const Text("Edit deck"),
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
                // Create a empty list of cards
                final cards = <CardEntity>[];

                // Use same deckId
                final deckId = widget.deck.id;

                // Add all the cards to the list
                for (var i = 0; i < frontControllers.length; i++) {
                  final cardEntity = CardEntity(
                    front: frontControllers[i].text,
                    back: backControllers[i].text,
                  );
                  cards.add(cardEntity);
                }

                // Create a new deck with the updated name and cards
                final newDeck = DeckEntity(
                  id: deckId,
                  name: _deckNameController.text,
                  cards: cards,
                );

                // Update the deck in the kTestDeckList
                final index = kTestDeckList.indexWhere((deck) => deck.id == widget.deck.id);
                kTestDeckList[index] = newDeck;

                // Go back to the previous page
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
                    key: Key("${_cards[index]} $index ${_cards[index].front} ${_cards[index].back}"),
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
                        key: ValueKey(_cards[index].toString() + index.toString()),
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
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  controller: backControllers[index],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newCard = CardEntity(front: '', back: '');

          setState(() {
            _cards = [..._cards, newCard];
            frontControllers.add(TextEditingController());
            backControllers.add(TextEditingController());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
