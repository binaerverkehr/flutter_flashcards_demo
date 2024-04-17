import 'package:flutter_lernkarten_app_test/core/common/usecase/usecase.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/repositories/decks_repository.dart';

class GetDeckById implements FutureUsecaseWithParams<DeckEntity?, int> {
  final DecksRepository _decksRepository;

  GetDeckById(this._decksRepository);

  @override
  Future<DeckEntity?> call(int deckId) {
    return _decksRepository.getDeckById(deckId);
  }
}
