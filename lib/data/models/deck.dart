import 'package:flash/data/models/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'deck.freezed.dart';
part 'deck.g.dart';

@freezed
class Deck with _$Deck {
  @HiveType(typeId: 2)
  const factory Deck({
    @HiveField(0) required String category,
    @HiveField(1) required String title,
    @HiveField(2) required String nickname,
    @HiveField(3) required List<Flashcard> flashcards,
    @HiveField(4) required int defaultFlashcardsLength,
  }) = _Deck;

  factory Deck.empty() {
    return const Deck(
      category: '',
      title: '',
      nickname: '',
      flashcards: [],
      defaultFlashcardsLength: 0,
    );
  }
}
