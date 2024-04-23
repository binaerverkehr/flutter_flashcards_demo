import 'package:flutter_lernkarten_app_test/features/decks/data/data_sources/local/decks_database.dart';
import 'package:flutter_lernkarten_app_test/features/decks/data/models/deck_model.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/repositories/decks_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'decks_repository_impl.g.dart';

class DecksRepositoryImpl implements DecksRepository {
  final DecksDatabase _decksDatabase;

  DecksRepositoryImpl(this._decksDatabase);

  @override
  Future<void> addDeck(DeckEntity deck) async {
    return await _decksDatabase.addDeck(DeckModel.fromEntity(deck));
  }

  @override
  Future<bool> deleteDeckById(int deckId) async {
    return await _decksDatabase.deleteDeckById(deckId);
  }

  @override
  Future<DeckEntity?> getDeckById(int deckId) async {
    return await _decksDatabase.getDeckById(deckId);
  }

  @override
  Future<void> updateDeck(DeckEntity newDeck) async {
    return await _decksDatabase.updateDeck(DeckModel.fromEntity(newDeck));
  }

  @override
  Stream<List<DeckEntity>> watchDecks() {
    return _decksDatabase.watchDecks();
  }
}

@riverpod
DecksRepository decksRepository(DecksRepositoryRef ref) {
  final decksDatabase = ref.watch(decksDatabaseProvider);
  return DecksRepositoryImpl(decksDatabase);
}
