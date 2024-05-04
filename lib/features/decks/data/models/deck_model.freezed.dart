// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeckModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<CardModel> get cards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeckModelCopyWith<DeckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckModelCopyWith<$Res> {
  factory $DeckModelCopyWith(DeckModel value, $Res Function(DeckModel) then) =
      _$DeckModelCopyWithImpl<$Res, DeckModel>;
  @useResult
  $Res call({int id, String name, List<CardModel> cards});
}

/// @nodoc
class _$DeckModelCopyWithImpl<$Res, $Val extends DeckModel>
    implements $DeckModelCopyWith<$Res> {
  _$DeckModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cards = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeckModelImplCopyWith<$Res>
    implements $DeckModelCopyWith<$Res> {
  factory _$$DeckModelImplCopyWith(
          _$DeckModelImpl value, $Res Function(_$DeckModelImpl) then) =
      __$$DeckModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, List<CardModel> cards});
}

/// @nodoc
class __$$DeckModelImplCopyWithImpl<$Res>
    extends _$DeckModelCopyWithImpl<$Res, _$DeckModelImpl>
    implements _$$DeckModelImplCopyWith<$Res> {
  __$$DeckModelImplCopyWithImpl(
      _$DeckModelImpl _value, $Res Function(_$DeckModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cards = null,
  }) {
    return _then(_$DeckModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ));
  }
}

/// @nodoc

class _$DeckModelImpl extends _DeckModel {
  _$DeckModelImpl(
      {required this.id,
      required this.name,
      required final List<CardModel> cards})
      : _cards = cards,
        super._();

  @override
  final int id;
  @override
  final String name;
  final List<CardModel> _cards;
  @override
  List<CardModel> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'DeckModel(id: $id, name: $name, cards: $cards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeckModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeckModelImplCopyWith<_$DeckModelImpl> get copyWith =>
      __$$DeckModelImplCopyWithImpl<_$DeckModelImpl>(this, _$identity);
}

abstract class _DeckModel extends DeckModel {
  factory _DeckModel(
      {required final int id,
      required final String name,
      required final List<CardModel> cards}) = _$DeckModelImpl;
  _DeckModel._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  List<CardModel> get cards;
  @override
  @JsonKey(ignore: true)
  _$$DeckModelImplCopyWith<_$DeckModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
