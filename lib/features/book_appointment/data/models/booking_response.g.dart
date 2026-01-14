// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: BookingResult.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingResponseToJson(BookingResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

BookingResult _$BookingResultFromJson(Map<String, dynamic> json) =>
    BookingResult(
      appointmentId: (json['appointmentId'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$BookingResultToJson(BookingResult instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'amount': instance.amount,
    };
