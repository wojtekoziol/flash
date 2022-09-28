import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard.freezed.dart';

@freezed
class Flashcard with _$Flashcard {
  const factory Flashcard({
    required String question,
    required String answer,
    required int index,
  }) = _Flashcard;

  factory Flashcard.empty(int index) {
    return Flashcard(
      question: '',
      answer: '',
      index: index,
    );
  }
}
