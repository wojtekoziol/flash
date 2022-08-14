// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'deck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Deck _$DeckFromJson(Map<String, dynamic> json) {
  return _Deck.fromJson(json);
}

/// @nodoc
mixin _$Deck {
  String get category => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  List<Flashcard> get deck => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckCopyWith<Deck> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCopyWith<$Res> {
  factory $DeckCopyWith(Deck value, $Res Function(Deck) then) =
      _$DeckCopyWithImpl<$Res>;
  $Res call({String category, String title, String user, List<Flashcard> deck});
}

/// @nodoc
class _$DeckCopyWithImpl<$Res> implements $DeckCopyWith<$Res> {
  _$DeckCopyWithImpl(this._value, this._then);

  final Deck _value;
  // ignore: unused_field
  final $Res Function(Deck) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? title = freezed,
    Object? user = freezed,
    Object? deck = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      deck: deck == freezed
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
    ));
  }
}

/// @nodoc
abstract class _$$_DeckCopyWith<$Res> implements $DeckCopyWith<$Res> {
  factory _$$_DeckCopyWith(_$_Deck value, $Res Function(_$_Deck) then) =
      __$$_DeckCopyWithImpl<$Res>;
  @override
  $Res call({String category, String title, String user, List<Flashcard> deck});
}

/// @nodoc
class __$$_DeckCopyWithImpl<$Res> extends _$DeckCopyWithImpl<$Res>
    implements _$$_DeckCopyWith<$Res> {
  __$$_DeckCopyWithImpl(_$_Deck _value, $Res Function(_$_Deck) _then)
      : super(_value, (v) => _then(v as _$_Deck));

  @override
  _$_Deck get _value => super._value as _$_Deck;

  @override
  $Res call({
    Object? category = freezed,
    Object? title = freezed,
    Object? user = freezed,
    Object? deck = freezed,
  }) {
    return _then(_$_Deck(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      deck: deck == freezed
          ? _value._deck
          : deck // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Deck implements _Deck {
  const _$_Deck(
      {required this.category,
      required this.title,
      required this.user,
      required final List<Flashcard> deck})
      : _deck = deck;

  factory _$_Deck.fromJson(Map<String, dynamic> json) => _$$_DeckFromJson(json);

  @override
  final String category;
  @override
  final String title;
  @override
  final String user;
  final List<Flashcard> _deck;
  @override
  List<Flashcard> get deck {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deck);
  }

  @override
  String toString() {
    return 'Deck(category: $category, title: $title, user: $user, deck: $deck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Deck &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other._deck, _deck));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(_deck));

  @JsonKey(ignore: true)
  @override
  _$$_DeckCopyWith<_$_Deck> get copyWith =>
      __$$_DeckCopyWithImpl<_$_Deck>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckToJson(
      this,
    );
  }
}

abstract class _Deck implements Deck {
  const factory _Deck(
      {required final String category,
      required final String title,
      required final String user,
      required final List<Flashcard> deck}) = _$_Deck;

  factory _Deck.fromJson(Map<String, dynamic> json) = _$_Deck.fromJson;

  @override
  String get category;
  @override
  String get title;
  @override
  String get user;
  @override
  List<Flashcard> get deck;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCopyWith<_$_Deck> get copyWith => throw _privateConstructorUsedError;
}
