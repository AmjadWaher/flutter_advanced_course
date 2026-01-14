// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    PaymentRequest(
      appointmentId: (json['appointmentId'] as num).toInt(),
      paymentMethodId: json['paymentMethodId'] as String,
    );

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'paymentMethodId': instance.paymentMethodId,
    };
