import 'package:flutter_lernkarten_app_test/core/common/usecase/usecase.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/repositories/decks_repository.dart';

class UpdateDeck implements FutureUsecaseWithParams<void, DeckEntity> {
  final DecksRepository _decksRepository;

  UpdateDeck(this._decksRepository);

  @override
  Future<void> call(DeckEntity deck) {
    return _decksRepository.updateDeck(deck);
  }
}
