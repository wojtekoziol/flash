import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard.freezed.dart';
part 'flashcard.g.dart';

@freezed
class Flashcard with _$Flashcard {
  const factory Flashcard({
    required String question,
    required String answer,
  }) = _Flashcard;

  factory Flashcard.fromJson(Map<String, Object?> json) =>
      _$FlashcardFromJson(json);
}