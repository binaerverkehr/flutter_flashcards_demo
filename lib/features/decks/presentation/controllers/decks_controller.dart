import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/add_deck.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/delete_deck_by_id.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/get_deck_by_id.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/update_deck.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/watch_decks.dart';

class DecksController {
  final AddDeck _addDeck;
  final WatchDecks _watchDecks;
  final UpdateDeck _updateDeck;
  final DeleteDeckById _deleteDeckById;
  final GetDeckById _getDeckById;

  DecksController(
    this._addDeck,
    this._watchDecks,
    this._updateDeck,
    this._deleteDeckById,
    this._getDeckById,
  );

  Future<void> addDeck(DeckEntity deck) async {
    return await _addDeck(deck);
  }

  Stream<List<DeckEntity>> watchDecks() {
    return _watchDecks();
  }

  Future<void> updateDeck(DeckEntity deckEntity) async {
    return await _updateDeck(deckEntity);
  }

  Future<bool> deleteDeckBy(int deckId) async {
    return await _deleteDeckById(deckId);
  }

  Future<DeckEntity?> getDeckById(int deckId) async {
    return await _getDeckById(deckId);
  }
}
