// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: Map<String, String>.from(json['data'] as Map),
    );
