import 'package:flutter_lernkarten_app_test/features/decks/domain/entities/card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
@Embedded(ignore: {'copyWith', 'toEntity', 'fromEntity'})
class CardModel with _$CardModel implements CardEntity {
  factory CardModel({
    required String front,
    required String back,
  }) = _CardModel;

  const CardModel._();

  factory CardModel.fromEntity(CardEntity entity) {
    return CardModel(
      front: entity.front,
      back: entity.back,
    );
  }

  CardEntity toEntity() {
    return CardEntity(
      front: front,
      back: back,
    );
  }
}
