import 'package:flutter_lernkarten_app_test/features/decks/data/repositories/decks_repository_impl.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/add_deck.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/delete_deck_by_id.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/get_deck_by_id.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/update_deck.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/usecases/watch_decks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'decks_controller.g.dart';

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

  Future<bool> deleteDeckById(int deckId) async {
    return await _deleteDeckById(deckId);
  }

  Future<DeckEntity?> getDeckById(int deckId) async {
    return await _getDeckById(deckId);
  }
}

@riverpod
DecksController decksController(DecksControllerRef ref) {
  final decksRepository = ref.watch(decksRepositoryProvider);

  final addDeck = AddDeck(decksRepository);
  final watchDecks = WatchDecks(decksRepository);
  final updateDeck = UpdateDeck(decksRepository);
  final deleteDeckById = DeleteDeckById(decksRepository);
  final getDeckById = GetDeckById(decksRepository);

  return DecksController(
    addDeck,
    watchDecks,
    updateDeck,
    deleteDeckById,
    getDeckById,
  );
}

@riverpod
Stream<List<DeckEntity>> decksStream(DecksStreamRef ref) {
  final decksController = ref.watch(decksControllerProvider);
  return decksController.watchDecks();
}

@riverpod
Future<void> addDeck(AddDeckRef ref, DeckEntity deck) async {
  final decksController = ref.watch(decksControllerProvider);
  return decksController.addDeck(deck);
}

@riverpod
Future<void> updateDeck(UpdateDeckRef ref, DeckEntity updatedDeck) async {
  final decksController = ref.watch(decksControllerProvider);
  await decksController.updateDeck(updatedDeck);
}

@riverpod
Future<bool> deleteDeckById(DeleteDeckByIdRef ref, int deckId) async {
  final decksController = ref.watch(decksControllerProvider);
  return await decksController.deleteDeckById(deckId);
}

@riverpod
Future<DeckEntity?> getDeckById(GetDeckByIdRef ref, int deckId) async {
  final decksController = ref.watch(decksControllerProvider);
  return await decksController.getDeckById(deckId);
}
