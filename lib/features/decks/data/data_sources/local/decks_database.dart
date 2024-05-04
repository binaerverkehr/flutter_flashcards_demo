import 'package:flutter_lernkarten_app_test/features/decks/data/models/card_model.dart';
import 'package:flutter_lernkarten_app_test/features/decks/data/models/deck_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'decks_database.g.dart';

class DecksDatabase {
  DecksDatabase._privateConstructor();
  static final DecksDatabase _instance = DecksDatabase._privateConstructor();

  factory DecksDatabase() {
    return _instance;
  }

  late Isar _isar;

  // Getter
  Isar get isar => _isar;

  // Initialize Isar
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = Isar.open(
      directory: dir.path,
      schemas: [
        DeckModelSchema,
        CardModelSchema,
      ],
    );
  }

  // Watch decks
  Stream<List<DeckModel>> watchDecks() {
    try {
      final decksStream = _isar.deckModels.where().sortByIdDesc().watch(fireImmediately: true);
      return decksStream;
    } catch (e) {
      throw Exception('DatabaseError: watchDecks failed');
    }
  }

  // Get deck by id
  Future<DeckModel?> getDeckById(int id) async {
    try {
      return _isar.deckModels.get(id);
    } catch (e) {
      throw Exception('DatabaseError: getDeckById failed');
    }
  }

  // Add deck
  Future<void> addDeck(DeckModel deckModel) async {
    try {
      final newDeck = deckModel.copyWith(
        id: _isar.deckModels.autoIncrement(),
      );

      _isar.write((isar) async {
        isar.deckModels.put(newDeck);
      });
    } catch (e) {
      throw Exception('DatabaseError: addDeck failed');
    }
  }

  // Update deck
  Future<void> updateDeck(DeckModel deck) async {
    try {
      _isar.write((isar) async {
        isar.deckModels.put(deck);
      });
    } catch (e) {
      throw Exception('DatabaseError: updateDeck failed');
    }
  }

  // Delete deck
  Future<bool> deleteDeckById(int id) async {
    try {
      bool isDeleted = false;
      _isar.write((isar) async {
        isDeleted = isar.deckModels.delete(id);
      });
      return isDeleted;
    } catch (e) {
      throw Exception('DatabaseError: deleteDeckById failed');
    }
  }

  // Close Isar
  Future<void> close() async {
    _isar.close();
  }
}

@Riverpod(keepAlive: true)
DecksDatabase decksDatabase(DecksDatabaseRef ref) {
  return DecksDatabase();
}
