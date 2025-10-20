// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$BookingResponseToJson(BookingResponse instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};
