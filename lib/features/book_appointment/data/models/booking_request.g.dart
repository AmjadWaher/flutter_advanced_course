// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    BookingRequest(
      doctorId: json['doctorId'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
      price: (json['price'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
    );

Map<String, dynamic> _$BookingRequestToJson(BookingRequest instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'time': instance.time,
      'date': instance.date,
      'price': instance.price,
      'paymentMethod': instance.paymentMethod,
    };
