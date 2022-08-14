import 'package:flash/flashcards/models/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck.freezed.dart';
part 'deck.g.dart';

@freezed
class Deck with _$Deck {
  const factory Deck({
    required String category,
    required String title,
    required String user,
    required List<Flashcard> deck,
  }) = _Deck;

  factory Deck.fromJson(Map<String, Object?> json) => _$DeckFromJson(json);
}
