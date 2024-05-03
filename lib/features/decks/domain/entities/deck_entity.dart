import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck_entity.freezed.dart';

@Freezed(copyWith: false, equal: true, makeCollectionsUnmodifiable: false)
class DeckEntity with _$DeckEntity {
  factory DeckEntity({
    required int id,
    required String name,
    required List<CardEntity> cards,
  }) = _DeckEntity;
}

extension DeckEntityX on DeckEntity {
  // Add card to deck
  void addCard(CardEntity card) => cards.add(card);

  // Get number of cards in deck
  int get count => cards.length;
}






