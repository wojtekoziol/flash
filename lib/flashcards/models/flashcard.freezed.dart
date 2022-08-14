// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flashcard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Flashcard _$FlashcardFromJson(Map<String, dynamic> json) {
  return _Flashcard.fromJson(json);
}

/// @nodoc
mixin _$Flashcard {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlashcardCopyWith<Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardCopyWith<$Res> {
  factory $FlashcardCopyWith(Flashcard value, $Res Function(Flashcard) then) =
      _$FlashcardCopyWithImpl<$Res>;
  $Res call({String question, String answer});
}

/// @nodoc
class _$FlashcardCopyWithImpl<$Res> implements $FlashcardCopyWith<$Res> {
  _$FlashcardCopyWithImpl(this._value, this._then);

  final Flashcard _value;
  // ignore: unused_field
  final $Res Function(Flashcard) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FlashcardCopyWith<$Res> implements $FlashcardCopyWith<$Res> {
  factory _$$_FlashcardCopyWith(
          _$_Flashcard value, $Res Function(_$_Flashcard) then) =
      __$$_FlashcardCopyWithImpl<$Res>;
  @override
  $Res call({String question, String answer});
}

/// @nodoc
class __$$_FlashcardCopyWithImpl<$Res> extends _$FlashcardCopyWithImpl<$Res>
    implements _$$_FlashcardCopyWith<$Res> {
  __$$_FlashcardCopyWithImpl(
      _$_Flashcard _value, $Res Function(_$_Flashcard) _then)
      : super(_value, (v) => _then(v as _$_Flashcard));

  @override
  _$_Flashcard get _value => super._value as _$_Flashcard;

  @override
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$_Flashcard(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Flashcard implements _Flashcard {
  const _$_Flashcard({required this.question, required this.answer});

  factory _$_Flashcard.fromJson(Map<String, dynamic> json) =>
      _$$_FlashcardFromJson(json);

  @override
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'Flashcard(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Flashcard &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$_FlashcardCopyWith<_$_Flashcard> get copyWith =>
      __$$_FlashcardCopyWithImpl<_$_Flashcard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlashcardToJson(
      this,
    );
  }
}

abstract class _Flashcard implements Flashcard {
  const factory _Flashcard(
      {required final String question,
      required final String answer}) = _$_Flashcard;

  factory _Flashcard.fromJson(Map<String, dynamic> json) =
      _$_Flashcard.fromJson;

  @override
  String get question;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$_FlashcardCopyWith<_$_Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}
