import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';

abstract class DecksRepository {
  Future<void> addDeck(DeckEntity deck);
  Future<bool> deleteDeckById(int deckId);
  Future<DeckEntity?> getDeckById(int deckId);
  Stream<List<DeckEntity>> watchDecks();
  Future<void> updateDeck(DeckEntity newDeck);
}
