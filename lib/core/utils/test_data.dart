import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/card_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';

final List<DeckEntity> kTestDeckList = [
  DeckEntity(
    id: 1,
    name: "Capitals",
    cards: [
      CardEntity(deckId: 1, front: "Germany", back: "Berlin"),
      CardEntity(deckId: 1, front: "France", back: "Paris"),
      CardEntity(deckId: 1, front: "Italy", back: "Rome"),
      CardEntity(deckId: 1, front: "Spain", back: "Madrid"),
      CardEntity(deckId: 1, front: "Portugal", back: "Lisbon"),
    ],
  ),
  DeckEntity(
    id: 2,
    name: "Programming",
    cards: [
      CardEntity(deckId: 2, front: "What is Flutter?", back: "A framework for building mobile applications"),
      CardEntity(deckId: 2, front: "What is Dart?", back: "The programming language used to build Flutter apps"),
      CardEntity(deckId: 2, front: "What is a Widget?", back: "The basic building block of a Flutter app"),
      CardEntity(deckId: 2, front: "What is a Stateful Widget?", back: "A widget that has a mutable state"),
      CardEntity(deckId: 2, front: "What is a Stateless Widget?", back: "A widget that does not have a mutable state"),
    ],
  ),
  DeckEntity(
    id: 3,
    name: "Math",
    cards: [
      CardEntity(deckId: 3, front: "What is 2 + 2?", back: "4"),
      CardEntity(deckId: 3, front: "What is 3 * 3?", back: "9"),
      CardEntity(deckId: 3, front: "What is 10 / 2?", back: "5"),
      CardEntity(deckId: 3, front: "What is 5 - 3?", back: "2"),
      CardEntity(deckId: 3, front: "What is 8 % 3?", back: "2"),
    ],
  ),
];
