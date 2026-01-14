// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_cards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedCardsResponse _$SavedCardsResponseFromJson(Map<String, dynamic> json) =>
    SavedCardsResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => CreditCard.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
