// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flashcards_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlashcardsState {
  List<Flashcard> get deck => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Flashcard> deck, int index) question,
    required TResult Function(List<Flashcard> deck, int index) answer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Flashcard> deck, int index)? question,
    TResult Function(List<Flashcard> deck, int index)? answer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Flashcard> deck, int index)? question,
    TResult Function(List<Flashcard> deck, int index)? answer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Question value) question,
    required TResult Function(_Answer value) answer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Question value)? question,
    TResult Function(_Answer value)? answer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Question value)? question,
    TResult Function(_Answer value)? answer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardsStateCopyWith<FlashcardsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardsStateCopyWith<$Res> {
  factory $FlashcardsStateCopyWith(
          FlashcardsState value, $Res Function(FlashcardsState) then) =
      _$FlashcardsStateCopyWithImpl<$Res>;
  $Res call({List<Flashcard> deck, int index});
}

/// @nodoc
class _$FlashcardsStateCopyWithImpl<$Res>
    implements $FlashcardsStateCopyWith<$Res> {
  _$FlashcardsStateCopyWithImpl(this._value, this._then);

  final FlashcardsState _value;
  // ignore: unused_field
  final $Res Function(FlashcardsState) _then;

  @override
  $Res call({
    Object? deck = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      deck: deck == freezed
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res>
    implements $FlashcardsStateCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  $Res call({List<Flashcard> deck, int index});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$FlashcardsStateCopyWithImpl<$Res>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, (v) => _then(v as _$_Question));

  @override
  _$_Question get _value => super._value as _$_Question;

  @override
  $Res call({
    Object? deck = freezed,
    Object? index = freezed,
  }) {
    return _then(_$_Question(
      deck: deck == freezed
          ? _value._deck
          : deck // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Question implements _Question {
  const _$_Question({required final List<Flashcard> deck, this.index = 0})
      : _deck = deck;

  final List<Flashcard> _deck;
  @override
  List<Flashcard> get deck {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deck);
  }

  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'FlashcardsState.question(deck: $deck, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            const DeepCollectionEquality().equals(other._deck, _deck) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_deck),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Flashcard> deck, int index) question,
    required TResult Function(List<Flashcard> deck, int index) answer,
  }) {
    return question(deck, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Flashcard> deck, int index)? question,
    TResult Function(List<Flashcard> deck, int index)? answer,
  }) {
    return question?.call(deck, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Flashcard> deck, int index)? question,
    TResult Function(List<Flashcard> deck, int index)? answer,
    required TResult orElse(),
  }) {
    if (question != null) {
      return question(deck, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Question value) question,
    required TResult Function(_Answer value) answer,
  }) {
    return question(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Question value)? question,
    TResult Function(_Answer value)? answer,
  }) {
    return question?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Question value)? question,
    TResult Function(_Answer value)? answer,
    required TResult orElse(),
  }) {
    if (question != null) {
      return question(this);
    }
    return orElse();
  }
}

abstract class _Question implements FlashcardsState {
  const factory _Question(
      {required final List<Flashcard> deck, final int index}) = _$_Question;

  @override
  List<Flashcard> get deck;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res>
    implements $FlashcardsStateCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  $Res call({List<Flashcard> deck, int index});
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res> extends _$FlashcardsStateCopyWithImpl<$Res>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, (v) => _then(v as _$_Answer));

  @override
  _$_Answer get _value => super._value as _$_Answer;

  @override
  $Res call({
    Object? deck = freezed,
    Object? index = freezed,
  }) {
    return _then(_$_Answer(
      deck: deck == freezed
          ? _value._deck
          : deck // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Answer implements _Answer {
  const _$_Answer({required final List<Flashcard> deck, this.index = 0})
      : _deck = deck;

  final List<Flashcard> _deck;
  @override
  List<Flashcard> get deck {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deck);
  }

  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'FlashcardsState.answer(deck: $deck, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            const DeepCollectionEquality().equals(other._deck, _deck) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_deck),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Flashcard> deck, int index) question,
    required TResult Function(List<Flashcard> deck, int index) answer,
  }) {
    return answer(deck, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Flashcard> deck, int index)? question,
    TResult Function(List<Flashcard> deck, int index)? answer,
  }) {
    return answer?.call(deck, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Flashcard> deck, int index)? question,
    TResult Function(List<Flashcard> deck, int index)? answer,
    required TResult orElse(),
  }) {
    if (answer != null) {
      return answer(deck, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Question value) question,
    required TResult Function(_Answer value) answer,
  }) {
    return answer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Question value)? question,
    TResult Function(_Answer value)? answer,
  }) {
    return answer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Question value)? question,
    TResult Function(_Answer value)? answer,
    required TResult orElse(),
  }) {
    if (answer != null) {
      return answer(this);
    }
    return orElse();
  }
}

abstract class _Answer implements FlashcardsState {
  const factory _Answer(
      {required final List<Flashcard> deck, final int index}) = _$_Answer;

  @override
  List<Flashcard> get deck;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}
