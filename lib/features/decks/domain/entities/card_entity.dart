import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_entity.freezed.dart';

@Freezed(copyWith: false, equal: true)
class CardEntity with _$CardEntity {
  factory CardEntity({
    required int deckId,
    required String front,
    required String back,
  }) = _CardEntity;
}
