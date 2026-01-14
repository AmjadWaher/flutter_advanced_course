// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCard _$SavedCardFromJson(Map<String, dynamic> json) => CreditCard(
  id: json['id'] as String,
  brand: json['brand'] as String,
  last4: json['last4'] as String,
  expMonth: (json['expMonth'] as num).toInt(),
  expYear: (json['expYear'] as num).toInt(),
);
