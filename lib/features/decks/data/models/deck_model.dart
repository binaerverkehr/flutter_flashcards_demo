import 'package:flutter_lernkarten_app_test/features/decks/data/models/card_model.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/card_entity.dart';
import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/deck_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'deck_model.freezed.dart';
part 'deck_model.g.dart';

@freezed
@Collection(ignore: {'copyWith', 'toEntity', 'fromEntity'})
class DeckModel with _$DeckModel implements DeckEntity {
  factory DeckModel({
    required int id,
    required String name,
    required List<CardModel> cards,
  }) = _DeckModel;

  const DeckModel._();

  factory DeckModel.fromEntity(DeckEntity entity) {
    return DeckModel(
      id: entity.id,
      name: entity.name,
      cards: entity.cards.map((CardEntity e) => CardModel.fromEntity(e)).toList(),
    );
  }

  DeckEntity toEntity() {
    return DeckEntity(
      id: id as int,
      name: name,
      cards: cards.map((e) => e.toEntity()).toList(),
    );
  }
}
