import 'package:flutter_lernkarten_app_test/core/common/usecase/usecase.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/repositories/decks_repository.dart';

class WatchDecks implements StreamUsecaseWithoutParams<List<DeckEntity>> {
  final DecksRepository _decksRepository;

  WatchDecks(this._decksRepository);

  @override
  Stream<List<DeckEntity>> call() {
    return _decksRepository.watchDecks();
  }
}
