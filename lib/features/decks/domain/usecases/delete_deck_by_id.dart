import 'package:flutter_lernkarten_app_test/core/common/usecase/usecase.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/repositories/decks_repository.dart';

class DeleteDeckById implements FutureUsecaseWithParams<bool, int> {
  final DecksRepository _decksRepository;

  DeleteDeckById(this._decksRepository);

  @override
  Future<bool> call(int deckId) {
    return _decksRepository.deleteDeckById(deckId);
  }
}
