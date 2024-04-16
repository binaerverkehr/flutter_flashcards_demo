import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck_entity.freezed.dart';

@Freezed(fromJson: false, toJson: false, copyWith: false, equal: true)
class DeckEntity with _$DeckEntity {
  factory DeckEntity({
    required int id,
    required String name,
    required List<CardEntity> cards,
  }) = _DeckEntity;
}
