// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Deck _$$_DeckFromJson(Map<String, dynamic> json) => _$_Deck(
      category: json['category'] as String,
      title: json['title'] as String,
      user: json['user'] as String,
      deck: (json['deck'] as List<dynamic>)
          .map((e) => Flashcard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DeckToJson(_$_Deck instance) => <String, dynamic>{
      'category': instance.category,
      'title': instance.title,
      'user': instance.user,
      'deck': instance.deck,
    };
